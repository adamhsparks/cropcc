# stress
stressMultipleSources <- function(CNsv, cropsv, EDTSsv,
                                  management, soilD, srSUBPET, SWBsv,
                                  tabFunction, stress)
{
  #---------- CNsv Data
  ANCRGR <- CNsv@ANCRGR[length(CNsv@ANCRGR)]
  ANCRPT <- CNsv@ANCRPT[length(CNsv@ANCRPT)]
  
  #---------- cropsv Data 
  ATRANS <- cropsv@ATRANS[length(cropsv@ATRANS)]
  
  #---------- EDTSsv Data
  TPS <- EDTSsv@TPS[length(EDTSsv@TPS)]
  
  #---------- management Data
  DAS  <- management@DAS[length(management@DAS)]
  ESWI <- management@ESWI[length(management@ESWI)]
  SWXNIT <- management@SWXNIT[length(management@SWXNIT)]
  SWXWAT <- management@SWXWAT[length(control@SWXWAT)]
  
  #---------- soilD Data
  PHSOL <- soilD@PHSOL
  
  #---------- srSUBPET Data
  PTRANS <- srSUBPET@PTRANS[length(srSUBPET@PTRANS)]
  
  #---------- SWBsv Data
  AWF1   <- SWBsv@AWF1[length(SWBsv@AWF1)]
  
  #---------- tabFunction Data
  MTAB   <- tabFunction@MTAB
  PHTAB  <- tabFunction@PHTAB
  PHTABV <- tabFunction@PHTABV
  TMPTAB <- tabFunction@TMPTAB
  TMPTBV <- tabFunction@TMPTBV
  
  #================
  #---------------- *** Effects of pH on soil processes
  PHFAC  <- AFGEN(PHTAB,  PHSOL)
  PHFACV <- AFGEN(PHTABV, PHSOL)
  
  #---------------- *** Effects of temperature on soil
  TFAC  <- AFGEN(TMPTAB, TPS)
  TFACV <- AFGEN(TMPTBV, TPS)
  
  #---------------- *** Loss due to water stress
  WSTRSX <- INSW(ESWI - 1, 1, LIMIT(0, 1, ATRANS/ NOTNUL(PTRANS)))
  WSTRES <- INSW(SWXWAT - 1, WSTRSX, 1)
  
  MFAC <- AFGEN(MTAB, AWF1)
  
  #---------------- ***  Nitrogen stress in the crop
  NSTRX  <- INSW(ESWI - 1, 1, LIMIT(0, 1, ANCRGR/NOTNUL(ANCRPT)))
  NSTRES <- INSW(SWXNIT - 1, NSTRX, 1)
  
  NSTOT  <- NSTRES                     #Line 336: NSTOT = INTGRL(ZERO,NSTRES)
  NSMEAN <- NSTOT/NOTNUL(DAS)    #FJAV: NSTOT is only for NSMEAN, but NSMEAN is not used in FST anywhere
  
  #================
  j <- length(stress@MFAC) + 1
  
  stress@MFAC[j]   <- MFAC
  stress@NSTRES[j] <- NSTRES
  stress@TFAC[j]   <- TFAC
  stress@TFACV[j]  <- TFACV
  stress@PHFAC[j]  <- PHFAC
  stress@PHFACV[j] <- PHFACV
  stress@WSTRES[j] <- WSTRES
  
  #----------------
  return(stress)
}
#==================
# stress <- stressMultipleSources(DINDEXs,CNsv,control,cropsv,EDTSsv,management,soilD,srSUBPET,SWBsv,tabFunction,stress)