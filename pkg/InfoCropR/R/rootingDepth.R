rootingDepth <- function(crop, cropsv, GRsv, management, 
                          phenology, soil, soilD, srWSRT, tabFunction, 
                          root)
{
  
  #---------- crop Data
  TTVG   <- crop@TTVG
  ZRTI   <- crop@ZRTI
  ZRTDS  <- crop@ZRTDS
  ZRTMS  <- crop@ZRTMS
  ZRTPOT <- crop@ZRTPOT
  
  #---------- cropsv Data
  FLDLOS <- cropsv@FLDLOS[length(cropsv@FLDLOS)]
  
  #---------- GRsv Data
  RWRT  <- GRsv@RWRT[length(GRsv@RWRT)]
  
  #---------- management Data
  ESW  <- management@ESW[length(management@ESW)]
  ESWI <- management@ESWI[length(management@ESWI)]
  
  #---------- phenology Data
  DS    <- phenology@DS[length(phenology@DS)]
  
  #---------- root Data
  ZRT <- root@ZRT[length(root@ZRT)]
  
  #---------- soil Data
  BD1  <- soil@BD1[length(soil@BD1)]
  BD2  <- soil@BD2[length(soil@BD2)]
  BD3  <- soil@BD3[length(soil@BD3)]
  TKLT <- soil@TKLT[length(soil@TKLT)]
  
  #---------- soilD Data
  TKL1 <- soilD@TKL1
  TKL2 <- soilD@TKL2
  TKL3 <- soilD@TKL3
  
  #---------- srWSRT Data
  WSERT <- srWSRT@WSERT[length(srWSRT@WSERT)]
  
  #---------- tabFunction Data
  EZRTTB <- tabFunction@EZRTTB
  RTMAX  <- tabFunction@RTMAX
  
  #================
  BDSEL <- INSW(ZRT - TKL1, BD1, INSW(ZRT - TKL1 - TKL2, BD2, BD3))                 #== bulk density
  EZRTC <- ZRTPOT* AFGEN(EZRTTB, BDSEL)
  
  ZRTM  <- AMIN1( AFGEN(RTMAX, TTVG), ZRTMS, TKLT)                                  #== theoretical maximum rooting depth of the crop
  EZRT  <- ZRTI*ESW+(EZRTC *ESWI* WSERT *REAAND(ZRTM - ZRT, ZRTDS - DS) * 
                       INSW(-DS, 1, 0)*FLDLOS)* INSW(RWRT - 1, 0, 1)                #== root extension rate
  ZRT   <- EZRT                          #Line 384: ZRT = INTGRL(ZERO,EZRT)
  
  ZRT1 <- LIMIT(0, TKL1, ZRT)
  ZRT2 <- LIMIT(0, TKL2, ZRT - TKL1)
  ZRT3 <- LIMIT(0, TKL3, ZRT - TKL1 - TKL2)
  
  #================
  j <- length(root@ZRT) + 1
  root@ZRT[j] <- ZRT
  
  root@ZRT1[j] <- ZRT1
  root@ZRT2[j] <- ZRT2
  root@ZRT3[j] <- ZRT3
  
  #----------------
  return(root)
}
#==================
# root <- rootingDepth2(control,crop,cropsv,GRsv,management,phenology,soil,soilD,srWSRT,tabFunction,root)