stationsPeriod <-
function(startDate, endDate, stations=data(stations), wholePeriod=FALSE)
{
if(startDate >= endDate) stop("startDate before or equal to endDate")
if(!wholePeriod) stations <- stations[stations$BEGIN <= endDate & stations$END >= startDate,]
if(wholePeriod) stations <- stations[stations$BEGIN <= startDate & stations$END >= endDate,]
return(stations)
}

