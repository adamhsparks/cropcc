initWater <- function(SWBsv, soilD) #should be run AFTER soilD initialization
{
  
  TKL1 <- soilD@TKL1
  TKL2 <- soilD@TKL2
  TKL3 <- soilD@TKL3
  
  WCFCM1 <- soilD@WCFCM1
  WCFCM2 <- soilD@WCFCM2
  WCFCM3 <- soilD@WCFCM3
  
  WCLI1 <- WCFCM1*0.9
  WCLI2 <- WCFCM2*0.8
  WCLI3 <- WCFCM3*0.75
  
  WL1I <- WCLI1 * TKL1 
  WL2I <- WCLI2 * TKL2
  WL3I <- WCLI3 * TKL3
  
  SWBsv@WL1T[1] <- WL1I
  SWBsv@WL2T[1] <- WL2I
  SWBsv@WL3T[1] <- WL3I
  
  return(SWBsv)
  
}