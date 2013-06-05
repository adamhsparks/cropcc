loadData <- function()
{
  
  myDat <- gfile("Load a table with ranking data.", filter= list("All files" = list(patterns = c("*")), "CSV files" = list(patterns = c("*.csv"))) )
  .GlobalEnv$myData <- read.csv(myDat)
  if(!is.na(myDat)) gmessage("Data loaded.", title="Done", icon="info")
  
}
