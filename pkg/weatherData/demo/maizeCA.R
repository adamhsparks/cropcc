require(weatherData)
data(stations)
stations <- stations[!is.na(stations$ALT),]
stationsSelected <- stationsExtent(c(-100,-70,0,20), stations)

#WeatherDataCA <- downloadGSOD(2003, 2005, stations = stationsSelected, silent = TRUE, tries = 2, localdir = NULL) #can be omitted second time
#WeatherDataCATable <- makeTableGSOD(WeatherDataCA) #can be replaced by following line second time
WeatherDataCATable <- makeTableGSOD()

xya <- rbind(c(-91.56,14.38,0), c(-90.79,14.31,0), c(-89.99,14.26,0))
cropExp <- data.frame(c(1,2,3), xya, rep("2003-5-15",times=3), rep("2003-8-25", times=3))
colnames(cropExp) <- c("ID", "LON", "LAT", "ALT", "START", "END")

ipW <- interpolateDailyWeather(WeatherDataCATable, cropExp[c("ID", "LON", "LAT", "ALT")], "2003-5-15", "2003-8-25", stations = stationsSelected)
hTE <- thermalStressSeasonal(30, ipW, cropExp, zenith=96) 