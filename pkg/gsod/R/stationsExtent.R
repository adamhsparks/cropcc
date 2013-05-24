stationsExtent <-
function(extent, stations)
{
	if(length(extent) != 4) stop("extent should be a vector of 4 elements: c(xmin, xmax, ymin, ymax) or an object of class bbox")
	if(extent[1] > extent[2] | extent[3] > extent[4]) stop("extent incorrect (xmin > xmax and/or ymin > ymax)")
	stations <- stations[stations$LON > extent[1] & stations$LON < extent[2] & stations$LAT > extent[3] & stations$LAT < extent[4],]
	return(stations)
}

