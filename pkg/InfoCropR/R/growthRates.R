# GRsv
growthRates <- function(control, crop, cropsv, management,
                        phenology, root, stress, tabFunction, GRsv)
  {
  
  #---------- control Data
  #FWCANE <- control@FWCANE
  WLVI   <- control@WLVI[length(control@WLVI)]
  WRTI   <- control@WRTI[length(control@WRTI)]
  WSTI   <- control@WSTI
  
  #---------- crop Data
  ENERGY <- crop@ENERGY  
  
  #---------- cropsv Data
  AGFR   <- cropsv@AGFR[length(cropsv@AGFR)]
  DLV    <- cropsv@DLV[length(cropsv@DLV)]
  DST    <- cropsv@DST[length(cropsv@DST)]  
  GCROP  <- cropsv@GCROP[length(cropsv@GCROP)]
  PLTR   <- cropsv@PLTR[length(cropsv@PLTR)]
  SUCKLV <- cropsv@SUCKLV[length(cropsv@SUCKLV)]
  SUCKSO <- cropsv@SUCKSO[length(cropsv@SUCKSO)]
  SUCKST <- cropsv@SUCKST[length(cropsv@SUCKST)]
  WSO    <- cropsv@WSO[length(cropsv@WSO)]
  
  #---------- GRsv Data
  LSTR  <- GRsv@LSTR[length(GRsv@LSTR)]
  RWLVG <- GRsv@RWLVG[length(GRsv@RWLVG)]
  RWRT  <- GRsv@RWRT[length(GRsv@RWRT)]
  RWSO  <- GRsv@RWSO[length(GRsv@RWSO)]
  RWST  <- GRsv@RWST[length(GRsv@RWST)]
  WIR   <- GRsv@WIR[length(GRsv@WIR)]
  WLVG  <- GRsv@WLVG[length(GRsv@WLVG)]
  WLVD  <- GRsv@WLVD[length(GRsv@WLVD)]
  WRT   <- GRsv@WRT[length(GRsv@WRT)]
  WST   <- GRsv@WST[length(GRsv@WST)]
  WSTD  <- GRsv@WSTD[length(GRsv@WSTD)]
  
  #---------- management Data
  ESW <- management@ESW[length(management@ESW)]
  
  #---------- phenology Data
  DS <- phenology@DS[length(phenology@DS)]
  
  #---------- root Data  
  RTDETH <- root@RTDETH[length(root@RTDETH)]
  
  #---------- stress Data
  NSTRES <- stress@NSTRES[length(stress@NSTRES)]
  WSTRES <- stress@WSTRES[length(stress@WSTRES)]
  
  #---------- tabFunction Data
  FLVTB <- tabFunction@FLVTB
  FRTTB <- tabFunction@FRTTB
  FSTRT <- tabFunction@FSTRT
  FSTTB <- tabFunction@FSTTB
  LLVN  <- tabFunction@LLVN
  LLVST <- tabFunction@LLVST
  
  #================
  CFPART <- AMAX1(AFGEN(LLVN, NSTRES), AFGEN(LLVST, WSTRES)) #stress incerase in root allocation
  FRT    <- AFGEN(FRTTB, DS)*CFPART                          #dry matter allocated first to roots
  FSH    <- 1 - FRT                                          #allocation of dry matter to ground shoot
  FLV    <- AFGEN(FLVTB, DS)                                 #allocation of dry matter to leaves
  FST    <- AFGEN(FSTTB, DS)                                 #allocation of dry matter to stems
  FSO    <- 1 - (FLV + FST)                                  #allocation of dry matter to storage organs
  
  #----------------
  GrowthRmod <- function(Time, State, Pars) {
    with(as.list(State), {
      dWLVG <- WLVI*ESW + RWLVG                     #______ODE No. 1
      dWLVD <- DLV                                  #______ODE No. 2
      dWST  <- WSTI*ESW + RWST                      #______ODE No. 3
      dWSTD <- DST                                  #______ODE No. 4
      dWRT  <- WRTI*ESW + RWRT - RTDETH             #______ODE No. 5
      dWIR  <- GCROP*FSH*FST*AFGEN(FSTRT, DS) + 
        AMAX1(0, RWSO - AGFR) - 
        AMIN1(WIR, LSTR + SUCKST + WIR*(1 - PLTR))  #______ODE No. 6
      
      WLEAF <- WLVG + WLVD
      WSTEM <- (WST + WIR) #*FWCANE
      TDM   <- WLEAF + WSTEM + WSTD + WSO / ENERGY
      RWLVG <- GCROP*FSH*FLV - AMIN1(WLVG, DLV + SUCKLV + WLVG*(1 - PLTR))  
      RWST  <- GCROP*FSH*FST*(1 - AFGEN(FSTRT, DS)) - 
                    AMIN1(WST, DST + WST*(1 - PLTR))
      RWSO  <- AMAX1(0, GCROP*FSH*FSO) - AMIN1(WSO, SUCKSO)
      RWRT  <- GCROP*FRT - AMIN1(WRT, WRT*(1 - PLTR))
      LSTR  <- INSW(DS - 1, 0, WIR*0.1)      
      
      return(list(c(dWLVG, dWLVD, dWST, dWSTD, dWRT, dWIR), 
                       TDM, RWLVG, RWST, RWSO, RWRT, LSTR, WSTEM))  #______Number of derivatives returned: 6
    })
  }
  yini  <- c(WLVG=WLVG, WLVD=WLVD, WST=WST, WSTD=WSTD, WRT=WRT, WIR=WIR) #______Number of initial conditions: 6
  times <- seq(0,1,1)
  out   <- ode(yini, times, GrowthRmod, parms=NULL)
  
  #----------------
  WLVG  <- out[2,2]
  WLVD  <- out[2,3]
  WST   <- out[2,4]
  WSTD  <- out[2,5]
  WRT   <- out[2,6]
  WIR   <- out[2,7]
  TDM   <- out[2,8]
  RWLVG <- out[2,9]
  RWST  <- out[2,10]
  RWSO  <- out[2,11]
  RWRT  <- out[2,12]
  LSTR  <- out[2,13]
  WSTEM <- out[2,14]
  
  #================
  j <- length(GRsv@LSTR) + 1
  
  GRsv@LSTR[j]   <- LSTR
  GRsv@RWLVG[j]  <- RWLVG
  GRsv@RWRT[j]   <- RWRT
  GRsv@RWSO[j]   <- RWSO
  GRsv@RWST[j]   <- RWST
  GRsv@TDM[j]    <- TDM
  GRsv@WIR[j]    <- WIR
  GRsv@WLVD[j]   <- WLVD
  GRsv@WLVG[j]   <- WLVG
  GRsv@WRT[j]    <- WRT
  GRsv@WST[j]    <- WST
  GRsv@WSTD[j]   <- WSTD
  GRsv@WSTEM[j]  <- WSTEM
  
  #----------------
  return(GRsv)
}