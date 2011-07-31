downloadGOSD <-
function(startYear, endYear, stations, silent=TRUE, tries=2, localdir=NULL)
{
	startDate <- as.Date(paste(startYear,"-01-01",sep=""))
	endDate <- as.Date(paste(endYear,"-12-31",sep=""))

	stations <- stationsPeriod(startDate, endDate, stations)

	if(!silent) cat("total ", length(stations[,1]), " stations to be dowloaded", "\n")
	files <- NULL

	#loop by station

	for(station in 1:length(stations[,1]))
	{

		#set up things for the station
		startYearStation <- substring(as.Date(stations$BEGIN[station]),1,4)
		endYearStation <- substring(as.Date(stations$END[station]),1,4)
		START <- max(startYear, startYearStation)
		END <- min(endYear, endYearStation)

		#loop through years for the station

		absent <- TRUE

		for (year in START:END)
		{
			if(!is.null(localdir))
			{
				tryit <- try(file(paste(localdir, "/", "gosd-", stations[station, 2], "-", stations[station, 3], "-", year, ".op.gz", sep = "")))
				if(class(tryit) != "try-error") 
				{
					absent <- FALSE
					files <- c(files, tryit)
				}
			}

			if(is.null(localdir) | absent)
			{
	
				#set things up -- url and file name, counter for tries

				urlYearStation <- paste("ftp://ftp.ncdc.noaa.gov/pub/data/gsod/", year, "/", stations[station, 2], "-", stations[station, 3], "-", year, ".op.gz", sep = "")
				fileYearStation <- paste(getwd(), "/", "gosd-", stations[station, 2], "-", stations[station, 3], "-", year, ".op.gz", sep = "")
				tried <- tries

				#while loop to try more than once

				while(tried > 0.5)
				{
					tryIt <- try(download.file(urlYearStation, fileYearStation, quiet=silent), silent = TRUE)
					if(class(tryIt) == "try-error") {tried <- tried - 1} 
					else {tried <- 0}
				}

				#add file name to final file list

				files <- c(files, fileYearStation)


			}

			absent <- TRUE

		}

		
		if(!silent) cat("Station no. ", station," done.\n")
	}
	
	cat("\n")
	return(files)
	
}