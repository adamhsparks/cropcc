#Hargreaves-Samani, modified by Samani

radiationDaily <- function(Date, latitude, Tmin, Tmax, method="HR2") 
{
	latitude <- (pi/180)*latitude
	doy <- .doyFromDate(Date)
	TD <- abs(Tmax - Tmin)
	
	if(method=="HR2")
	{
		delta <- 0.409 * sin (2 * pi * (doy/365) - 1.39)
		dr <- 1 + 0.033 * cos((2 * pi * doy)/365)
		psi <- acos(-tan(latitude) * tan(delta))
		Ra <- (1440/pi) * 0.082 * dr * (psi * sin(latitude) * sin(delta) + cos(latitude) * cos(delta) * sin(psi))
		KT <- 0.00185*TD^2 - 0.0433*TD + 0.4023
		Rs <- KT * Ra * sqrt(TD)
		return(Rs)
	}
	if(method=="HR1")
	{
		DR <- 1+0.033*cos(pi*2/365*doy)    
		SRdec <- 0.409*sin(2*pi/365*doy - 1.98)
		SHA <- acos(-tan(latitude)*tan(SRdec))
		R_a <- 24*60/pi*0.082*DR*(SHA*sin(latitude)*sin(SRdec)+cos(latitude)*cos(SRdec)*sin(SHA))
		return(R_a*0.16*sqrt(Tmax-Tmin))
	}
}

radiationSeasonal <- function(dailyWeather, trialData, trialLocs, method="HR2", startEnd = c("START","END"))
{
	ID <- unique(trialData$ID)
	
	# make table of ID-season combinations from trialData
	result <- vector(length=length(trialData[,1]))
	
	# now do things by location
	for(i in ID)
	{	
		# weather data
		wID <- which(dailyWeather$ID == i)
		Tmax <- dailyWeather$MAX[wID]
		Tmin <-dailyWeather$MIN[wID]

		year <- dailyWeather$Year[wID]
		datesWeather <- dailyWeather$Date[wID] # changed by AL
		month <- .monthFromDate(datesWeather)
		day <- .dayFromDate(datesWeather)
		
		# now get info about locations and seasons
		latitude <- trialLocs$LAT[trialLocs$ID == i]

		tID <- which(trialData$ID == i)		
		Start <- as.Date(trialData[tID,startEnd[1]])		
		End <- as.Date(trialData[tID,startEnd[2]])
		
		# subset everything here to avoid calculating periods that are not relevant
		datesCrop <- NULL
		for(j in 1: length(Start))
		{
			datesCrop <- c(datesCrop, Start[j]:End[j])
		}

		sDW <- which(as.numeric(datesWeather) %in% datesCrop)
		
		Tmax <- Tmax[sDW]
		Tmin <- Tmin[sDW]
		year <- year[sDW]
		month <- month[sDW]
		day <- day[sDW]
		dates <- datesWeather[sDW]
		
		# now the calculations
		Radiation <- radiationDaily(dates, latitude, Tmin, Tmax, method=method)
		
		# if there is an NA, then interpolate the value
		if(sum(is.na(Radiation)) > 0) 
		{
		
			index <- which(is.na(Radiation))
			index <- index[index > 1 & index < length(Radiation)]
			Radiation[index] <- rowMeans(cbind(c(0,Radiation)[index],c(Radiation,0)[index+1]))
		
		}
		
		# now sum the ranges of the dates for the different seasons and put into the table
		for(k in 1:length(tID))
		{
			index <- match(Start[k]:End[k], dates)
			result[tID[k]] <- sum(Radiation[index])
		}
		
	}
	
	return(result)
}