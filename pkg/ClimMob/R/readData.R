readData <- function()
{
  
  d <- gfile("ClimMob - Read data", type="open", filter = list("Comma-separated files" = list(patterns = c("*.csv")))) 
  if(!is.na(d)) .GlobalEnv$myData <- read.csv(d)

}