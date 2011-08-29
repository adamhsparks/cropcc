.cv <- function(x) sd(x) / mean(x)

precipitationSeasonal <- function(dailyWeather, trialData, func=c("sum","cv"), startEnd = c("START","END"))
{
	ID <- unique(trialData$ID)
	
	# make table of ID-season combinations from trialData
	if("sum" %in% func){sumPrec <- vector(length=length(trialData[,1]))}
	if("cv" %in% func){cvPrec <- vector(length=length(trialData[,1]))}
	
	# now do things by location
	for(i in ID)
	{	
		# weather data
		wID <- which(dailyWeather$ID == i)
		PRCP <- dailyWeather$PRCP[wID]

		year <- dailyWeather$Year[wID]
		datesWeather <- dailyWeather$Date[wID] # changed by AL
		month <- .monthFromDate(datesWeather)
		day <- .dayFromDate(datesWeather)
		
		# now get info about locations and seasons
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
		
		prec <- PRCP[sDW]

		year <- year[sDW]
		month <- month[sDW]
		day <- day[sDW]
		dates <- as.numeric(datesWeather)[sDW]
		
		# if there is an NA, then set it to 0
		if(sum(is.na(prec)) > 0) 
		{
		
			prec[is.na(prec)] <- 0
					
		}
		
		# now sum the ranges of the dates for the different seasons and put into the table
		for(k in 1:length(tID))
		{
			index <- match(Start[k]:End[k], dates)
			
			if("sum" %in% func){sumPrec[tID[k]] <- sum(prec[index])}
			if("cv" %in% func){cvPrec[tID[k]] <- .cv(prec[index])}
		}
		
	}
	result <- NULL
	if("sum" %in% func) result <- sumPrec
	if("cv" %in% func) result <- cbind(result,cvPrec)
	return(result)
}