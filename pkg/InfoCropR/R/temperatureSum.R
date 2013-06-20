temperatureSum <- function(TMIN, TMAX, TVBD, TPOPT, TPMAXD)
{
  
  TM <- (TMAX + TMIN)/2
  TD <- TM + 0.5*abs(TMAX-TMIN)*cos(0.2618*((1:24)-14))
  TT <- rep(0, times=24)
  index1 <- TD > TVBD & TD < TPOPT
  TT[index1] <- (TD[index1] - TVBD) / 24
  index2 <- TD > TPOPT & TD < TPMAXD
  TT[index2] <- (TPOPT - (TD[index2]-TPOPT)*(TPOPT-TVBD)/(TPMAXD-TPOPT) - TVBD) / 24
  #Formula 8 on page 10 omits to substract TVBD. FST source code is correct, however.
  HU <- sum(TT)
  return(HU)
  
}