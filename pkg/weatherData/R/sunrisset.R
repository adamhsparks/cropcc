#http://williams.best.vwh.net/sunrise_sunset_algorithm.htm
#http://williams.best.vwh.net/sunrise_sunset_example.htm
#note, however that this function calculates the value of the sunrise in local mean time (solar time), not UTC.

sunrise <- function(day, month, year, longitude, latitude, zenith=96)
{
	longitude <- longitude * (pi/180)	
	latitude <- latitude * (pi/180)	
	
	d <- as.character(paste(year,month,day, sep="-"))
    doy <- as.numeric(format(as.Date(d), "%j"))
	
	lngHour <- longitude / (pi/12)
	Time <- doy + ((6 - lngHour) / 24)
	
	M <- ((0.9856 * Time) - 3.289) * (pi/180)
	L <- M + ((1.916 * sin(M)) + (0.020 * sin(2 * M)) + 282.634) * (pi/180)

	if(L>2*pi) L <- L - 2*pi
	if(L<0) L <- L + 2*pi
	
	RA <- atan(0.91764 * tan(L))
	
	if(RA>2*pi) RA <- RA - 2*pi
	if(RA<0) RA <- RA + 2*pi
	
	Lquadrant  = floor( L/ (0.5*pi)) * 0.5*pi
	RAquadrant = floor(RA/ (0.5*pi)) * 0.5*pi

	RA <- RA + (Lquadrant - RAquadrant)
	
	RA <- RA / ((2*pi)/24)
	
	sinDec <- 0.39782 * sin(L)
	cosDec <- cos(asin(sinDec))	

	zenith <- zenith * (pi/180)	
	cosH <- (cos(zenith) - (sinDec * sin(latitude))) / (cosDec * cos(latitude))
	
	H <- (2*pi - acos(cosH)) / ((2*pi)/24)
	
	T = H + RA - (0.06571 * Time) - 6.622
	
	return(T)
}

sunset <- function(day, month, year, longitude, latitude, zenith=96)
{
	longitude <- longitude * (pi/180)	
	latitude <- latitude * (pi/180)	
	
	d <- as.character(paste(year,month,day, sep="-"))
    doy <- as.numeric(format(as.Date(d), "%j"))
	
	lngHour <- longitude / (pi/12)
	Time <- doy + ((18 - lngHour) / 24)
	
	M <- ((0.9856 * Time) - 3.289) * (pi/180)
	L <- M + ((1.916 * sin(M)) + (0.020 * sin(2 * M)) + 282.634) * (pi/180)

	if(L>2*pi) L <- L - 2*pi
	if(L<0) L <- L + 2*pi
	
	RA <- atan(0.91764 * tan(L))
	
	if(RA>2*pi) RA <- RA - 2*pi
	if(RA<0) RA <- RA + 2*pi
	
	Lquadrant  = floor( L/ (0.5*pi)) * 0.5*pi
	RAquadrant = floor(RA/ (0.5*pi)) * 0.5*pi

	RA <- RA + (Lquadrant - RAquadrant)
	
	RA <- RA / ((2*pi)/24)
	
	sinDec <- 0.39782 * sin(L)
	cosDec <- cos(asin(sinDec))	

	zenith <- zenith * (pi/180)	
	cosH <- (cos(zenith) - (sinDec * sin(latitude))) / (cosDec * cos(latitude))
	
	H <- acos(cosH) / ((2*pi)/24)
	
	T = H + RA - (0.06571 * Time) - 6.622
	
	return(T)
}

