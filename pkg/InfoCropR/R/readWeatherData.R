readWeatherData <- function(path)
{
  
  variables <- c("Station","YEAR","DOY","RDD","TMMN","TMMX","VP","WN","RAIN")
  
  files <- list.files(path = path, pattern = NULL, all.files = FALSE,
             full.names = FALSE, recursive = FALSE)
  
  NumFiles = length(files)
  path_IC <- paste(path, files[1], sep="")
  data    <- read.table(path_IC, header = FALSE, col.names=variables, skip=20)
  
  if (NumFiles>1){
      for(i in 2:NumFiles){
         path_IC <- paste(path, files[i], sep="")
         data_i  <- read.table(path_IC, header = FALSE, col.names=variables, skip=20)
         data    <- rbind(data,data_i)
         rm(data_i)
      }
  }
  
  result <- new("WeatherClass")
  
  result@YEAR   <- data$YEAR
  result@DOY    <- data$DOY
  result@RDD    <- data$RDD
  result@TMMN   <- data$TMMN
  result@TMMX   <- data$TMMX
  result@VP     <- data$VP
  result@WN     <- data$WN
  result@RAIN   <- data$RAIN
  
  dindex1       <- as.numeric(as.Date(ISOdate(result@YEAR[1],1,1)))
  result@DINDEX <- seq(dindex1,dindex1+length(result@YEAR)-1,1)
  
  return(result)

}

# ------------------------------------------------------  RUN:
#datos <- readWeatherData("D:\\Weather\\")
#datos                    