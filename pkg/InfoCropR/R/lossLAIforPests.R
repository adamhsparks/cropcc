# cropsv 
lossLAIforPests <- function(crop, EDTSsv, GRsv, management, 
                             pestD, phenology, stress, tabFunction, cropsv)
{
  #---------- control Data
  SEEDRT <- management@SEEDRT
  
  #---------- crop Data
  DSMAXL <- crop@DSMAXL
  RGRPOT <- crop@RGRPOT
  SLAVAR <- crop@SLAVAR
  STDSRT <- crop@STDSRT
  
  #---------- cropsv Data
  BLIGHT <- cropsv@BLIGHT[length(cropsv@BLIGHT)]
  DLDETH <- cropsv@DLDETH[length(cropsv@DLDETH)]
  DMGSTR <- cropsv@DMGSTR[length(cropsv@DMGSTR)]
  FRDMG  <- cropsv@FRDMG[length(cropsv@FRDMG)]
  HONYSM <- cropsv@HONYSM[length(cropsv@HONYSM)]
  LAI    <- cropsv@LAI[length(cropsv@LAI)]
  LVFEED <- cropsv@LVFEED[length(cropsv@LVFEED)]
  MILDEW <- cropsv@MILDEW[length(cropsv@MILDEW)]
  RLAI   <- cropsv@RLAI[length(cropsv@RLAI)]
  RUST   <- cropsv@RUST[length(cropsv@RUST)]
  SAIA   <- cropsv@SAIA[length(cropsv@SAIA)]
  
  #---------- EDTSsv Data
  TPAV <- EDTSsv@TPAV[length(EDTSsv@TPAV)]
  
  #---------- GRsv Data
  WLVG <- GRsv@WLVG[length(GRsv@WLVG)]
  
  #---------- management Data
  DAS <- management@DAS[length(management@DAS)]
  
  #---------- pestD Data
  RGRFAC <- pestD@RGRFAC
  
  #---------- phenology Data
  DS <- phenology@DS[length(phenology@DS)]
  
  #---------- stress Data
  NSTRES <- stress@NSTRES[length(stress@NSTRES)]
  
  #---------- tabFunction Data
  DSATMP <- tabFunction@DSATMP
  LAIFAC <- tabFunction@LAIFAC
  LVFOLD <- tabFunction@LVFOLD
  SLACF  <- tabFunction@SLACF
  SNLVGA <- tabFunction@SNLVGA
  
  #================
  LALOSS <- AMIN1(LAI*0.95, LAI* LIMIT(0, 1, AMAX1(BLIGHT, RUST, MILDEW, DMGSTR, AFGEN(LVFOLD, DAS)*0.5/100)) + LVFEED)
  SAI    <- AMAX1(0, SAIA* AFGEN(LAIFAC, DS))
  EFFLAI <- AMAX1(0, LAI + SAI)
  
  LALDAY <- INSW(DS - 0.15, 0, INSW(EFFLAI - LALOSS - 0.001, 1, -DLDETH))
  DLDETH <- LALDAY                     #Line 182: DLDETH = INTGRL(ZERO,LALDAY)
                       #FJAV: {LALDAY <- f(DLDETH)} & {DLDETH <- f(LALDAY)}, but any is used anywher in FST
  
  RGRL  <- RGRPOT*RGRFAC* AMAX1(0.5, NSTRES)* LIMIT(0, 1.2, SEEDRT/STDSRT)
  SLA   <- SLAVAR *AFGEN(SLACF, DS)
  DSAI  <- SAI* AFGEN(SNLVGA, DS)* AFGEN(DSATMP, TPAV)
  RLAIA <- INSW(DS - DSMAXL, RLAI, 0)
  SAIRT <- RLAIA - AMIN1(SAI, SAI*(DMGSTR + FRDMG + HONYSM*0.5/ NOTNUL(HONYSM + WLVG)) + DSAI)           #== stem area index
  SAIA  <- SAIRT                       #Line 190: SAIA = INTGRL(ZERO,SAIRT)
  
  #================
  j <- length(cropsv@LALOSS) + 1
  
  cropsv@DLDETH[j] <- DLDETH
  cropsv@DSAI[j]   <- DSAI
  cropsv@EFFLAI[j] <- EFFLAI
  cropsv@LALOSS[j] <- LALOSS
  cropsv@RGRL[j]   <- RGRL
  cropsv@SAI[j]    <- SAI
  cropsv@SAIA[j]   <- SAIA
  cropsv@SLA[j]    <- SLA
  
  #----------------
  return(cropsv)
}