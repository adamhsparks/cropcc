# Author: Robert J. Hijmans, r.hijmans@gmail.com
# License GPL3
# Version 0.1  January 2009

.yearFromDate <- function(date) {
# to avoid date shifts because of your local time zone if date is a POSIX. ..
# date is a string like "2007-7-10"    YYYY-M-D
	date <- as.character(date)
	as.numeric(format(as.Date(date), "%Y"))
}

.monthFromDate <- function(date) {
	date <- as.character(date)
	as.numeric(format(as.Date(date), "%m"))
}

.dayFromDate <- function(date) {
	date <- as.character(date)
	as.numeric(format(as.Date(date), "%d"))
}

.doyFromDate <- function(date) {
	date <- as.character(date)
	as.numeric(format(as.Date(date), "%j"))
}

# Author: Jacob van Etten
# License GPL3
# Version 1.0 2011
# http://williams.best.vwh.net/sunrise_sunset_algorithm.htm
# http://williams.best.vwh.net/sunrise_sunset_example.htm
# note, however that this function calculates the value of the sunrise in local mean time (solar time), not UTC.


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

thermalStressSeasonal <- function(criticalTemp, dailyWeather, trialData, trialLocs, startEnd=c("START","END"), zenith=96)
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
		Date <- dailyWeather$Date[wID]

		year <- dailyWeather$Year[wID]
		datesWeather <- dailyWeather$Date[wID] # changed by AL
		month <- .monthFromDate(datesWeather)
		day <- .dayFromDate(datesWeather)
		
		# now get info about locations and seasons
		longitude <- trialLocs$LON[trialLocs$ID == i]
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
		dates <- as.numeric(datesWeather)[sDW]
		
		#now the calculations
		SR <- sunrise(day, month, year, longitude, latitude, zenith)
		TminNext <- c(Tmin[-1],Tmin[length(Tmin)])
		Exceed <- thermalStressDaily(criticalTemp, Tmax, Tmin, SR, TminNext)
		
		#if there is an NA, then interpolate the value
		if(sum(is.na(Exceed)) > 0) 
		{
		
			index <- which(is.na(Exceed))
			index <- index[index > 1 & index < length(Exceed)]
			Exceed[index] <- rowMeans(cbind(c(0,Exceed)[index],c(Exceed,0)[index+1]))
		
		}
		
		#now sum the ranges of the dates for the different seasons and put into the table
		for(k in 1:length(tID))
		{
			index <- match(Start[k]:End[k], dates)
			result[tID[k]] <- sum(Exceed[index])
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
		result[i] <- optimize(function(Time){abs(Tave[i] + Amp[i] * (cos(pi * (Time + 10) / (10 + sunr[i]))) - criticalTemp)}, c(0,sunr[i]))$minimum
	}
	
	return(result)
}
