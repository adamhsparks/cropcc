.loadData <- function(myDat)
{
  
  rL <- readLines(file(myDat), n=2)
  
  ncomma <- 0
  nsemicolon <- 0
  
  if(length(strsplit(rL[1], ",")) == length(strsplit(rL[2], ","))) ncomma <- length(strsplit(rL[1], ",")[[1]])
  if(length(strsplit(rL[1], ";")) == length(strsplit(rL[2], ";"))) nsemicolon <- length(strsplit(rL[2], ";")[[1]])
  
  if(1 > (ncomma+nsemicolon)){
    
    gmessage("Data could not be read.\nMake sure it is a correctly formatted CSV file by opening it in Notepad or similar.", title="Error", icon="error")
    
  } else {
    
    delim <- ifelse(ncomma<=nsemicolon, ";", ",")
    
    if(delim == ","){myData <- read.csv(myDat)}
    if(delim == ";"){myData <- read.csv2(myDat)}
    
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
