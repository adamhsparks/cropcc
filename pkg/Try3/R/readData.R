readData <- function()
{
  
  d <- gfile("Try3 - Read data", type="open", filter = list("Comma-separated files" = list(patterns = c("*.csv")))) 
  if(!is.na(d)) .GlobalEnv$myData <- read.csv(d)

}