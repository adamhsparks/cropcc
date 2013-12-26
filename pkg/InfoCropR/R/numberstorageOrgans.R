# phenology
numberstorageOrgans <- function(crop, cropsv, EDTSsv, management,
                                stress, tabFunction, phenology)
{
  #---------- crop Data
  DSSTR1 <- crop@DSSTR1
  DSSTR2 <- crop@DSSTR2
  GNOCF  <- crop@GNOCF
  GNOMAX <- crop@GNOMAX
  GNSTG1 <- crop@GNSTG1
  GNSTG2 <- crop@GNSTG2
  GNSTCR <- crop@GNSTCR
  POTGWT <- crop@POTGWT
  STCOOL <- crop@STCOOL
  STWARM <- crop@STWARM
  VRSTMN <- crop@VRSTMN
  VRSTMX <- crop@VRSTMX
  
  #---------- cropsv Data
  DMGSTR <- cropsv@DMGSTR[length(cropsv@DMGSTR)]
  GCROP  <- cropsv@GCROP[length(cropsv@GCROP)]
  WGRAIN <- cropsv@WGRAIN[length(cropsv@WGRAIN)]
  WSO    <- cropsv@WSO[length(cropsv@WSO)]
  
  #---------- EDTSsv Data  
  TMAX <- EDTSsv@TMAX[length(EDTSsv@TMAX)]
  TMIN <- EDTSsv@TMIN[length(EDTSsv@TMIN)]
  
  #---------- management Data
  DAS  <- management@DAS[length(management@DAS)]
  
  #---------- phenology Data
  DS  <- phenology@DS[length(phenology@DS)]
  GNO <- phenology@GNO[length(phenology@GNO)]

  #---------- stress Data
  WSTRES <- stress@WSTRES[length(stress@WSTRES)]
  
  #---------- tabFunction Data
  DRSTRL <- tabFunction@DRSTRL
  EARCUT <- tabFunction@EARCUT
  STHIGH <- tabFunction@STHIGH
  STLOW  <- tabFunction@STLOW
  
  #================
  GNLOSS <- GNO* INSW(DS - 0.85, 0, AMAX1(DMGSTR, AFGEN(EARCUT, DAS)/100))
  
  GNFILL <- INSW(DS - GNSTCR, 0, LIMIT(0, GNO*0.1, GNO*(1 - WGRAIN/(POTGWT*0.25)))) + INSW(DS - (GNSTCR + 0.35), 0, LIMIT(0, GNO*0.1, GNO*(1 - WGRAIN/(POTGWT*0.65))))

  TPHIGH <- AMAX1(0, TMAX - STWARM)           #== threshold value for T max of the day
  TPCOOL <- AMAX1(0, STCOOL - TMIN)
  
  #XXXXXXXXXXXX-------------------------XXXXXXXXXXXXXXXXXXXXXXX-----------------------XXXXXXXXXXXXXXX
  
  STRILE <- GNO* REAAND(DS - DSSTR1, DSSTR2 - DS)* AMAX1( AFGEN(STHIGH, TPHIGH)*VRSTMX, AFGEN(STLOW, TPCOOL)*VRSTMN, AFGEN(DRSTRL, WSTRES))

  GNODAY <- GCROP* REAAND(DS - GNSTG1, GNSTG2 - DS)*GNOCF - AMIN1(GNO, GNLOSS + GNFILL + STRILE)
  GNOPOT <- GNODAY                     #Line 247: GNOPOT = INTGRL(ZERO,GNODAY)
  
  GNO    <- LIMIT(0, GNOMAX, GNOPOT)
  SINKLT <- INSW(DS - 1.2, 1, GNO*POTGWT/1000000 - WSO)
  
  #================
  j <- length(phenology@GNO) + 1
  
  phenology@GNO[j]    <- GNO
  phenology@GNLOSS[j] <- GNLOSS
  phenology@SINKLT[j] <- SINKLT
  
  #----------------
  return(phenology)
}
#==================
# phenology <- numberstorageOrgans2(crop,cropsv,EDTSsv,management,stress,tabFunction,phenology)