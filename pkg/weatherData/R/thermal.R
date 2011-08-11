temperature <- function(Time, Tmax, Tmin, sunr, TminNext) 
{
	Temp <- vector(length=length(Time))
	Tave <- (Tmax + Tmin) / 2
	Amp <- (Tmax - Tmin) / 2

	Temp[Time > 14] <- (((Tmax + TminNext) / 2) + ((Tmax - TminNext) / 2) * (cos(pi * (Time + 14) / (10 + sunr))))[Time > 14]
	Temp[Time < sunr] <- (Tave + Amp * (cos(pi * (Time + 10) / (10 + sunr))))[Time < sunr]
	Temp[Time >= sunr & Time <= 14] <- (Tave - Amp * (cos( pi * (Time - sunr) / (14 - sunr))))[Time >= sunr & Time <= 14]
	
	Temp[Amp<0] <- NA

	return(Temp)
}

thermalStressSeasonal <- function(criticalTemp, dailyWeather, growPlaceDate, zenith=96)
{
	ID <- unique(growPlaceDate$ID)
	
	# make table of ID-season combinations from growPlaceDate
	result <- growPlaceDate[c("ID","START","END")]
	THERMALSTRESS <- vector(length=length(result[,1]))
	result <- cbind(result,THERMALSTRESS)
	
	# now do things by location
	for(i in ID)
	{	
		# weather data
		wID <- which(dailyWeather$ID == i)
		Tmax <- dailyWeather$MAX[wID]
		Tmin <-dailyWeather$MIN[wID]
		moda <- dailyWeather$moda[wID]

		year <- dailyWeather$year[wID]
		month <- as.integer(substring(moda,1,2))
		day <- as.integer(substring(moda,3,4))
		
		# now get info about locations and seasons
		gID <- which(growPlaceDate$ID == i)

		longitude <- growPlaceDate$LON[gID][1]
		latitude <- growPlaceDate$LAT[gID][1]
		
		Start <- as.Date(growPlaceDate$START[gID])		
		End <- as.Date(growPlaceDate$END[gID])
		
		# subset everything here to avoid calculating periods that are not relevant
		datesWeather <- as.Date(paste(year,month,day,sep="-"))
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
		dates <- as.numeric(datesWeather)[sDW]
		
		#now the calculations
		SR <- sunrise(day, month, year, longitude, latitude, zenith)
		TminNext <- c(Tmin[-1],Tmin[length(Tmin)])
		Exceed <- thermalStressDaily(criticalTemp, Tmax, Tmin, SR, TminNext) 
		
		#now sum the ranges of the dates for the different seasons and put into the table
		for(k in 1:length(gID))
		{
			index <- match(Start[k]:End[k], dates)
			result$THERMALSTRESS[gID[k]] <- sum(Exceed[index])
		}
		
	}
	
	return(result)
}

thermalStressDaily <- function(criticalTemp, Tmax, Tmin, sunr, TminNext)
{
	Tave <- (Tmax + Tmin) / 2
	Amp <- (Tmax - Tmin) / 2
	result <- vector(length = length(Tmax))
	result[Tmin > criticalTemp] <- 24 
	result[Tmax <= criticalTemp] <- 0
	result[Tmax < Tmin] <- NA
	crit1 <- Tmax > criticalTemp & Tmax > Tmin & Tmin < criticalTemp
	index <- which(crit1)
	
	for(i in index)
	{
		Temp2 <- optimize(function(Time){abs((((Tmax[i] + TminNext[i]) / 2) + ((Tmax[i] - TminNext[i]) / 2) * (cos(pi * (Time + 14) / (10 + sunr[i])))) - criticalTemp)}, c(14,24))$minimum
		Temp1 <- optimize(function(Time){abs((Tave[i] - Amp[i] * (cos( pi * (Time - sunr[i]) / (14 - sunr[i])))) - criticalTemp)}, c(sunr[i],14))$minimum
		result[i] <- Temp2 - Temp1
	}
	
	Temp0 <- Tave[crit1] + Amp[crit1] * (cos(pi * 10 / (10 + sunr[crit1])))
	crit2 <- crit1 
	crit2[crit1] <- Temp0 > criticalTemp
	index <- which(crit2)
	
	for(i in index)
	{
		result[i] <- optimize(function(Time){abs(Tave[i] + Amp[i] * (cos(pi * (Time + 10) / (10 + sunr[i]))) - criticalTemp)})$minimum
	}
	
	return(result)
}

#http://williams.best.vwh.net/sunrise_sunset_algorithm.htm
#http://williams.best.vwh.net/sunrise_sunset_example.htm
#note, however that this function calculates the value of the sunrise in local mean time (solar time), not UTC.