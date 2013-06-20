#SWBsv
soilwaterBalance <- function(i, climatechange, control, crop, cropsv, management, soil,
                             soilprop, SUBPET, SWBsv, tabFunction, weather)
{

#====================================================================================
#============================================================ READ OBJECTS DATA ===== : {VarsQuantity/VarsType}   
# ------------------------------------- Climate data : {Some/Unique}
  CCRAIN <- climate@CCRAIN
  DSTART <- climate@DSTART
  RAINF  <- climate@RAINF
  RDAS   <- climate@RDAS

# ------------------------------------- Control data : {All/Unique}
  for(j in 1:length(slotNames(control))) assign(slotNames(control)[j], slot(control, slotNames(control)[j]))
  
# ------------------------------------- Crop State Variable data : {Some/Last}
  LAI    <- cropsv@LAI[length(cropsv@LAI)]

  EVSW1  <- cropsv@EVSW1[length(cropsv@EVSW1)]
  EVSW2  <- cropsv@EVSW2[length(cropsv@EVSW2)]
  EVSW3  <- cropsv@EVSW3[length(cropsv@EVSW3)]

  FLDLOS <- cropsv@FLDLOS[length(cropsv@FLDLOS)]
  TRRM   <- cropsv@TRRM[length(cropsv@TRRM)]

  TRWL1  <- cropsv@TRWL1[length(cropsv@TRWL1)]
  TRWL2  <- cropsv@TRWL2[length(cropsv@TRWL2)]
  TRWL3  <- cropsv@TRWL3[length(cropsv@TRWL3)]

  WEEDCV <- cropsv@WEEDCV[length(cropsv@WEEDCV)]

  WSE1   <- cropsv@WSE1[length(cropsv@WSE1)]
  WSE2   <- cropsv@WSE2[length(cropsv@WSE2)]
  WSE3   <- cropsv@WSE3[length(cropsv@WSE3)]

  ZRT1   <- cropsv@ZRT1[length(cropsv@ZRT1)]
  ZRT2   <- cropsv@ZRT2[length(cropsv@ZRT2)]
  ZRT3   <- cropsv@ZRT3[length(cropsv@ZRT3)]

  EZRT   <- cropsv@EZRT[length(cropsv@EZRT)]
  
# ------------------------------------- Management data : {Some/Unique}
  DAS    <- management@DAS
  BUNDHT <- management@BUNDHT
  PUDLE  <- management@PUDLE
  IRSWCH <- management@IRSWCH
  SEEDAG <- management@SEEDAG
  SWCWAT <- management@SWCWAT
  NEWAGE <- management@NEWAGE
  
# ------------------------------------- Soil data : {Some/Last}
  KSAT1  <- soil@KSAT1[length(soil@KSAT1)]
  KSAT2  <- soil@KSAT2[length(soil@KSAT2)]
  KSAT3  <- soil@KSAT3[length(soil@KSAT3)]

  PDCF1  <- soil@PDCF1[length(soil@KSAT1)]
  PDCF2  <- soil@PDCF2[length(soil@KSAT1)]
  PDCF3  <- soil@PDCF3[length(soil@KSAT1)]

  SAND1  <- soil@SAND1[length(soil@SAND1)]
  SAND2  <- soil@SAND2[length(soil@SAND2)]
  SAND3  <- soil@SAND3[length(soil@SAND3)]

  SLOPE  <- soil@SLOPE[length(soil@SLOPE)]
  SOILSW <- soil@SOILSW[length(soil@SOILSW)]

  TKL1   <- soil@TKL1[length(soil@TKL1)]
  TKL2   <- soil@TKL2[length(soil@TKL2)]
  TKL3   <- soil@TKL3[length(soil@TKL3)]

  TKL3M  <- soil@TKL3M[length(soil@TKL3M)]

  WCFC1  <- soil@WCFC1[length(soil@WCFC1)]
  WCFC2  <- soil@WCFC2[length(soil@WCFC2)]
  WCFC3  <- soil@WCFC3[length(soil@WCFC3)]

  WCFCM1 <- soil@WCFCM1[length(soil@WCFCM1)]
  WCFCM2 <- soil@WCFCM2[length(soil@WCFCM2)]
  WCFCM3 <- soil@WCFCM3[length(soil@WCFCM3)]

  WCST1  <- soil@WCST1[length(soil@WCST1)]
  WCST2  <- soil@WCST2[length(soil@WCST2)]
  WCST3  <- soil@WCST3[length(soil@WCST3)]

  WCWP1  <- soil@WCWP1[length(soil@WCWP1)]
  WCWP2  <- soil@WCWP2[length(soil@WCWP2)]
  WCWP3  <- soil@WCWP3[length(soil@WCWP3)]

  WCWPM1 <- soil@WCWPM1[length(soil@WCWPM1)]
  WCWPM2 <- soil@WCWPM2[length(soil@WCWPM2)]
  WCWPM3 <- soil@WCWPM3[length(soil@WCWPM3)]
  
# ------------------------------------- SUBPET data : {Some/Last}
  PEVAP <- SUBPET@PEVAP[length(SUBPET@PEVAP)]

#--------------------------------------  SoilProperties Data : {Some/Last}
  WCWPC1 <- soilprop@WCWPC1[length(soilprop@WCWPC1)]
  WCWPC2 <- soilprop@WCWPC2[length(soilprop@WCWPC2)]
  WCWPC3 <- soilprop@WCWPC3[length(soilprop@WCWPC3)]
  
# ------------------------------------- SoilWaterBalance State Variable data : {All/Last}
  SWBsvList <- .dataObjectExtract(SWBsv,"last")
  for(j in 1:length(SWBsvList)) assign(names(SWBsvList)[j], SWBsvList[j])

# ------------------------------------- Fetch Tabular Functions : {Some/Unique}
   IRRTSF <- tabFunction@IRRTSF
   IRRTL1 <- tabFunction@IRRTL1
   IRRTL2 <- tabFunction@IRRTL2
   IRRTL3 <- tabFunction@IRRTL3
   RNSOIL <- tabFunction@RNSOIL
   
# ------------------------------------- Weather data : {All/One-i}
  weatherList <- .dataObjectExtract(weather, i+1)
  for(j in 1:length(weatherList)) assign(names(weatherList)[j], weatherList[j])  
  

#====================================================================================
#=================================== SOIL WATER BALANCE 1. ALGEBRAIC SEQUENTIAL ===== 
    AINTC  <- AMIN1(RAINF, 0.25*LAI)
    
    IRRADD <- INSW(IRSWCH-1, 0, 60*REAAND(DAS-20, 22-DAS)+
                     60*REAAND(DAS-45, 47-DAS)*IRRSEN+
                     60*REAAND(DAS-70, 72-DAS)+
                     60*REAAND(DAS-90, 92-DAS)+
                     60*REAAND(DAS-110, 112-DAS)+
                     60*REAAND(DAS-130, 132-DAS))

    WCL1   <- WL1/TKL1
    WCL2   <- WL2/TKL2
    WCL3   <- WL3/TKL3

    AWF1   <- INSW(SWXWAT - 1, (WCL1 - WCWP1)/(WCFC1 - WCWP1), 1)
    AWF2   <- INSW(SWXWAT - 1, (WCL2 - WCWP2)/(WCFC2 - WCWP2), 1)
    AWF3   <- INSW(SWXWAT - 1, (WCL3 - WCWP3)/(WCFC3 - WCWP3), 1)

#====================================================================================
#================================ SOIL WATER BALANCE 2. DIFFERENTIAL INTEGRATED =====
SWBmod <- function(Time, State, Pars){
  with(as.list(State), {    
    
    POND      <- AMAX1(0., PONDTP)
    
    IRRIG0 <- AFGEN(IRRTSF, DSTART) + IRRADD  
    IRRIG1 <- AFGEN(IRRTL1, DSTART)
    IRRIG2 <- AFGEN(IRRTL2, DSTART)
    IRRIG3 <- AFGEN(IRRTL3, DSTART)
    
    PNDEVP    <- AMAX1(0, INSW(POND - PEVAP, POND, PEVAP))
    
    WLFL1 <- AMAX1(0, AMIN1(KSAT1, POND)) 
    WLFL2 <- AMAX1(0, WLFL1 + WL1 + IRRIG1 - TKL1*WCFC1)
    WLFL3 <- AMAX1(0, WLFL2 + WL2 + IRRIG2 - TKL2*WCFC2)
    WLFL4 <- AMAX1(0, WLFL3 + WL3 + IRRIG3 - TKL3*WCFC3)
    
    DRAIN <- AMIN1(KSAT3, WLFL4)
    
    WLFL5 <- INSW((DRAIN - WLFL4), (WLFL4 - DRAIN), 0)  
    WLFL6 <- INSW((DRAIN - WLFL4), AMAX1(0, WLFL5 -(WCST3 - WCFC3)*TKL3), 0)
    WLFL7 <- INSW((DRAIN - WLFL4), AMAX1(0, WLFL6 -(WCST2 - WCFC2)*TKL2), 0)
    WLFL8 <- INSW((DRAIN - WLFL4), AMAX1(0, WLFL7 -(WCST1 - WCFC1)*TKL1), 0)
    
    RNOFF  <- AMAX1(0, INSW(BUNDHT - 2, RUNNAT, 0) + POND - AINTC - 
                      PNDEVP - WLFL1 + WLFL8 - BUNDHT)
    RUNNAT <- (RAINF + IRRIG0)* AFGEN(RNSOIL, SLOPE)
    
    WL1RT <- WLFL1 + IRRIG1 + WLFL7 - WLFL2 - WLFL8 - EVSW1 - TRWL1*(1 + WEEDCV)
    WL2RT <- WLFL2 + IRRIG2 + WLFL6 - WLFL3 - WLFL7 - EVSW2 - TRWL2*(1 + WEEDCV)
    WL3RT <- WLFL3 + IRRIG3 + WLFL5 - WLFL4 - WLFL6 - EVSW3 - TRWL3*(1 + WEEDCV)
    
    WL1 <- AMAX1(WCWP1*TKL1, WL1T)
    WL2 <- AMAX1(WCWP2*TKL2, WL2T)
    WL3 <- AMAX1(WCWP3*TKL3, WL3T)
    
    dPONDTP <- RAINF + IRRIG0 - AINTC - PNDEVP - WLFL1 - RNOFF + WLFL8
    dDAPOND <- INSW(POND - 10., - DAPOND, 1.)
    
    dWL1T   <- WL1RT
    dWL2T   <- WL2RT
    dWL3T   <- WL3RT
    
    return(list(c(dPONDTP, dDAPOND, dWL1T, dWL2T, dWL3T), IRRIG0, IRRIG1, IRRIG2, IRRIG3))
  })
} 

yini  <- c(PONDTP=PONDTP, DAPOND=DAPOND, WL1T=WL1T, WL2T=WL2T, WL3T=WL3T)
times <- seq(0,1,1)
out   <- ode(yini, times, SWBmod, parms=NULL)

#-----------------------------  
  PONDTP <- out[2,2]  
  DAPOND <- out[2,3]

  WL1T   <- out[2,4]
  WL2T   <- out[2,5]
  WL3T   <- out[2,6]

  IRRIG0 <- out[2,7]
  IRRIG1 <- out[2,8]
  IRRIG2 <- out[2,9]
  IRRIG3 <- out[2,10]
  
  WL1 <- AMAX1(WCWP1*TKL1, WL1T)
  WL2 <- AMAX1(WCWP2*TKL2, WL2T)
  WL3 <- AMAX1(WCWP3*TKL3, WL3T)

#-----------------------------
  j               <- length(SWBsv@DINDEX) + 1
  SWBsv@DINDEX[j] <- i
  
  SWBsv@AWF1[j]   <- AWF1
  SWBsv@AWF2[j]   <- AWF2
  SWBsv@AWF3[j]   <- AWF3
  
  SWBsv@DAPOND[j] <- DAPOND
  SWBsv@PONDTP[j] <- PONDTP
  
  SWBsv@WL1[j]    <- WL1
  SWBsv@WL2[j]    <- WL2
  SWBsv@WL3[j]    <- WL3
  
  SWBsv@WL1T[j]   <- WL1T
  SWBsv@WL2T[j]   <- WL2T
  SWBsv@WL3T[j]   <- WL3T
  
  SWBsv@IRRIG0[j] <- IRRIG0
  SWBsv@IRRIG1[j] <- IRRIG1
  SWBsv@IRRIG2[j] <- IRRIG2
  SWBsv@IRRIG3[j] <- IRRIG3
  
  SWBsv@WCL1[j]   <- WCL1
  SWBsv@WCL2[j]   <- WCL2
  SWBsv@WCL3[j]   <- WCL3
  
  SWBsv@WL1RT[j]  <- WL1RT
  SWBsv@WL2RT[j]  <- WL2RT
  SWBsv@WL3RT[j]  <- WL3RT

  return(SWBsv)
}