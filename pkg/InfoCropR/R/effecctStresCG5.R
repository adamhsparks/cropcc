# cropsv
effecctStresCG5 <- function(control, crop, EDTSsv, phenology, SWBsv, tabFunction, cropsv)
{
  #---------- control Data
  SWCPOT <- control@SWCPOT
  
  #---------- crop Data
  FLDCRP <- crop@FLDCRP
  FROSSN <- crop@FROSSN
  NHRICE <- crop@NHRICE
  VARFLD <- crop@VARFLD
  
  #---------- cropsv Data
  FLOOD <- cropsv@FLOOD[length(cropsv@FLOOD)]
  FROST <- cropsv@FROST[length(cropsv@FROST)]
  
  #---------- EDTSsv Data  
  TMIN   <- EDTSsv@TMIN[length(EDTSsv@TMIN)]
  
  #---------- phenology Data
  DS     <- phenology@DS[length(phenology@DS)]
  
  #---------- SWBsv Data
  AWF1   <- SWBsv@AWF1[length(SWBsv@AWF1)]
  POND   <- SWBsv@POND[length(SWBsv@POND)]
  
  #---------- tabFunction Data
  FLDFAC <- tabFunction@FLDFAC
  FLODDS <- tabFunction@FLODDS
  FRSTDS <- tabFunction@FRSTDS
  FROSTD <- tabFunction@FROSTD
  
  #================
  #---------------- ** Loss due to waterlogging
  FLDDAY <- INSW(AWF1 - 1.2, INSW(POND - 0.1, -FLOOD, 1), 1)                    #== soil waterlogged on a day
  FLOOD  <- FLDDAY                     #Line 510: FLOOD = INTGRL(ZERO,FLDDAY)
  FLODLS <- LIMIT(0, 1, AFGEN(FLDFAC, FLOOD)*FLDCRP*VARFLD*
                    INSW(FLOOD - 2, 1, AFGEN(FLODDS, DS)))
  FLDLOS <- INSW(SWCPOT - 1, INSW(NHRICE - 0.3, FLODLS, 1), 1)
  
  #---------------- ** Loss due to frost
  FRSDAY <- INSW(TMIN - FROSSN, 1, -FROST)                                      #== days of frost
  FROST  <- FRSDAY                     #Line 517: FROST = INTGRL(ZERO,FRSDAY)
  FRDMG  <- LIMIT(0, 1, AFGEN(FROSTD, FROST)* INSW(FROST - 1, 1, 
                    AFGEN(FRSTDS, DS)) + INSW(AWF1 - 0.9, 0, -0.2))
  
  #================
  j <- length(cropsv@FLDLOS) + 1
  
  cropsv@FLDLOS[j] <- FLDLOS
  cropsv@FLOOD[j]  <- FLOOD
  cropsv@FRDMG[j]  <- FRDMG
  cropsv@FROST[j]  <- FROST
  
  #----------------
  return(cropsv)
}
#==================
# cropsv <- effecctStresCG5(control,crop,EDTSsv,phenology,SWBsv,tabFunction,cropsv)