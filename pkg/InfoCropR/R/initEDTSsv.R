initEDTSsv <- function(weather, EDTSsv, control)
{
  #inititialConditions_runControl calculated TPSI from weather on day 1 (min and max temp)
  STTIME <- control@STTIME
  
  TMMN  <- weather@TMMN[STTIME] #TIME=STTIME
  TMMX  <- weather@TMMX[STTIME]
  
  TPSI <- 0.5*(TMMX + TMMN)
  
  EDTSsv@TPS[1] <- TPSI
  
  return(EDTSsv)
}