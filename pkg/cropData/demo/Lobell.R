require(weatherData)
require(cropData)

#data(stations)
#stations <- stations[!is.na(stations$ALT),]
#stationsSelected <- stationsExtent(c(-10,50,-40,10), stations)

#WeatherFilesLobell <- downloadGSOD(1997, 2007, stationsSelected, silent = TRUE, tries = 2, localdir = NULL)
#WeatherDataLobell <- makeTableGSOD()
#save(WeatherDataLobell,file="WeatherDataLobell.Rdata")
#data(WeatherDataLobell)

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

trial <- read.csv(system.file("external/maizedata.lobell.apr112011.csv", package="cropData"))
locs <- read.csv(system.file("external/EIL.site.latlon.csv", package="cropData"))


