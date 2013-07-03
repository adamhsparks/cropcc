.loadData <- function(myDat)
{
  
  rL <- readLines(file(myDat), n=3)
  
  ncomma <- 0
  nsemicolon <- 0
  
  if(length(strsplit(rL[2], ",")) == length(strsplit(rL[3], ","))) ncomma <- length(strsplit(rL[1], ",")[[1]])
  if(length(strsplit(rL[2], ";")) == length(strsplit(rL[3], ";"))) nsemicolon <- length(strsplit(rL[2], ";")[[1]])
  
  if(1 > (ncomma+nsemicolon)){
    
    gmessage("Data could not be read.\nMake sure it is a correctly formatted CSV file by opening it in Notepad or similar.", title="Error", icon="error")
    
  } else {
    
    delim <- ifelse(ncomma<=nsemicolon, ";", ",")
    
    if(length(strsplit(rL[1], delim))) == length(strsplit(rL[2], delim)){s <- 0} else{s <- 1}
    
    if(delim == ","){myData <- read.csv(myDat, skip=s)}
    if(delim == ";"){myData <- read.csv2(myDat, skip=s)}
    
  }
    
  if(exists("myData")) {
        
    gmessage("Data loaded.", title="Done", icon="info")
        
  } else {
        
    gmessage("Data could not be read.\nMake sure it is a correctly formatted CSV file by opening it in Notepad or similar.", title="Error", icon="error")
        
  }
    
  return(myData)
      
}

loadData <- function()
{
  
  myDat <- gfile("Load a table with ranking data.", filter= list("All files" = list(patterns = c("*")), "CSV files" = list(patterns = c("*.csv"))) )
  .GlobalEnv$myData <- .loadData(myDat)
    
}
