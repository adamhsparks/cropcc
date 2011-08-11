## A quick demo to overview the package
## 

pause <- function(msg=NA){  
  if (is.na(msg)) msg <- "\nPress <return> to continue:"
  invisible(readline(msg)) 
}

## load station data
## 

data(stations)
head(stations)

## filter station data to fit Iberian Peninsula
##

extent <- c(-10, 2, 35, 44)
spanishStations <- stationsExtent(extent,stations)

## filter station data for 2010
##

mystations <- stationsPeriod("2010-01-01", "2010-12-31", spanishStations, wholePeriod = TRUE)

## download data
##

# downloadGSOD(2010, 2010, mystations, silent = TRUE, tries = 2, localdir = NULL)

## merge data
##

# tableGOSD <- makeTableGSOD()
# save(tableGOSD,file = "tableGOSD.Rdata")

data(tableGOSD)
head(tableGOSD)
pause()

## interpolate data
##

locations <- merge(seq(-10,2,0.1),seq(35,44,0.1))
colnames(locations) <- c("LON","LAT")
locations$ALT <- 0

startDate <- "2010-07-06"
endDate <- "2010-07-06"

weather <- interpolateDailyWeather(tableGOSD, locations, startDate, endDate, vars = c("TEMP"), covars = NULL, stations = mystations, logtr = NULL)

library(maps)
map("world",xlim=c(-10,2),ylim=c(35,44),add=T)

library(mapdata)
map('worldHires', 'Spain', add=T)
map("worldHires",xlim=c(-10,2),ylim=c(35,44),add=T)
