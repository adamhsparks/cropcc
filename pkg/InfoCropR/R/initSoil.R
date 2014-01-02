initSoil <- function(soilD, management)
{
  
  PUDLE <- management@PUDLE[1]
  TKL3M <- soilD@TKL3M
  TKL3 <- INSW(PUDLE - 0.5, TKL3M, 0.1)
  
  soilD@TKL3 <- TKL3
  
  return(soilD)
  
}