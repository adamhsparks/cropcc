stationsPeriod <- function(startDate, endDate, stations, wholePeriod=FALSE)
{
	startDate <- as.Date(startDate)
	endDate <- as.Date(endDate)
	if(startDate >= endDate) stop("startDate before or equal to endDate")
	if(!wholePeriod) stations <- stations[as.Date(stations$BEGIN) <= endDate & as.Date(stations$END) >= startDate,]
	if(wholePeriod) stations <- stations[as.Date(stations$BEGIN) <= startDate & as.Date(stations$END) >= endDate,]
	return(stations)
}

