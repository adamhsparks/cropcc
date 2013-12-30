# phenology
phenologicalDevelopment <- function(control, crop, cropsv,
                                    EDTSsv, management, srSUBDD,
                                    srSUBPET, stress,
                                    tabFunction, phenology)
{
#---------- control Data
  DSI <- control@DSI
  
#---------- crop Data
  DAYSEN <- crop@DAYSEN
  DLSTG1 <- crop@DLSTG1
  DLSTG2 <- crop@DLSTG2
  MUSTRD <- crop@MUSTRD
  POTATO <- crop@POTATO
  TGBD   <- crop@TGBD
  TGMBD  <- crop@TGMBD
  TTGF   <- crop@TTGF
  TPOPT  <- crop@TPOPT
  TTVG   <- crop@TTVG
  
#---------- cropsv Data  
  TPSHOK <- cropsv@TPSHOK[length(cropsv@TPSHOK)]
  
#---------- EDTSsv Data  
  TMIN   <- EDTSsv@TMIN[length(EDTSsv@TMIN)]
  TPAV   <- EDTSsv@TPAV[length(EDTSsv@TPAV)]
  TTGM   <- EDTSsv@TTGM[length(EDTSsv@TTGM)]

#---------- management Data
  DAS    <- management@DAS[length(management@DAS)]
  SOW6   <- management@SOW6[length(management@SOW6)]

#---------- phenology Data
#   ANTHD <- phenology@ANTHD[length(phenology@ANTHD)]
  DS    <- phenology@DS[length(phenology@DS)]

#---------- srSUBDD Data
  HU  <- srSUBDD@HU[length(srSUBDD@HU)]
  
#---------- srSUBPET Data  
  DAYLP  <- srSUBPET@DAYLP[length(srSUBPET@DAYLP)]
  
#---------- stress Data
  NSTRES <- stress@NSTRES[length(stress@NSTRES)]
  WSTRES <- stress@WSTRES[length(stress@WSTRES)]
  
#---------- tabFunction Data
  DAYCF  <- tabFunction@DAYCF
  DRWT   <- tabFunction@DRWT
  NDRWT  <- tabFunction@NDRWT
  
#==================
  DAYLC  <- INSW((DS - DLSTG1)*(DLSTG2 - DS), 1, AFGEN(DAYCF, DAYLP)*DAYSEN) #== correction factor for the photoperiod -dependent thermal time-
  MAXSTD <- AMAX1(AFGEN(DRWT, WSTRES), AFGEN(NDRWT, NSTRES))
  MSTARD <- INSW(MUSTRD -1.,0.,25.)
  TRECIP <- AMIN1(1, 1 / INSW(TMIN - 10, NOTNUL(TMIN), 10000))
  HUVG   <- AMAX1(0, HU + INSW(POTATO - 1, 0, INSW(DS - .85,
                   INSW(TMIN - 15, HU*0.5, 0), 0)) + MSTARD*TRECIP)
  DRV    <- TPSHOK*HUVG*DAYLC*MAXSTD / TTVG   #== rate of change in DS during seedling emergence to anthesis
  DRR    <- AMAX1(0, AMIN1(TPOPT, TPAV) - TGBD)*MAXSTD / TTGF #== rate of change in DS during storage organ filling phase
  RDSA   <- (TPAV - TGMBD)*SOW6*.1 / TTGM
  RDSB   <- INSW(DS - 1, DRV, DRR)
  RDS    <- INSW(DS - 0.1, RDSA, RDSB) #== rate of change in DS
  DS     <- DSI + RDS                  #Line 147: DS = INTGRL(DSI,RDS)
                                       #FJAV: or DS[1] <- DSI; DS <- DS + RDS
  #---------------------------------------------------------------------------------------------
  DS     <- INSW(DS, -DS, DS)          #FJAV: DS can not be negative, is defined from 0, then...
  #---------------------------------------------------------------------------------------------
  
  #----------------
#   ANTHDmod <- function(Time, State, Pars){
#     with(as.list(State), {
#       dANTHD <- INSW(DS - 1, SOW6, 0)
#       return(list(c(dANTHD)))
#     })
#     }
#   yini  <- c(ANTHD=ANTHD)
#   times <- seq(0,1,1)
#   out   <- ode(yini, times, ANTHDmod, parms=NULL)
#   ANTHD <- out[2,2]
  #----------------
  ANTHD <- INSW(DS - 1, SOW6, 0) #Line 159: ANTHD = INTGRL(ZERO,DAYSF)
                                 #Line 160: DAYSF = INSW(DS-1.,SOW6,0.)
  
  #----------------
  GFD <- AMAX1(0, DAS - ANTHD)
  
  #================
  j <- length(phenology@ANTHD) + 1
  
  phenology@ANTHD[j]  <- ANTHD
  phenology@DS[j]     <- DS
  phenology@GFD[j]    <- GFD
  phenology@HUVG[j]   <- HUVG
  phenology@RDSA[j]   <- RDSA

  #----------------
  return(phenology)
}