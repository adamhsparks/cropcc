# cropsv
fillingrateStorageOrgans8 <- function(crop, EDTSsv, GRsv, phenology, cropsv)
{
  #---------- crop Data
  DSGFIL <- crop@DSGFIL
  ENERGY <- crop@ENERGY
  GFRVAR <- crop@GFRVAR
  MOISTC <- crop@MOISTC
  POTGWT <- crop@POTGWT
  SHELLP <- crop@SHELLP
  TPRGFR <- crop@TPRGFR
  
  #---------- cropsv Data 
  AGFR <- cropsv@AGFR[length(cropsv@AGFR)]
  
  #---------- EDTSsv Data
  TPAV <- EDTSsv@TPAV[length(EDTSsv@TPAV)]
  
  #---------- GRsv Data
  RWSO <- GRsv@RWSO[length(GRsv@RWSO)]
  TDM  <- GRsv@TDM[length(GRsv@TDM)]
  
  #---------- phenology Data
  DS     <- phenology@DS[length(phenology@DS)]
  GNLOSS <- phenology@GNLOSS[length(phenology@GNLOSS)]
  GNO    <- phenology@GNO[length(phenology@GNO)]
  
  #================
  MAXGFR <- AMIN1(GFRVAR*1.33, GFRVAR*(2^((TPAV - TPRGFR)/10)))*GNO/1000000          #== temperature-dependant potential filling rate
  WSO    <- AGFR                       #Line 268: WSO = INTGRL(ZERO,AGFR)
  AGFR   <- AMAX1(0, AMIN1(MAXGFR, RWSO))* REAAND(DS - DSGFIL, 2 - DS) - WSO*GNLOSS/ NOTNUL(GNO)
  WGRAIN <- AMIN1(POTGWT, WSO*1000000/ NOTNUL(GNO))
  YIELD  <- WSO/(MOISTC*ENERGY*SHELLP/100)                                           #== final economic yield of storage organs
  HI     <- YIELD/NOTNUL(TDM)          #FJAV: Defined, Line 271: HI = YIELD/NOTNUL(TDM), but NOT-Used in FST
  POTYLD <- GNO*POTGWT/1000000
  
  #================
  j <- length(cropsv@AGFR) + 1
  
  cropsv@AGFR[j]   <- AGFR
  cropsv@POTYLD[j] <- POTYLD
  cropsv@WGRAIN[j] <- WGRAIN
  cropsv@WSO[j]    <- WSO
  
  #----------------
  return(cropsv)
}
#==================
# cropsv <- fillingrateStorageOrgans8(crop,EDTSsv,GRsv,phenology,cropsv)