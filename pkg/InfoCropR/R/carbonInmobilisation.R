carbonInmobilisation <- function(carbonMine, nitrogenD, 
                                 nitrogenEmi, stress, carbonInmo)
{
  #---------- carbonMine Data
  CDOC1 <- carbonMine@CDOC1[length(carbonMine@CDOC1)]
  CDOC2 <- carbonMine@CDOC2[length(carbonMine@CDOC2)]
  CDOC3 <- carbonMine@CDOC3[length(carbonMine@CDOC3)]
  
  #---------- nitrogenD Data
  ASOLC <- nitrogenD@ASOLC
  
  #---------- nitrogenEmi Data
  MBFAC <- nitrogenEmi@MBFAC[length(nitrogenEmi@MBFAC)]
  
  #---------- stress Data
  MFAC  <- stress@MFAC[length(stress@MFAC)]
  PHFAC <- stress@PHFAC[length(stress@PHFAC)]
  TFAC  <- stress@TFAC[length(stress@TFAC)]
  
  #================
  CIMMO1 <- CDOC1*ASOLC*TFAC*MBFAC* AMIN1(MFAC, PHFAC)
  CIMMO2 <- CDOC2*ASOLC*TFAC*MBFAC* AMIN1(MFAC, PHFAC)
  CIMMO3 <- CDOC3*ASOLC*TFAC*MBFAC* AMIN1(MFAC, PHFAC)
  
  #================
  j <- length(carbonInmo@CIMMO1) + 1
  
  carbonInmo@CIMMO1[j] <- CIMMO1
  carbonInmo@CIMMO2[j] <- CIMMO2
  carbonInmo@CIMMO3[j] <- CIMMO3
    
  #----------------
  return(carbonInmo)
}