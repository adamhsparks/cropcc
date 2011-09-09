require(gdata)
require(gWidgetstcltk)
require(gsubfn)
require(geonames)

#data.dir <- tk_choose.dir(getwd())
data.files <- list.files(data.dir, full.names =T , pattern ="*.xls")
filenames <- list.files(data.dir, full.names =F , pattern ="*.xls")

LOCATION_SHEET = "LOCATION"
DATA_SHEET = "EXPT-OBS"

convertLat<- function(pos) {
  d <- strapply(pos, "(.*) (.*)' (.*)",as.numeric)[[1]]
  m <- strapply(pos, ".* (.*)' (.*)",as.numeric)[[1]]
  #nt <- strapply(pos, ".* .*' (.*)",function(nt){if (nt == 'S') {-1} else {1} })[[1]]
  (d + m /60) 
}

convertLon<- function(pos) {
  d <- strapply(pos, "(.*) (.*)' (.*)",as.numeric)[[1]]
  m <- strapply(pos, ".* (.*)' (.*)",as.numeric)[[1]]
  #nt <- strapply(pos, ".* .*' (.*)",function(nt){if (nt == 'E') {-1} else {1} })[[1]]
  (d + m /60) 
}

extractTrialData<-function(trial.file){

#info <- read.xls(trial.file, sheet = LOCATION_SHEET, stringsAsFactors=F, header=F)

#name <- info[1,2]
#loc <- strapply(name, "(.*)-([0-9]+) / (.*)",)[[1]]
#year <-strapply(name, ".*-([0-9]+) / (.*)",as.numeric)[[1]]

#lat <- convertLat(info[7,2])
#lon <- convertLon(info[8,2])
#ele <- as.numeric(info[9,2])
#if (is.na(ele)) ele <- as.numeric(GNsrtm3(lat,lon)[1])


 data <- read.xls(trial.file, sheet = DATA_SHEET, stringsAsFactors=F, header=T)
 data2 <- data[,c("IRTP.No.", "YLD")]

 data2
}

RiceExpData <- data.frame()
for(i in 1:length(data.files))
{
  trial.file <- data.files[i]
  x <- (extractTrialData(trial.file))
  trial <-  merge(filenames[i],x)
  RiceExpData <- rbind(RiceExpData,trial)
}
