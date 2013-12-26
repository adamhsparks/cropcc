# TODO JvE: LAII = LAI[1] etc.
initialConditions_runControl <- function(TIME, crop, cropsv, management, pestD,
                                         phenology, soilD, tabFunction, 
                                         weather, control)
{
  #---------- control Data
  DSI    <- control@DSI
  SEEDRT <- control@SEEDRT
  SWCPOT <- control@SWCPOT
  
  #---------- crop Data  
  FRLVWT <- crop@FRLVWT
  GREENF <- crop@GREENF
  POTATO <- crop@POTATO
  SLAVAR <- crop@SLAVAR
  
  #---------- cropsv Data 
  LAI <- cropsv@LAI[length(cropsv@LAI)]
  
  #---------- management Data
  PUDLE  <- management@PUDLE[length(management@PUDLE)]
  SOWDEP <- management@SOWDEP[length(management@SOWDEP)]
  SWCNIT <- management@SWCNIT[length(management@SWCNIT)]
  SWCWAT <- management@SWCWAT[length(management@SWCWAT)]
  
  #---------- pestD Data
  RGMPST <- pestD@RGMPST
  
  #---------- phenology Data
  DS <- phenology@DS[length(phenology@DS)]
  
  #---------- soilD Data
  BDM1   <- soilD@BDM1
  BDM2   <- soilD@BDM2
  BDM3   <- soilD@BDM3
  
  NO31II <- soilD@NO31II
  NO32II <- soilD@NO32II
  NO33II <- soilD@NO33II
  
  SOC1   <- soilD@SOC1
  SOC2   <- soilD@SOC2
  SOC3   <- soilD@SOC3
  
  TKL1   <- soilD@TKL1
  TKL2   <- soilD@TKL2
  TKL3M  <- soilD@TKL3M
  
  WCFCM1 <- soilD@WCFCM1
  WCFCM2 <- soilD@WCFCM2
  WCFCM3 <- soilD@WCFCM3
  
  #---------- tabFunction Data
  FCSDEP <- tabFunction@FCSDEP
  NMAXLT <- tabFunction@NMAXLT
  SLACF  <- tabFunction@SLACF
  
  #---------- weather Data
  TMMN  <- weather@TMMN[TIME]
  TMMX  <- weather@TMMX[TIME]
  
  #================
  TPSI <- 0.5*(TMMX + TMMN)
  
  TKL3 <- INSW(PUDLE - 0.5, TKL3M, 0.1)
  
  WCLI1 <- WCFCM1*0.9
  WCLI2 <- WCFCM2*0.8
  WCLI3 <- WCFCM3*0.75
  
  WL1I <- WCLI1 * TKL1 
  WL2I <- WCLI2 * TKL2
  WL3I <- WCLI3 * TKL3
  
  WLVI <- SEEDRT* AFGEN(FCSDEP, SOWDEP)*FRLVWT*RGMPST
  WRTI <- SEEDRT - WLVI
  
  LAII <- WLVI*SLAVAR *AFGEN(SLACF, DSI) #JvE: Needs to be included in cropsv construction, because LAII = LAI[1]
  
  NRTI <- WRTI* AFGEN(NMAXLT, DSI)*GREENF*0.5
  NLVI <- WLVI* AFGEN(NMAXLT, DSI)*GREENF
  
  SOC1KG <- SOC1*TKL1/150*22000* INSW(PUDLE - 0.98, BDM1/1.56, 1)
  SOC2KG <- SOC2*TKL2/150*22000* INSW(PUDLE - 0.98, BDM2/1.56, 1)
  SOC3KG <- SOC3*TKL3/150*22000* INSW(PUDLE - 0.98, BDM3/1.56, 1)
  
  NO31I <- NO31II   #---------- FJAV: Not make sense. What meaning?
  NO32I <- NO32II
  NO33I <- NO33II
  
  #*** Switches for simulation control
  SWXWAT <- INSW(SWCPOT - 1, INSW(SWCWAT - 1, 0, 1), 1)
  SWXNIT <- INSW(SWCPOT - 1, INSW(SWCNIT - 1, 0, 1), 1)
  FPOTAT <- INSW(POTATO - 1, 10, INSW(DS - 0.75, 10, 
                                 INSW(LAI - 0.08, -1, 1)))
  
  #INSIDE SUBROUTINE SUBWRI
  #GNO <- GNO/10000                             #FJAV: GNO    inside phenology object, numberstorageOgans2.R 
  #SINKLT <- ifelse(SINKLT < 0, -1, SINKLT)     #FJAV: SINKLT inside phenology object, numberstorageOgans2.R
  #SINKLT <- ifelse(SINKLT > 0,  1, SINKLT)
  
  
  #================
  j <- length(control@LAII) + 1
  control@FPOTAT[j] <- FPOTAT
  
  control@LAII[j]   <- LAII
  
  control@NLVI[j]   <- NLVI
  control@NRTI[j]   <- NRTI
  
  control@NO31I[j]  <- NO31I
  control@NO32I[j]  <- NO32I
  control@NO33I[j]  <- NO33I
  
  control@SOC1KG[j] <- SOC1KG
  control@SOC2KG[j] <- SOC2KG
  control@SOC3KG[j] <- SOC3KG
  
  control@SWXNIT[j] <- SWXNIT
  control@SWXWAT[j] <- SWXWAT
  
  control@TKL3[j]   <- TKL3
  control@TPSI[j]   <- TPSI
  
  control@WL1I[j]   <- WL1I
  control@WL2I[j]   <- WL2I
  control@WL3I[j]   <- WL3I
  
  control@WLVI[j]   <- WLVI
  control@WRTI[j]   <- WRTI
  
  #----------------
  return(control)
}
