library(weatherData)
library(maps)
library(geonames)

data(stations)
setwd("D:/Data/CCAFS/PCCMCA-Maize/weatherDataCA")

# get crop data
trial <- read.csv("D:/Data/CCAFS/PCCMCA-Maize/trialsCA.csv")
locs <- read.csv("D:/Data/CCAFS/PCCMCA-Maize/locationsCA.csv")

# use geonames server to get altitude data for trial locations
for(i in 1:dim(locs)[1]) {locs$ALT[i] <- GNsrtm3(locs$LAT[i],locs$LON[i])[1]}

# select weather stations
stations <- stations[!is.na(stations$ALT),]
stationsSelected <- stationsExtent(c(-100,-60,0,30), stations)

# visualize
plot(stationsSelected[c("LON","LAT")], pch=3, cex=.5)
points(locs[c("LON","LAT")], pch=15)
map("world",add=TRUE, interior=F)

#weatherCA <- downloadGSOD(2003, 2005, stations = stationsSelected, silent = TRUE, tries = 2, localdir = NULL) #can be omitted second time
#weatherCA <- makeTableGSOD(weatherCA) #can be replaced by following line second time
weatherCA <- makeTableGSOD()
weatherCA <- na.omit(weatherCA)

# interpolate by year
ipW2003 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2003-5-15", "2003-9-25", stations = stationsSelected)
ipW2004 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2004-5-15", "2004-9-25", stations = stationsSelected)
ipW2005 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2005-5-15", "2005-9-25", stations = stationsSelected)

START <- paste(trial$Year, "5-15", sep="-")
END <- paste(trial$Year, "9-25", sep="-")

trial <- cbind(trial, START, END)

hTE2003 <- thermalStressSeasonal(30, ipW2003, trial[trial$Year == 2003,], locs)



trial <- cbind(trial, hTE)

