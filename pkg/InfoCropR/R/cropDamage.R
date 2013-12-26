# cropsv 
cropDamage <- function(CNsv, crop, GRsv, management, 
                        pestD, tabFunction, cropsv)
{
  #---------- CNsv Data
  ANLV <- CNsv@ANLV[length(CNsv@ANLV)]
  ANSO <- CNsv@ANSO[length(CNsv@ANSO)]
  ANST <- CNsv@ANST[length(CNsv@ANST)]
  
  #---------- crop Data
  RUSTST <- crop@RUSTST
  
  #---------- cropsv Data 
  DLV    <- cropsv@DLV[length(cropsv@DLV)]
  EFFLAI <- cropsv@EFFLAI[length(cropsv@EFFLAI)]  
  HONYLS <- cropsv@HONYLS[length(cropsv@HONYLS)]
  LAI    <- cropsv@LAI[length(cropsv@LAI)]
  WSO    <- cropsv@WSO[length(cropsv@WSO)]
  
  #---------- GRsv Data
  WIR  <- GRsv@WIR[length(GRsv@WIR)]
  WLVG <- GRsv@WLVG[length(GRsv@WLVG)]
  
  #---------- management Data
  DAS  <- management@DAS[length(management@DAS)]
  ESWI <- management@ESWI[length(management@ESWI)]
  
  #---------- pestD Data
  CONSR  <- pestD@CONSR
  FEEDRT <- pestD@FEEDRT
  FRPSTL <- pestD@FRPSTL
  FRPSTS <- pestD@FRPSTS
  SKINWT <- pestD@SKINWT
  SUCKRT <- pestD@SUCKRT
  SUKNRT <- pestD@SUKNRT
  
  #---------- tabFunction Data
  CUTIND <- tabFunction@CUTIND
  DAMIND <- tabFunction@DAMIND
  NODEBR <- tabFunction@NODEBR
  PPLFBD <- tabFunction@PPLFBD
  PPOSKD <- tabFunction@PPOSKD
  PPLFGD <- tabFunction@PPLFGD
  SBINFD <- tabFunction@SBINFD
  SEVLT  <- tabFunction@SEVLT
  SEVR   <- tabFunction@SEVR
  SEVRPM <- tabFunction@SEVRPM
  TERIND <- tabFunction@TERIND
  WEED   <- tabFunction@WEED
  
  #================
  #---------- Damage due to stand removers
  SBINRT <- AFGEN(SBINFD, DAS)           #== stem borer incidence rate
  TERMRT <- AFGEN(TERIND, DAS)           #== termite incidence rate
  DAMPRT <- AFGEN(DAMIND, DAS)           #== damping off incidence rate
  CUTWRT <- AFGEN(CUTIND, DAS)           #== cutworm incidence rate
  DMGSTR <- AMAX1(SBINRT, TERMRT, DAMPRT, CUTWRT)/100
  
  #---------- Crop damage due to tissue consumers
  NODERT <- AFGEN(NODEBR, DAS)
  LVFEED <- AMIN1(LAI, AMAX1(CONSR* AFGEN(PPLFBD, DAS), FEEDRT* AFGEN(PPLFGD, DAS)))
  LRFEED <- LIMIT(0.00005, 1, LVFEED/NOTNUL(LAI))
  
  #---------- Crop damage due to sucking pests
  PPOSK  <- AFGEN(PPOSKD, DAS)                               #== total pest population on the plant
  HONYWT <- SUCKRT*0.404*PPOSK*SKINWT - HONYLS 
  HONYSM <- HONYWT
  HONYLS <- AMIN1(HONYSM, HONYSM*DLV/NOTNUL(WLVG + DLV))
  
  FRPSTP <- 1 - (FRPSTS + FRPSTL)                            #== proportion of pest population on panicles
  
  SUCKLV <- AMIN1(WLVG, SUCKRT*PPOSK*SKINWT*FRPSTL*ESWI)
  SUCKSO <- AMIN1(WSO,  SUCKRT*PPOSK*SKINWT*FRPSTP*ESWI)
  SUCKST <- AMIN1(WIR,  SUCKRT*PPOSK*SKINWT*FRPSTS*ESWI)
  
  SUKNLV <- AMIN1(ANLV, SUKNRT*PPOSK*SKINWT*FRPSTL*ESWI)
  SUKNSO <- AMIN1(ANSO, SUKNRT*PPOSK*SKINWT*FRPSTP*ESWI)
  SUKNST <- AMIN1(ANST, SUKNRT*PPOSK*SKINWT*FRPSTS*ESWI)
  
  #---------- Crop damage due to diseases
  RUST   <- AFGEN(SEVR, DAS)*RUSTST/100
  MILDEW <- AFGEN(SEVRPM, DAS)/100
  BLIGHT <- AFGEN(SEVLT, DAS)/100
  
  #---------- Crop damage due to weeds, viruses, rusts and mildews reducing interception
  WEEDCV <- AFGEN(WEED, DAS)
  PSTPAR <- LIMIT(0, EFFLAI, EFFLAI* AMAX1(HONYSM*0.5/
                             NOTNUL(HONYSM + WLVG), RUST, MILDEW, BLIGHT))
  
  #================
  j  <- length(cropsv@BLIGHT) + 1
  
  cropsv@BLIGHT[j] <- BLIGHT
  cropsv@DMGSTR[j] <- DMGSTR
  cropsv@HONYLS[j] <- HONYLS
  cropsv@HONYSM[j] <- HONYSM
  cropsv@LRFEED[j] <- LRFEED
  cropsv@LVFEED[j] <- LVFEED
  cropsv@MILDEW[j] <- MILDEW
  cropsv@NODERT[j] <- NODERT
  cropsv@PSTPAR[j] <- PSTPAR
  cropsv@RUST[j]   <- RUST
  cropsv@SUCKLV[j] <- SUCKLV
  cropsv@SUCKSO[j] <- SUCKSO
  cropsv@SUCKST[j] <- SUCKST
  cropsv@SUKNLV[j] <- SUKNLV
  cropsv@SUKNSO[j] <- SUKNSO
  cropsv@SUKNST[j] <- SUKNST
  cropsv@WEEDCV[j] <- WEEDCV
  
  #----------------
  return(cropsv)
}
#==================
# cropsv <- cropDamage2(CNsv,crop,GRsv,management,pestD,tabFunction,cropsv)