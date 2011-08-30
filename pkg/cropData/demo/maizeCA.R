require(cropData)
library(weatherData)
library(maps)
library(geonames)

data(stations)
setwd(paste(system.file(package="cropData"), "/external", sep=""))

# get crop data
trial <- read.csv(system.file("external/trialsCA.csv", package="cropData"))
locs <- read.csv(system.file("external/locationsCA.csv", package="cropData"))

# use geonames server to get altitude data for trial locations
# just for demonstration, the values are already in the table
# for(i in 1:dim(locs)[1]) {locs$ALT[i] <- GNsrtm3(locs$LAT[i],locs$LON[i])[1]}
# locs$ALT <- as.numeric(locs$ALT)

# select weather stations
stations <- stations[!is.na(stations$ALT),]
stationsSelected <- stationsExtent(c(-110,-60,5,25), stations)
stationsSelected <- stationsSelected[stationsSelected$CTRY != "CU",]
stationsSelected <- stationsSelected[stationsSelected$CTRY != "US",]
stationsSelected <- stationsSelected[stationsSelected$CTRY != "PU",]
stationsSelected <- stationsSelected[stationsSelected$CTRY != "",]

# visualize
plot(stationsSelected[c("LON","LAT")], pch=3, cex=.5)
points(locs[c("LON","LAT")], pch=15)
map("world",add=TRUE, interior=F)

listFilesGSOD(2003, 2005, stations=stationsSelected)

# if the following doesn´t work, try to download the files with a download manager
# for this you can use the file created in the last line of code above
# it is a long list with the URLs of the files to be downloaded
# see ?listFilesGSOD for more instructions

weatherCA <- downloadGSOD(2003, 2005, stations = stationsSelected, silent = TRUE, tries = 2, overwrite = FALSE) 
weatherCA <- makeTableGSOD() 

weatherCA <- na.omit(weatherCA)

# interpolate data
ipW2003 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2003-5-15", "2003-9-25", stations = stationsSelected) #ignore the warnings
ipW2004 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2004-5-15", "2004-9-25", stations = stationsSelected)
ipW2005 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2005-5-15", "2005-9-25", stations = stationsSelected)
ipW <- rbind(ipW2003,ipW2004,ipW2005)

START <- paste(trial$Year, "5-15", sep="-")
END <- paste(trial$Year, "9-25", sep="-")

TEMPSTRESS30 <- rep(NA, times=dim(trial)[1])
TEMPSTRESS35 <- rep(NA, times=dim(trial)[1])
TEMPSTRESS40 <- rep(NA, times=dim(trial)[1])
PRECTOTAL <- rep(NA, times=dim(trial)[1])
PRECCV <- rep(NA, times=dim(trial)[1])
RADIATION <- rep(NA, times=dim(trial)[1])
trial <- cbind(trial, START, END, TEMPSTRESS30, TEMPSTRESS35, TEMPSTRESS40, PRECTOTAL, PRECCV, RADIATION)

# temperature stress
trial["TEMPSTRESS30"] <- thermalStressSeasonal(30, ipW, trial, locs)
trial["TEMPSTRESS35"] <- thermalStressSeasonal(35, ipW, trial, locs)
trial["TEMPSTRESS40"] <- thermalStressSeasonal(40, ipW, trial, locs)

# precipitation
trial[c("PRECTOTAL","PRECCV")] <- precipitationSeasonal(ipW, trial)

# radiation
trial["RADIATION"] <- radiationSeasonal(ipW, trial, locs)

# first some visualization
pairs(trial)

model1 <- lm(log1p(Yield) ~ Plant.m2 + as.factor(Year) + as.factor(Variety) + as.factor(ID) + Variety:ID + Variety:Year, data=trial)
summary(model1)
step(model1)

model2 <- lm(log1p(Yield) ~ Plant.m2 + TEMPSTRESS30 + TEMPSTRESS35 + TEMPSTRESS40 + PRECTOTAL + RADIATION + as.factor(Year) + as.factor(ID), data = trial)
summary(model2)
step(model2)

model3 <- lm(log1p(Yield) ~ Variety + Plant.m2 + poly(TEMPSTRESS30,2) + poly(PRECTOTAL,2) + poly(RADIATION,2) + as.factor(Year) + as.factor(ID) + poly(TEMPSTRESS30):Variety, data = trial)
summary(model3)
step(model3)
