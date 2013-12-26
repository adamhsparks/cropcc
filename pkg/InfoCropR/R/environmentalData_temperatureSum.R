# EDTSsv
environmentalData_temperatureSum <- function(TIME, control, crop, 
                                             management, srSUBPET, 
                                             SWBsv, tabFunction, weather, 
                                             EDTSsv)
{
  #---------- control Data
  DELT   <- control@DELT
  SWCPOT <- control@SWCPOT
  TPSI   <- control@TPSI[length(control@TPSI)]
  
  #---------- crop Data
  POTATO <- crop@POTATO
  TTGERM <- crop@TTGERM
  
  #---------- management Data
  SPROUT <- management@SPROUT
  
  #---------- srSUBPET Data
  ANGOT  <- srSUBPET@ANGOT[length(srSUBPET@ANGOT)]
  
  #---------- SWBsv Data
  AWF1   <- SWBsv@AWF1[length(SWBsv@AWF1)]
  IRRIG0 <- SWBsv@IRRIG0[length(SWBsv@IRRIG0)]
  IRRIG1 <- SWBsv@IRRIG1[length(SWBsv@IRRIG1)]
  IRRIG2 <- SWBsv@IRRIG2[length(SWBsv@IRRIG2)]
  IRRIG3 <- SWBsv@IRRIG3[length(SWBsv@IRRIG3)]
  
  #---------- tabFunction Data
  CRAINP <- tabFunction@CRAINP
  CTMAXP <- tabFunction@CTMAXP
  CTMINP <- tabFunction@CTMINP
  TTGMEX <- tabFunction@TTGMEX
  
  #---------- weather Data
  DOY   <- weather@DOY[TIME]
  RAIN  <- weather@RAIN[TIME]
  RDD   <- weather@RDD[TIME]
  TMMN  <- weather@TMMN[TIME]
  TMMX  <- weather@TMMX[TIME]
  VP    <- weather@VP[TIME]
  WN    <- weather@WN[TIME]
    
  #---------- EDTSsv Data
  EDTSsv@TPS[1] <- TPSI

  RADSWC <- EDTSsv@RADSWC[length(EDTSsv@RADSWC)]
  TPS    <- EDTSsv@TPS[length(EDTSsv@TPS)]
  
  #================
  CCTMAX <- AFGEN(CTMAXP, DOY)
  CCTMIN <- AFGEN(CTMINP, DOY)
  CCRAIN <- AFGEN(CRAINP, DOY)
  
  RAINF  <- AMAX1(0, RAIN*(100 + CCRAIN) / 100)
  TRAIN  <- RAINF                  #Line 69: TRAIN = INTGRL(ZERO,RAINF)      #FJAV: Not used in FST
  IRRIGS <- IRRIG0 + IRRIG1 + IRRIG2 + IRRIG3
  TIRRIG <- IRRIGS                 #Line 71: TIRRIG = INTGRL(ZERO,IRRIGS)
  
  TMAX   <- TMMX + CCTMAX
  TMIN   <- TMMN + CCTMIN
  RADCNT <- 0.12 + REAAND(DOY - 120, 270 - DOY)*0.05
  DTR    <- INSW(RADSWC - 0.1, (ANGOT*RADCNT*sqrt(TMAX - TMIN) + 2.7628), RDD) / 1000000
  TPAV   <- 0.5*(TMAX + TMIN)
  TPAD   <- (TMAX + TPAV) / 2
  
  RTPS <- (TPAV - TPS)/5
  TPS  <- TPS + RTPS      #Line 84: TPS = INTGRL(TPSI,RTPS)
  
  WIND   <- INSW(WN - 0.1, 1.5 + REAAND(DOY - 120, 270 - DOY)*1.5, WN)
  VPSMIN <- 0.6108 * exp(17.27*TMIN / (TMIN + 237.3))
  VPA    <- AMIN1(VPSMIN, INSW(VP - 0.2, VPSMIN, VP))
  
  TTGM1  <- INSW(POTATO - 1, TTGERM, TTGERM*AFGEN(TTGMEX, SPROUT))
  TTGM   <- INSW(SWCPOT - 1, AMAX1(10, TTGM1 / AMAX1(0.1, 
                     INSW(AWF1 - 1, AWF1, AWF1 / 10))), TTGM1)
  RDAS   <- DELT
  DSTART <- RDAS   #Line 92: DSTART = INTGRL(ZERO, RDAS)
  
  #================
  j <- length(EDTSsv@DSTART) + 1

  
  EDTSsv@DSTART[j] <- DSTART
  EDTSsv@DTR[j]    <- DTR
  EDTSsv@IRRIGS[j] <- IRRIGS
  EDTSsv@RAINF[j]  <- RAINF
  EDTSsv@TIRRIG[j] <- TIRRIG
  EDTSsv@TMAX[j]   <- TMAX
  EDTSsv@TMIN[j]   <- TMIN
  EDTSsv@TPAD[j]   <- TPAD
  EDTSsv@TPAV[j]   <- TPAV
  EDTSsv@TPS[j]    <- TPS
  EDTSsv@TTGM[j]   <- TTGM
  EDTSsv@VPA[j]    <- VPA
  EDTSsv@VPSMIN[j] <- VPSMIN
  EDTSsv@WIND[j]   <- WIND
  
  #----------------
  return(EDTSsv)
}