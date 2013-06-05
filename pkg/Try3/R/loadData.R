loadData <- function()
{
  
  myDat <- gfile("Load a table with ranking data.", filter= list("All files" = list(patterns = c("*")), "CSV files" = list(patterns = c("*.csv"))) )
  if(TRUE) {.GlobalEnv$myData <- read.csv(myDat)}
  else{ .GlobalEnv$myData <- read.csv2(myDat)}
  if(!is.na(myDat)) gmessage("Data loaded.", title="Done", icon="info")
  
}
