# fields, Tools for spatial data
# Copyright 2004-2011, Institute for Mathematics Applied Geosciences
# University Corporation for Atmospheric Research
# Licensed under the GPL -- www.gpl.org/licenses/gpl.html
# Modified from a version sent to me in an email by Doug Nychka (nychka@ucar.edu)
.TpsLonLat <- function(x, Y, Z) {
    x <- as.matrix(x)
    d <- ncol(x)
	m <- max(c(2, ceiling(d/2 + 0.1)))
    p <- (2 * m - d)
    if (p <= 0) {stop(" m is too small  you must have 2*m -d >0")}
    Tpscall <- match.call()
    Tpscall$cov.function <-
        "Thin plate spline radial basis functions (RadialBasis.cov) using great circle distance "
    Krig(x=x, Y=Y, Z=Z, cov.function = stationary.cov, m = m, scale.type = "range",
        outputcall = Tpscall, GCV = TRUE,
         cov.args=list(Covariance="RadialBasis",M=m, dimension=2, Distance="rdist.earth",
            Dist.args=list(miles=TRUE)) )
}

interpolateDailyWeather <- function(tableGSOD, locations, startDate, endDate, vars=c("TEMP","MAX","MIN","PRCP"), covars="ALT", stations, sqrtTr=("PRCP")) #covars should be present in the stations file
{
	require(fields)

	#checking and formatting of incoming objects
	if(is.null(colnames(locations))) {stop("object locations has no column names.")}
	if(!all(c("ID","LON","LAT","ALT") %in% colnames(locations))) stop("object locations has non-standard column names (standard is ID,LON,LAT,ALT).")

	locations <- locations[c("ID","LON","LAT","ALT")]
	
	if(!is.numeric(locations$LON)){locations$LON <- as.numeric(locations$LON); warning("locations column LON forced to numeric")}
	if(!is.numeric(locations$LAT)){locations$LAT <- as.numeric(locations$LAT); warning("locations column LAT forced to numeric")}
	if(!is.numeric(locations$ALT)){locations$ALT <- as.numeric(locations$ALT); warning("locations column ALT forced to numeric")}
	#TODO more controls
	
	#transform some variables
	if(!is.null(sqrtTr)) {tableGSOD[sqrtTr] <- sqrt(tableGSOD[sqrtTr])} #TO DO

	#prepare vectors of the days
	days <- as.Date(startDate):as.Date(endDate)
	days <- as.Date(days, origin="1970-01-01")
	monthDays <- paste(substring(as.character(days),6,7),substring(as.character(days),9,10),sep="")
	years <- as.integer(substring(as.character(days),1,4))

	#make the final table as a list: station name, year, date and weather vars
	inDaWe <- vector(mode="list",length=length(vars)+3)
	names(inDaWe) <- c("ID", "year", "moda", vars)
	inDaWe$ID <- rep(locations$ID,times=length(days))
	inDaWe$year <- rep(years,each=dim(locations)[1])
	inDaWe$moda <- rep(monthDays,each=dim(locations)[1])

	ll <- length(locations[,1])
	for(i in 4:length(inDaWe)) inDaWe[[i]] <- rep(NA, times=ll*length(days))

	#loop through days and variables
	for(i in 1:length(years))
	{
		ssub <- tableGSOD[tableGSOD["MODA"]==monthDays[i] & tableGSOD["YEAR"]== years[i],]
		if(dim(ssub)[1]>5)
		{
			#add coordinates and altitude
			ssub <- cbind(ssub, stations[match(ssub$ID, stations$ID),c("LON","LAT","ALT")])
			for(Yvar in vars)
			{
				ssubV <- ssub[c(Yvar, "LON","LAT","ALT")]
				ssubV <- na.omit(ssubV)
				if(dim(ssubV)[1]>5)
				{
					#make daily interpolation and predict for each location
					model <- try(.TpsLonLat(Y=ssubV[Yvar], x=ssubV[c("LON","LAT")], Z=unlist(ssubV["ALT"]))) 
					#surface(model)
					#model <- fastTps(Y=ssub[Yvar], x=ssub[c("LON","LAT")], Z=ssub["ALT"], lon.lat=TRUE, theta=theta)
					if(!inherits(model, "try-error")) {inDaWe[[Yvar]][(ll*(i-1)+1):(ll*i)] <- predict(model, x=locations[,c("LON","LAT")], Z=locations[,"ALT"])}
				}
			}
		}
	}
	result <- as.data.frame(inDaWe)
	if(!is.null(sqrtTr)) 
	{
		result[sqrtTr] <- pmax(rep(0, times=dim(result)[1]), as.vector(unlist(result[sqrtTr])))
		result[sqrtTr] <- as.vector(result[sqrtTr]^2)
	}
	return(result)
}

