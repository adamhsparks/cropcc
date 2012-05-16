downloadGSOD <-
function(startYear, endYear, stations, silent=TRUE, tries=2, overwrite=TRUE, folder=getwd())
{
	startDate <- as.Date(paste(startYear,"-01-01",sep=""))
	endDate <- as.Date(paste(endYear,"-12-31",sep=""))

	stations <- stationsPeriod(startDate, endDate, stations)

	if(!silent) cat("total ", length(stations[,1]), " stations to be dowloaded", "\n")
	files <- NULL

	if(!overwrite)
	{
	
		filesPresent <- list.files(path = folder)
	
	}
	
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
			fileYearStation <- paste(folder, "/", "gosd-", stations[station, 2], "-", stations[station, 3], "-", year, ".op.gz", sep = "")
			
			if(!overwrite)
			{
				
				if(fileYearStation %in% filesPresent) 
				{
					absent <- FALSE
					if(!silent) cat("file already there.\n")
					files <- c(files, fileYearStation)
				}
			}

			if(overwrite | absent)
			{
	
				#set things up -- url and file name, counter for tries

				urlYearStation <- paste("ftp://ftp.ncdc.noaa.gov/pub/data/gsod/", year, "/", stations[station, 2], "-", stations[station, 3], "-", year, ".op.gz", sep = "")
				tried <- tries

				#while loop to try more than once

				while(tried > 0.5)
				{
					tryIt <- try(download.file(urlYearStation, fileYearStation, quiet=silent), silent = silent)
					if(inherits(tryIt,"try-error")) {
						
						tried <- tried - 1
						if(!silent) cat(tried, " tries left.\n")
					} 
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

listFilesGSOD <-
function(startYear, endYear, stations, overwrite=TRUE, folder=getwd(), clipboard=FALSE)
{
	startDate <- as.Date(paste(startYear,"-01-01",sep=""))
	endDate <- as.Date(paste(endYear,"-12-31",sep=""))

	stations <- stationsPeriod(startDate, endDate, stations)

	files <- NULL
	
	if(!overwrite)
	{
	
		filesPresent <- list.files(path = folder)
	
	}
	

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
			
			if(!is.null(folder))
			{
				
				absent <- !(file(paste(folder, "/", "gosd-", stations[station, 2], "-", stations[station, 3], "-", year, ".op.gz", sep = "")) %in% filesPresent)
				
			}

			if(is.null(folder) | absent)
			{
	
				#set things up -- url and file name, counter for tries

				urlYearStation <- paste("ftp://ftp.ncdc.noaa.gov/pub/data/gsod/", year, "/", stations[station, 2], "-", stations[station, 3], "-", year, ".op.gz", sep = "")

				#add file name to final file list

				files <- c(files, urlYearStation)


			}

			absent <- TRUE

		}


	}
	if(clipboard)
	{
		writeClipboard(paste(files, collapse=" "))
		
	} else { 
	
		if(!is.null(folder))
		{
      write.table(files,paste(folder, "/GSODfiles.txt", sep=""), quote=FALSE, row.names=FALSE, col.names=FALSE)
		  cat("A file with URLs has been created here: ", paste(folder, "/GSODfiles.txt", sep=""),"\n")
		}
    
	}	
	
	return(files)
	
}