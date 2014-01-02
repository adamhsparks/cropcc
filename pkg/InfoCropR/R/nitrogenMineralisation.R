# nitrogenMine
nitrogenMineralisation <- function(EDTSsv, nitrogenD,
                                   nitrogenEmi, soilD, stress, nitrogenMine)
{
  
  
  
  #---------- EDTSsv Data
  DSTART <- EDTSsv@DSTART[length(EDTSsv@DSTART)]
  
  #---------- nitrogenD Data
  DESOLN <- nitrogenD@DESOLN
  
  #---------- nitrogenEmi Data
  MBFAC <- nitrogenEmi@MBFAC[length(nitrogenEmi@MBFAC)]
  
  #---------- nitrogenMine Data
  MRATE1 <- nitrogenMine@MRATE1[length(nitrogenMine@MRATE1)]
  MRATE2 <- nitrogenMine@MRATE2[length(nitrogenMine@MRATE2)]
  MRATE3 <- nitrogenMine@MRATE3[length(nitrogenMine@MRATE3)]
  
  #---------- soilD Data
  SOC1 <- soilD@SOC1
  SOC2 <- soilD@SOC2
  SOC3 <- soilD@SOC3
  
  TKL1 <- soilD@TKL1
  TKL2 <- soilD@TKL2
  TKL3 <- soilD@TKL3
  
  #---------- stress Data
  MFAC  <- stress@MFAC[length(stress@MFAC)]
  PHFAC <- stress@PHFAC[length(stress@PHFAC)]
  TFAC  <- stress@TFAC[length(stress@TFAC)]
  
  #================
  # potentially mineralizable N in each soil layer at the begining of simulation
  POMIN1 <- INSW(DSTART - 1, 0.97*(43 + 970*0.1*SOC1*TKL1/150), 0)
  POMIN2 <- INSW(DSTART - 1, 0.97*(43 + 970*0.1*SOC2*TKL2/150), 0)
  POMIN3 <- INSW(DSTART - 1, 0.97*(43 + 970*0.1*SOC3*TKL3/150), 0)
  
  # potentially mineralizable N in each soil layer
  NPMIN1 <- MRATE1                     #Line 570: NPMIN1 = INTGRL(ZERO,MRATE1)
  NPMIN2 <- MRATE2                     #Line 573: NPMIN2 = INTGRL(ZERO,MRATE2)
  NPMIN3 <- MRATE3                     #Line 576: NPMIN3 = INTGRL(ZERO,MRATE3)
  
  NMINS1 <- (NPMIN1*(1 - exp(-DESOLN)))*TFAC*MBFAC* AMIN1(MFAC, PHFAC)
  NMINS2  = (NPMIN2*(1 - exp(-DESOLN)))*TFAC*MBFAC* AMIN1(MFAC, PHFAC)
  NMINS3  = (NPMIN3*(1 - exp(-DESOLN)))*TFAC*MBFAC* AMIN1(MFAC, PHFAC)
  
  MRATE1 <- POMIN1 - NMINS1
  MRATE2 <- POMIN2 - NMINS2
  MRATE3 <- POMIN3 - NMINS3
  
  #================
  j <- length(nitrogenMine@MRATE1) + 1
  
  nitrogenMine@MRATE1[j] <- MRATE1
  nitrogenMine@MRATE2[j] <- MRATE2
  nitrogenMine@MRATE3[j] <- MRATE3
  
  nitrogenMine@NMINS1[j] <- NMINS1
  nitrogenMine@NMINS2[j] <- NMINS2
  nitrogenMine@NMINS3[j] <- NMINS3
  
  #----------------
  return(nitrogenMine)
}