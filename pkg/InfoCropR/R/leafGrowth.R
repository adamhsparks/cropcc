# cropsv
leafGrowth <- function(CNsv, control, crop, EDTSsv, GRsv, management, 
                          phenology, srGLA, stress, tabFunction, cropsv)
{
  #---------- CNsv Data 
  NMOBIL <- CNsv@NMOBIL[length(CNsv@NMOBIL)]
  
  #---------- control Data
  LAII <- control@LAII[length(control@LAII)]
  
  #---------- crop Data
  NMOBIF <- crop@NMOBIF
  
  #---------- cropsv Data 
  BLIGHT <- cropsv@BLIGHT[length(cropsv@BLIGHT)]
  DMGSTR <- cropsv@DMGSTR[length(cropsv@DMGSTR)]
  DSAI   <- cropsv@DSAI[length(cropsv@DSAI)]
  FRDMG  <- cropsv@FRDMG[length(cropsv@FRDMG)]
  HONYSM <- cropsv@HONYSM[length(cropsv@HONYSM)]
  LAI    <- cropsv@LAI[length(cropsv@LAI)]
  LALOSS <- cropsv@LALOSS[length(cropsv@LALOSS)]
  MILDEW <- cropsv@MILDEW[length(cropsv@MILDEW)]
  NODERT <- cropsv@NODERT[length(cropsv@NODERT)]
  PLTR   <- cropsv@PLTR[length(cropsv@PLTR)]
  RUST   <- cropsv@RUST[length(cropsv@RUST)]
  SAI    <- cropsv@SAI[length(cropsv@SAI)]
  TPSHOK <- cropsv@TPSHOK[length(cropsv@TPSHOK)]
  WSO    <- cropsv@WSO[length(cropsv@WSO)]
  
  #---------- EDTSsv Data
  TPAV <- EDTSsv@TPAV[length(EDTSsv@TPAV)]
  
  #---------- GRsv Data
  WLVG <- GRsv@WLVG[length(GRsv@WLVG)]
  WST  <- GRsv@WST[length(GRsv@WST)]
  
  #---------- management Data
  DAS <- management@DAS[length(management@DAS)]
  ESW <- management@ESW[length(management@ESW)]
  
  #---------- phenology Data
  DS <- phenology@DS[length(phenology@DS)]
  
  #---------- srGLA Data
  GLAI <- srGLA@GLAI[length(srGLA@GLAI)]
  
  #---------- stress Data
  NSTRES <- stress@NSTRES[length(stress@NSTRES)]
  WSTRES <- stress@WSTRES[length(stress@WSTRES)]
  
  #---------- tabFunction Data
  LVFOLD <- tabFunction@LVFOLD
  RDRT   <- tabFunction@RDRT
  RDRTP  <- tabFunction@RDRTP
  SENWAT <- tabFunction@SENWAT
  
  #================
  RDRSH <- LIMIT(0, 0.03, 0.03*(LAI - 4)/4)
  
  DLAI  <- AMIN1(LAI, LAI* AMAX1(RDRSH, AFGEN(RDRT, DS)) + LAI*FRDMG +
                   NMOBIL*LAI*NMOBIF + LAI*0.03* AMAX1( AFGEN(RDRTP, TPAV),
                   AFGEN(SENWAT, WSTRES), INSW(WSO - 1, AFGEN(SENWAT, NSTRES), 0)))  #== death rate of LAI, senescence
  
  DLV   <- WLVG* AMIN1(0.95, DLAI/ NOTNUL(LAI) + AMAX1(DMGSTR, RUST, 
                   BLIGHT, MILDEW, HONYSM*0.5/ NOTNUL(HONYSM + WLVG), 
                    AFGEN(LVFOLD, DAS)*0.5/100))
  
  DST    <- AMIN1(WST, WST*DSAI*0.5/ NOTNUL(SAI) + DMGSTR*WST + NODERT*WST/100)
  
  RLAI   <- LAII*ESW + GLAI*TPSHOK - DLAI - LAI*(1 - PLTR) - LALOSS
  
  LAITMP <- RLAI                       #Line 176: LAITMP = INTGRL(ZERO,RLAI)
  
  LAI    <- AMAX1(0, LAITMP)
  
  #================
  j <- length(cropsv@DLV) + 1
  cropsv@DLV[j]  <- DLV
  cropsv@DST[j]  <- DST
  cropsv@LAI[j]  <- LAI
  cropsv@RLAI[j] <- RLAI
  
  #----------------
  return(cropsv)
}
#==================
# cropsv <- leafGrowth4(CNsv,control,crop,EDTSsv,GRsv,management,phenology,srGLA,stress,tabFunction,cropsv)