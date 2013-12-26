# cropsv 
growthandRadiation <- function(climate, CNsv, control, crop, EDTSsv, 
                                GRsv, management, phenology, stress, 
                                tabFunction, cropsv)
{
  #---------- climate Data
  CO2 <- climate@CO2
  
  #---------- CNsv Data
  NFIX <- CNsv@NFIX[length(CNsv@NFIX)]
  
  #---------- control Data
  SWCPOT <- control@SWCPOT
  
  #---------- crop Data
  COSNFX <- crop@COSNFX
  KDFMAX <- crop@KDFMAX
  RUEMAX <- crop@RUEMAX
  
  #---------- cropsv Data
  BLIGHT <- cropsv@BLIGHT[length(cropsv@BLIGHT)]
  EFFLAI <- cropsv@EFFLAI[length(cropsv@EFFLAI)]
  LAI    <- cropsv@LAI[length(cropsv@LAI)]
  MILDEW <- cropsv@MILDEW[length(cropsv@MILDEW)]
  PSTPAR <- cropsv@PSTPAR[length(cropsv@PSTPAR)]
  RUST   <- cropsv@RUST[length(cropsv@RUST)]
  WEEDCV <- cropsv@WEEDCV[length(cropsv@WEEDCV)]
  
  #---------- EDTSsv Data
  DTR    <- EDTSsv@DTR[length(EDTSsv@DTR)]
  TPAD   <- EDTSsv@TPAD[length(EDTSsv@TPAD)]
  
  #---------- GRsv Data
  LSTR  <- GRsv@LSTR[length(GRsv@LSTR)]
  
  #---------- management Data
  DAS  <- management@DAS[length(management@DAS)]
  
  #---------- phenology Data
  DS     <- phenology@DS[length(phenology@DS)]
  
  #---------- stress Data
  NSTRES <- stress@NSTRES[length(stress@NSTRES)]
  WSTRES <- stress@WSTRES[length(stress@WSTRES)]
  
  #---------- tabFunction Data
  KDFDS  <- tabFunction@KDFDS
  EARCUT <- tabFunction@EARCUT
  RCFDS  <- tabFunction@RCFDS
  RCFCO2 <- tabFunction@RCFCO2
  RCFLN  <- tabFunction@RCFLN
  RCFTP  <- tabFunction@RCFTP
  SEVRPT <- tabFunction@SEVRPT
  
  #================
  #---------------- ***   Light interception and total crop growth rate
  KDF    <- KDFMAX* AFGEN(KDFDS, DS)                     #== crop/cultivar-specific extinction coefficient
  PARCRP <- 0.5*DTR*(1 - exp(-KDF*(EFFLAI - PSTPAR)))    #== radiation interception by the crop
  WEDLAI <- AMIN1(6, WEEDCV*LAI)
  TOTLAI <- WEDLAI + EFFLAI
  PARINT <- PARCRP - INSW(TOTLAI - 3, 0, PARCRP* AMIN1(0.95, WEEDCV))           #== photosynthetically active radiation intercepted
  
  #---------------- ** Crop growth and radiation use efficiency
  RUEABI <- AFGEN(RCFTP, TPAD)* AFGEN(RCFLN, NSTRES)* AFGEN(RCFCO2, CO2)* 
                INSW(SWCPOT - 1, LIMIT(0, 1, WSTRES + 0.2), 1)
  
  RUEBIO <- AMAX1(0, 1 - AMAX1(BLIGHT, RUST, AFGEN(SEVRPT, MILDEW), AFGEN(EARCUT, DAS)*0.3/100))    #== radiation-use efficiency factor
  RUE <- RUEMAX* AFGEN(RCFDS, DS)*RUEABI*RUEBIO                                                     #== radiation-use efficiency
  
  GCROP <- RUE*PARINT*10 + LSTR - NFIX*COSNFX
  
  #================
  j <- length(cropsv@GCROP) + 1
  cropsv@GCROP[j] <- GCROP
  
  #----------------
  return(cropsv)
}
#==================
# cropsv <- growthandRadiation7(climate,CNsv,control,crop,EDTSsv,GRsv,management,phenology,stress,tabFunction,cropsv)