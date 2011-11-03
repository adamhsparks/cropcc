makeTableGSOD <- function(folder=getwd(), files=NULL)
	{
		if(is.null(files)) files <- list.files(path = folder, pattern = "op.gz$", all.files = TRUE, full.names = TRUE, recursive = FALSE)
		
		if(length(files)<1) {stop("no GSOD files in this folder")}
		#set up things

		start <- c(1,8,15,19,25,32,36,43,47,54,58,65,69,75,79,85,89,96,103,109,111,117,119,124,126,133)
		end <-   c(6,12,18,22,30,33,41,44,52,55,63,66,73,76,83,86,93,100,108,109,116,117,123,124,130,138)
		finalData <- vector(length=26,mode="list")

		#loop through the data files, reading out column by column

		for (File in files)
		{
			YearStation <- readLines(gz <- gzfile(File))
			close(gz)
			colData <- NULL

			if(length(YearStation) != 0)
			{ 

				#loop column by column (this should slightly reduce accessing time when writing to finalData list, compared to a row-by-row approach)

				for(i in 1:26)
				{
					#read column
					for(j in 2:length(YearStation)) colData <- c(colData, substring(YearStation[j],start[i],end[i]))

					#some conversion -- the rest will become a factor in the final data.frame
					if(i %in% c(3,6,8,10,12,14,16)) colData <- as.integer(colData)
					if(i %in% c(5,7,9,11,13,15,17,18,19,21,23,25)) colData <- as.numeric(colData)

					#setting missing values to NA
					if(i %in% c(13,15,17,18,25)) colData[colData > 999.9] <- NA
					if(i %in% c(5,7,9,11,19,21)) colData[colData > 9999] <- NA
					if(i == 23) colData[colData > 99] <- NA

					#append column
					finalData[[i]] <- c(finalData[[i]],colData)
					colData <- NULL
				}
			}
		}

	#do some final formatting of the data

	finalData <- as.data.frame(finalData)

	#colnames slightly modified to make them unique and valid data.frame colnames
	cnames <- c("STN","WBAN","YEAR","MODA","TEMP","CountTEMP","DEWP","CountDEWP","SLP","CountSLP","STP",    
	"CountSTP","VISIB","CountVISIB","WDSP","CountWDSP","MXSPD","GUST","MAX","FlagMAX","MIN","FlagMIN","PRCP","FlagPRCP","SNDP","FRSHTT")
	colnames(finalData) <- cnames

	#convert to SI units
	finalData$TEMP <- (finalData$TEMP-32)/1.8 #F to C
	finalData$DEWP <- (finalData$DEWP-32)/1.8
	finalData$MIN <- (finalData$MIN-32)/1.8
	finalData$MAX <- (finalData$MAX-32)/1.8

	finalData$PRCP <- finalData$PRCP / 39.37 #inch to m
	finalData$SNDP <- finalData$SNDP * 0.003937

	finalData$WDSP  <- finalData$WDSP * 0.514444  #knots to ms-1
	finalData$MXSPD <- finalData$MXSPD *  0.514444
	finalData$GUST <- finalData$GUST *  0.514444

	finalData$VISIB <- finalData$VISIB * 1609.344 #miles to m

	#add a unique ID column
	ID <- as.double(paste(finalData$STN,finalData$WBAN,sep=""))
	finalData <- cbind(ID, finalData)

	return(finalData)
}

