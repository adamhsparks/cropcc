library(cropData)
library(weatherData)
library(maps)
library(vegan)

# library(geonames)

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

# weatherCA <- downloadGSOD(2003, 2005, stations = stationsSelected, silent = TRUE, tries = 2, overwrite = FALSE) 
weatherCA <- makeTableGSOD() 

# if this doesn't work, try to download the files with a download manager, see ?listFilesGSOD
# for this you can use the list of files created thusly
# listFilesGSOD(2003, 2005, stations=stationsSelected)

weatherCA <- na.omit(weatherCA)

# interpolate data
# to speed things up we select only the growing season to interpolate
# we suppose planting is on the 15th of May and harvest is on the 25th of August
ipW2003 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2003-5-15", "2003-9-25", stations = stationsSelected, silent=FALSE) #ignore the warnings
ipW2004 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2004-5-15", "2004-9-25", stations = stationsSelected)
ipW2005 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2005-5-15", "2005-9-25", stations = stationsSelected)
ipW <- rbind(ipW2003,ipW2004,ipW2005)

# add sowing and harvesting dates to trial
START <- paste(trial$Year, "5-15", sep="-")
END <- paste(trial$Year, "9-25", sep="-")
trial <- cbind(trial, START, END)

# add ecophysiological variables
TEMPSTRESS30 <- thermalStressSeasonal(30, ipW, trial, locs)
PREC <- precipitationSeasonal(ipW, trial)
RADIATION <- radiationSeasonal(ipW, trial, locs)
trial <- cbind(trial, TEMPSTRESS30, PREC, RADIATION)

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

