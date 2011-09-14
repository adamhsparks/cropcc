
data(stations)
stations <- stations[!is.na(stations$ALT),]
stationsSelected <- stationsExtent(c(-10,50,-40,10), stations)

WeatherFilesLobell <- downloadGSOD(1997, 2007, stationsSelected, silent = TRUE, tries = 2, localdir = NULL)
WeatherDataLobell <- makeTableGSOD()
save(WeatherDataLobell,file="WeatherDataLobell.Rdata")
data(WeatherDataLobell)

#stations <- read.csv("EIL.site.latlon.csv")
#stationsLobell <- stations[,c(1,6,5,7)]
#colnames(stationsLobell) <- c("ID", "LON", "LAT", "ALT")
#save(stationsLobell,file="stationsLobell.Rdata")
#data(stationsLobell)


#trialDataLobell <- processedDataLobell[,c(5,4,1,2,3)]
#colnames(trialDataLobell) <- c("ID","YEAR","YIELD","MANAGEMENT","GROUP")
#save(trialDataLobell,file="trialDataLobell.Rdata")
data(trialDataLobell)

#ipW <- interpolateDailyWeather(WeatherDataLobell, stationsLobell, "1999-1-1", "2007-12-31", stations = stationsSelected)

-----------------------

require(cropData)
library(weatherData)
library(maps)
library(geonames)

data(stations)
setwd(paste(system.file(package="cropData"), "/external", sep=""))

# get crop data
trial <- read.csv(system.file("external/maizedata.lobell.apr112011.csv", package="cropData"))
locs <- read.csv(system.file("external/EIL.site.latlon.csv", package="cropData"))
locs <- locs[locs$Latitude != 0,]
colnames(locs) <- c("ID","Country","Loc", "Region", "LAT", "LON", "ALT")

# select weather stations
stations <- stations[!is.na(stations$ALT),]
locsExtent <- c(min(locs$LON)-10,max(locs$LON)+10,min(locs$LAT)-10,max(locs$LAT)+10)
stationsSelected <- stationsExtent(locsExtent, stations)

# visualize
plot(stationsSelected[c("LON","LAT")], pch=3, cex=.5)
points(locs[c("LON","LAT")], pch=15)
map("world",add=TRUE, interior=F)

#download weather data

#weather <- downloadGSOD(1997, 2007, stations = stationsSelected, silent = FALSE, tries = 2, overwrite = FALSE) 

# if this doesn´t work or takes too long, try to download the files with a download manager
# for this you can use the file created thusly

#weather <- listFilesGSOD(1997, 2007, stations = stationsSelected, folder=NULL)

# it is a long list with the URLs of the files to be downloaded

weather <- makeTableGSOD() 
weather <- na.omit(weather)

# interpolate data
ipW1997 <- interpolateDailyWeather(weather, locs[c("ID", "LON", "LAT", "ALT")], "2003-5-15", "2003-9-25", stations = stationsSelected) #ignore the warnings
ipW1998 <- interpolateDailyWeather(weather, locs[c("ID", "LON", "LAT", "ALT")], "2004-5-15", "2004-9-25", stations = stationsSelected)
ipW1999 <- interpolateDailyWeather(weather, locs[c("ID", "LON", "LAT", "ALT")], "2005-5-15", "2005-9-25", stations = stationsSelected)
ipW2000 <- interpolateDailyWeather(weather, locs[c("ID", "LON", "LAT", "ALT")], "2003-5-15", "2003-9-25", stations = stationsSelected) 
ipW2001 <- interpolateDailyWeather(weather, locs[c("ID", "LON", "LAT", "ALT")], "2004-5-15", "2004-9-25", stations = stationsSelected)
ipW2002 <- interpolateDailyWeather(weather, locs[c("ID", "LON", "LAT", "ALT")], "2005-5-15", "2005-9-25", stations = stationsSelected)
ipW2003 <- interpolateDailyWeather(weather, locs[c("ID", "LON", "LAT", "ALT")], "2003-5-15", "2003-9-25", stations = stationsSelected) 
ipW2004 <- interpolateDailyWeather(weather, locs[c("ID", "LON", "LAT", "ALT")], "2004-5-15", "2004-9-25", stations = stationsSelected)
ipW2005 <- interpolateDailyWeather(weather, locs[c("ID", "LON", "LAT", "ALT")], "2005-5-15", "2005-9-25", stations = stationsSelected)
ipW2006 <- interpolateDailyWeather(weather, locs[c("ID", "LON", "LAT", "ALT")], "2003-5-15", "2003-9-25", stations = stationsSelected) 
ipW2007 <- interpolateDailyWeather(weather, locs[c("ID", "LON", "LAT", "ALT")], "2003-5-15", "2003-9-25", stations = stationsSelected) 

ipW <- rbind(ipW1997,ipW1998,ipW1999,ipW2000,ipW2001,ipW2003,ipW2004,ipW2005,ipW2006,ipW2007)

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


---------------------


require(weatherData)
require(cropData)

trial <- read.csv(system.file("external/maizedata.lobell.apr112011.csv", package="cropData"))
locs <- read.csv(system.file("external/EIL.site.latlon.csv", package="cropData"))

a <- lm(logYield ~ vargroup + days30C + gs150.gdd + anth.precip + yrcode + sitecode + vargroup:days30C, data=trial)

require(nlme)
cS <- corSymm(form = ~ 1 | sitecode * yrcode)
a <- gls(logYield ~ vargroup + days30C + gs150.gdd + anth.precip + yrcode + sitecode + vargroup:days30C, data=trial, correlation=cS, na.action=na.omit, verbose=TRUE)
 
 
locs <- locs[locs$Latitude != 0,]

