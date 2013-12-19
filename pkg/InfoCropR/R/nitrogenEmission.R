# nitrogenEmi
nitrogenEmission <- function(DINDEXs, carbonMine, SNBsv, soil, stress,
                             SWBsv, tabFunction, nitrogenEmi)
{  
  #---------- carbonMine Data
  MBSOL <- carbonMine@MBSOL[length(carbonMine@MBSOL)]
  
  #---------- SNBsv Data
  NH41 <- SNBsv@NH41[length(SNBsv@NH41)]
  NO31 <- SNBsv@NO31[length(SNBsv@NO31)]
  
  #---------- soil Data
  N2DRAT <- soil@N2DRAT[length(soil@N2DRAT)]
  N2NRAT <- soil@N2NRAT[length(soil@N2NRAT)]
  
  #---------- stress Data
  MFAC  <- stress@MFAC[length(stress@MFAC)]
  PHFAC <- stress@PHFAC[length(stress@PHFAC)]
  TFAC  <- stress@TFAC[length(stress@TFAC)]
  
  #---------- SWBsv Data
  AWF1   <- SWBsv@AWF1[length(SWBsv@AWF1)]
  
  #---------- tabFunction Data
  MBTAB <- tabFunction@MBTAB
  MTABD <- tabFunction@MTABD
  
  #================
  #---------------- ** N2O Emission due to nitrification
  MBFAC  <- AFGEN(MBTAB, MBSOL)
  N2ONIT <- AMAX1(0, (NH41*(1- exp(-N2NRAT)))*TFAC*MBFAC* AMIN1(MFAC, PHFAC))
  
  #---------------- ** N2O Emission due to denitrifcation
  N2ODEN <- AMAX1(0, (NO31*(1- exp(-N2DRAT)))* AFGEN(MTABD, AWF1)*MBFAC* AMIN1(TFAC, PHFAC))
  
  #---------------- ** Total N2O emission
  N2OTOT <- (N2ONIT + N2ODEN)
  N2OTOS <- N2OTOT                    #FJAV: Defined, Line 723: N2OTOS = INTGRL(ZERO,N2OTOT), but NOT used in FST
  
  #================
  j <- length(nitrogenEmi@DINDEX) + 1
  nitrogenEmi@DINDEX[j] <- DINDEXs
  
  nitrogenEmi@MBFAC[j]  <- MBFAC
  nitrogenEmi@N2ODEN[j] <- N2ODEN
  nitrogenEmi@N2ONIT[j] <- N2ONIT
  nitrogenEmi@N2OTOT[j] <- N2OTOT
  
  #----------------
  return(nitrogenEmi)
}
#==================
# nitrogenEmi <- nitrogenEmission(DINDEXs,carbonMine,SNBsv,soil,stress,SWBsv,tabFunction,nitrogenEmi)