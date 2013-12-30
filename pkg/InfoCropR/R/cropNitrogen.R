# CNsv
cropNitrogen <- function(carbonInmo, control, crop, cropsv, GRsv,
                         management, phenology, SNBsv, soil, soilD, srDELAY,
                         stress, SWBsv, tabFunction, CNsv)
{
  #---------------- carbonInmo Data
  CIMMO1 <- carbonInmo@CIMMO1[length(carbonInmo@CIMMO1)]
  CIMMO2 <- carbonInmo@CIMMO2[length(carbonInmo@CIMMO2)]
  CIMMO3 <- carbonInmo@CIMMO3[length(carbonInmo@CIMMO3)]
  
  #---------- CNsv Data
  ANCRGR <- CNsv@ANCRGR[length(CNsv@ANCRGR)]
  ANLD   <- CNsv@ANLD[length(CNsv@ANLD)]
  ANSD   <- CNsv@ANSD[length(CNsv@ANSD)]
  ANLV   <- CNsv@ANLV[length(CNsv@ANLV)]
  ANRT   <- CNsv@ANRT[length(CNsv@ANRT)]
  ANSO   <- CNsv@ANSO[length(CNsv@ANSO)]
  ANST   <- CNsv@ANST[length(CNsv@ANST)]
  
  #---------- control Data
  NLVI   <- control@NLVI[length(control@NLVI)]
  NRTI   <- control@NRTI[length(control@NRTI)]
  SWXNIT <- control@SWXNIT[length(control@SWXNIT)]
  TKL3   <- control@TKL3[length(control@TKL3)]
  
  #---------- crop Data
  CRPNFX <- crop@CRPNFX
  GREENF <- crop@GREENF
  LEGUME <- crop@LEGUME
  MAXNUP <- crop@MAXNUP
  NHRICE <- crop@NHRICE
  NMAXGR <- crop@NMAXGR
  NUPTDS <- crop@NUPTDS
  RFNLV  <- crop@RFNLV
  RFNRT  <- crop@RFNRT
  RFNST  <- crop@RFNST
  VARNFX <- crop@VARNFX
  
  #---------- cropsv Data 
  AGFR   <- cropsv@AGFR[length(cropsv@AGFR)]
  ATRANS <- cropsv@ATRANS[length(cropsv@ATRANS)]
  DLV    <- cropsv@DLV[length(cropsv@DLV)]
  DMGSTR <- cropsv@DMGSTR[length(cropsv@DMGSTR)]
  DST    <- cropsv@DST[length(cropsv@DST)]
  LRFEED <- cropsv@LRFEED[length(cropsv@LRFEED)]
  PLTR   <- cropsv@PLTR[length(cropsv@PLTR)]
  POTYLD <- cropsv@POTYLD[length(cropsv@POTYLD)]
  SUKNLV <- cropsv@SUKNLV[length(cropsv@SUKNLV)]
  SUKNSO <- cropsv@SUKNSO[length(cropsv@SUKNSO)] 
  SUKNST <- cropsv@SUKNST[length(cropsv@SUKNST)]
  TRWL1  <- cropsv@TRWL1[length(cropsv@TRWL1)]
  TRWL2  <- cropsv@TRWL2[length(cropsv@TRWL2)]
  TRWL3  <- cropsv@TRWL3[length(cropsv@TRWL3)]
  WSO    <- cropsv@WSO[length(cropsv@WSO)]  
  
  #---------- GRsv Data
  RWLVG <- GRsv@RWLVG[length(GRsv@RWLVG)]
  RWRT  <- GRsv@RWRT[length(GRsv@RWRT)]
  RWST  <- GRsv@RWST[length(GRsv@RWST)]
  WLVG  <- GRsv@WLVG[length(GRsv@WLVG)]
  WRT   <- GRsv@WRT[length(GRsv@WRT)]
  WST   <- GRsv@WST[length(GRsv@WST)]
  WSTEM <- GRsv@WSTEM[length(GRsv@WSTEM)]
  
  #---------- management Data
  CNBACT <- management@CNBACT[length(management@CNBACT)]
  ESW    <- management@ESW[length(management@ESW)]
  
  #---------- phenology Data
  DS     <- phenology@DS[length(phenology@DS)]
  GNLOSS <- phenology@GNLOSS[length(phenology@GNLOSS)]
  GNO    <- phenology@GNO[length(phenology@GNO)]
  
  #---------- SNBsv Data
  NH41 <- SNBsv@NH41[length(SNBsv@NH41)]
  NH42 <- SNBsv@NH42[length(SNBsv@NH42)]
  NH43 <- SNBsv@NH43[length(SNBsv@NH43)]
  
  NO31 <- SNBsv@NO31[length(SNBsv@NO31)]
  NO32 <- SNBsv@NO32[length(SNBsv@NO32)]
  NO33 <- SNBsv@NO33[length(SNBsv@NO33)]
  
  #---------- soil Data
  TKLT <- soil@TKLT[length(soil@TKLT)]
  
  #---------- soilD Data
  TKL1  <- soilD@TKL1
  TKL2  <- soilD@TKL2
  
  #---------- srDELAY Data
  NLEAFP <- srDELAY@NLEAFP[length(srDELAY@NLEAFP)]
  
  #---------- stress Data
  TFAC  <- stress@TFAC[length(stress@TFAC)]
  
  #---------- SWBsv Data
  AWF1   <- SWBsv@AWF1[length(SWBsv@AWF1)]
  
  #---------- tabFunction Data
  NFXWAT <- tabFunction@NFXWAT
  NMAXLT <- tabFunction@NMAXLT
  
  #================
  #***    Crop nitrogen demand
  NDEMLV <- AMAX1(0, AFGEN(NMAXLT, DS)*GREENF*    (WLVG  + RWLVG) - ANLV)  #== leaves N-demand
  NDEMST <- AMAX1(0, AFGEN(NMAXLT, DS)*GREENF*0.5*(WSTEM + RWST)  - ANST)  #== stem N-demand
  NDEMRT <- AMAX1(0, AFGEN(NMAXLT, DS)*GREENF*0.5*(WRT   + RWRT)  - ANRT)  #== root N-demand
  
  NDEMSO <- AMAX1(0, (WSO + AGFR)*NMAXGR - ANSO)                   #== storage organ N-demand
  NDEMCP <- NDEMLV + NDEMST + NDEMRT                               #== crop N demand
  
  ANCRPT <- WLVG* AFGEN(NMAXLT, DS)*GREENF +
            WST*  AFGEN(NMAXLT, DS)*GREENF*0.5 + WSO*NMAXGR
  
  #***  N Fixation
  NFIX <- INSW(LEGUME - 0.5, 0, INSW(DS - 0.35, 0, AMAX1(0, (ANCRPT - ANCRGR))*
               CRPNFX*VARNFX* AFGEN(NFXWAT, AWF1)*TFAC)* LIMIT(0, 1, 1 - WSO/ NOTNUL(POTYLD)))
  
  #*** Immobilisation of nitrogen
  NIMMO1 <- CIMMO1*CNBACT
  NIMMO2 <- CIMMO2*CNBACT
  NIMMO3 <- CIMMO3*CNBACT              #FJAV: (?)Mistake in FST (Line 699: NIMMO3 = CIMMO2*CNBACT)
  
  NIMMOT <- NIMMO1 + NIMMO2 + NIMMO3
  
  #*** N uptake by the crop
  NUPTK1 <- INSW(DS - NUPTDS, AMIN1(MAXNUP*TKL1/TKLT, NDEMCP*TRWL1/(ATRANS + 1.E-10), NO31 + NH41*NHRICE), 0)
  NUPTK2 <- INSW(DS - NUPTDS, AMIN1(MAXNUP*TKL2/TKLT, NDEMCP*TRWL2/(ATRANS + 1.E-10), NO32 + NH42*NHRICE), 0)
  NUPTK3 <- INSW(DS - NUPTDS, AMIN1(MAXNUP*TKL3/TKLT, NDEMCP*TRWL3/(ATRANS + 1.E-10), NO33 + NH43*NHRICE), 0)
  
  NUPTKT <- NUPTK1 + NUPTK2 + NUPTK3 + NFIX      #== net N-uptake
  
  NUPTKS <- NUPTKT                     #FJAV: Defined, Line 684: NUPTKS = INTGRL(ZERO,NUPTKT), but NOT USED IN FST
  
  #***  Nitrogen allocation rates to the plant organs
  NALV <- INSW(SWXNIT - 1, AMAX1(0, AMIN1(NDEMLV, NUPTKT*(NDEMLV/ NOTNUL(NDEMCP)))), NDEMLV)  #== leaves N-uptake
  NAST <- INSW(SWXNIT - 1, AMAX1(0, AMIN1(NDEMST, NUPTKT*(NDEMST/ NOTNUL(NDEMCP)))), NDEMST)  #== stem N-uptake
  NART <- INSW(SWXNIT - 1, AMAX1(0, AMIN1(NDEMRT, NUPTKT*(NDEMRT/ NOTNUL(NDEMCP)))), NDEMRT)  #== root N-uptake
  
  NDLV <- DLV * RFNLV - AMIN1(ANLD, ANLD*(1 - PLTR))   #== leaves N-loss due to senescence
  NDST <- DST * RFNST - AMIN1(ANSD, ANSD*(1 - PLTR))   #== stem N-loss due to senescence
  
  #** Potential availability of N translocation from organs, in kg/ha/d
  ATNLV <- AMAX1(0, INSW(WSO - 1, 0, ANLV + NALV - WLVG *RFNLV))  #== leaves
  ATNST <- AMAX1(0, INSW(WSO - 1, 0, ANST + NAST - WSTEM*RFNST))  #== stem
  ATNRT <- AMAX1(0, INSW(WSO - 1, 0, ANRT + NART - WRT  *RFNRT))  #== root
  
  ATN <- ATNLV + ATNST + ATNRT                                    #== total
  
  #* Nitrogen in the crop
  NSO <- AMIN1(NDEMSO, ATN) - AMIN1(ANSO, SUKNSO + ANSO*GNLOSS/ NOTNUL(GNO))           #== storage organs rate of change in N-content
  
  #** Actual N supply rates by plant organs, in kg/ha/d
  NTLV <- LIMIT(0, ANLV, NSO*ATNLV/ NOTNUL(ATN))  #== N actually transfered to leaves
  NTST <- LIMIT(0, ANST, NSO*ATNST/ NOTNUL(ATN))  #== N actually transfered to stem
  NTRT <- LIMIT(0, ANRT, NSO*ATNRT/ NOTNUL(ATN))  #== N actually transfered to root
  
  NMOBIL <- INSW(WSO - 100, 0, AMAX1(0, (NLEAFP - ANLV)/(ANLV + 1.e-10)))
  
  #* Nitrogen in the crop
  NLV <- NLVI*ESW + NALV -AMIN1(ANLV, NTLV + NDLV + ANLV*(1 - PLTR) + ANLV*LRFEED + SUKNLV + DMGSTR*ANLV)     #== rate of available N in leaves
  NST <- NAST - AMIN1(ANST, NTST + NDST + ANST*(1 - PLTR) + SUKNST + DMGSTR*ANST)                             #== stem rate of change in N-content
  NRT <- NRTI*ESW + NART - AMIN1(ANRT, NTRT + ANRT*(1 - PLTR))
  
  ANRT <- NRT                          #Line 293: ANRT = INTGRL(ZERO,NRT)
  ANST <- NST                          #Line 294: ANST = INTGRL(ZERO,NST)
  ANSD <- NDST                         #Line 295: ANSD = INTGRL(ZERO,NDST)
  ANLV <- NLV                          #Line 296: ANLV = INTGRL(ZERO,NLV)
  ANSO <- NSO                          #Line 297: ANSO = INTGRL(ZERO,NSO)
  ANLD <- NDLV                         #Line 298: ANLD = INTGRL(ZERO,NDLV)
  
  ANCR <- ANSO + ANLV + ANLD + ANST + ANSD #FJAV: Defined, Line 299: ANCR = ANSO+ANLV+ANLD+ANST+ANSD, but NOT used in FST
  
  ANCRGR <- ANSO + ANLV + ANST
  
  #================
  j <- length(CNsv@ANCRGR) + 1
  
  CNsv@ANCRGR[j] <- ANCRGR
  CNsv@ANLD[j] <- ANLD
  CNsv@ANLV[j] <- ANLV
  CNsv@ANRT[j] <- ANRT
  CNsv@ANSD[j] <- ANSD
  CNsv@ANSO[j] <- ANSO
  CNsv@ANST[j] <- ANST
  CNsv@ANCRPT[j] <- ANCRPT
  
  CNsv@NIMMO1[j] <- NIMMO1
  CNsv@NIMMO2[j] <- NIMMO2
  CNsv@NIMMO3[j] <- NIMMO3
  CNsv@NIMMOT[j] <- NIMMOT
  
  CNsv@NMOBIL[j] <- NMOBIL
  CNsv@NFIX[j]   <- NFIX
  
  CNsv@NUPTK1[j] <- NUPTK1
  CNsv@NUPTK2[j] <- NUPTK2
  CNsv@NUPTK3[j] <- NUPTK3
  
  #----------------
  return(CNsv)
}