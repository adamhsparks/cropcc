# carbonMine
carbonMineralisation <- function(DINDEXs, carbonInmo, co2Emission, control, EDTSsv,
                                 fertilisation, management, methane, nitrogenEmi, 
                                 root, SNBsv, soilD, stress, tabFunction, carbonMine)
{ 
  #---------------- carbonInmo Data
  CIMMO1 <- carbonInmo@CIMMO1[length(carbonInmo@CIMMO1)]
  CIMMO2 <- carbonInmo@CIMMO2[length(carbonInmo@CIMMO2)]
  CIMMO3 <- carbonInmo@CIMMO3[length(carbonInmo@CIMMO3)]
  
  #---------------- carbonMine Data
  CL1DEC <- carbonMine@CL1DEC[length(carbonMine@CL1DEC)]
  CL2DEC <- carbonMine@CL2DEC[length(carbonMine@CL2DEC)]
  CL3DEC <- carbonMine@CL3DEC[length(carbonMine@CL3DEC)]
  
  LI1DEC <- carbonMine@LI1DEC[length(carbonMine@LI1DEC)]
  LI2DEC <- carbonMine@LI2DEC[length(carbonMine@LI2DEC)]
  LI3DEC <- carbonMine@LI3DEC[length(carbonMine@LI3DEC)]
  
  OM1CAS <- carbonMine@OM1CAS[length(carbonMine@OM1CAS)]
  OM2CAS <- carbonMine@OM2CAS[length(carbonMine@OM2CAS)]
  OM3CAS <- carbonMine@OM3CAS[length(carbonMine@OM3CAS)]  
  
  SOCNT1 <- carbonMine@SOCNT1[length(carbonMine@SOCNT1)]
  SOCNT2 <- carbonMine@SOCNT2[length(carbonMine@SOCNT2)]
  SOCNT3 <- carbonMine@SOCNT3[length(carbonMine@SOCNT3)]
  
  #---------------- co2Emission Data
  CO2L1 <- co2Emission@CO2L1[length(co2Emission@CO2L1)]
  CO2L2 <- co2Emission@CO2L2[length(co2Emission@CO2L2)]
  CO2L3 <- co2Emission@CO2L3[length(co2Emission@CO2L3)]
  
  #---------------- control Data
  SOC1KG <- control@SOC1KG[length(control@SOC1KG)]
  SOC2KG <- control@SOC2KG[length(control@SOC2KG)]
  SOC3KG <- control@SOC3KG[length(control@SOC3KG)]
  
  #---------- EDTSsv Data
  DSTART <- EDTSsv@DSTART[length(EDTSsv@DSTART)]
  
  #---------------- fertilisation Data
  OM1APP <- fertilisation@OM1APP[length(fertilisation@OM1APP)]
  OM2APP <- fertilisation@OM2APP[length(fertilisation@OM2APP)]
  OM3APP <- fertilisation@OM3APP[length(fertilisation@OM3APP)]
  
  #---------------- management Data
  LASTRT <- management@LASTRT[(length(management@LASTRT))]
  
  #---------------- methane Data
  CH4PR1 <- methane@CH4PR1[length(methane@CH4PR1)]
  CH4PR2 <- methane@CH4PR2[length(methane@CH4PR2)]
  CH4PR3 <- methane@CH4PR3[length(methane@CH4PR3)]
  
  #---------------- nitrogenEmi Data
  MBFAC <- nitrogenEmi@MBFAC[length(nitrogenEmi@MBFAC)]
  
  #---------------- root Data
  RTDETH <- root@RTDETH[length(root@RTDETH)]
  RTEXUD <- root@RTEXUD[length(root@RTEXUD)]
 
  #---------------- SNBsv Data
  SOILN1 <- SNBsv@SOILN1[length(SNBsv@SOILN1)]
  
  #---------------- soilD Data
  CARBO1 <- soilD@CARBO1
  CARBO2 <- soilD@CARBO2
  CARBO3 <- soilD@CARBO3
  
  CELLU1 <- soilD@CELLU1
  CELLU2 <- soilD@CELLU2
  CELLU3 <- soilD@CELLU3
  
  DECARB <- soilD@DECARB
  DECELL <- soilD@DECELL
  DELIGN <- soilD@DELIGN
  DESOLC <- soilD@DESOLC
  
  LIGNI1 <- soilD@LIGNI1
  LIGNI2 <- soilD@LIGNI2
  LIGNI3 <- soilD@LIGNI3
  
  SOC1   <- soilD@SOC1
  TKL1   <- soilD@TKL1
  
  #---------------- stress Data
  MFAC  <- stress@MFAC[length(stress@MFAC)]
  PHFAC <- stress@PHFAC[length(stress@PHFAC)]
  TFAC  <- stress@TFAC[length(stress@TFAC)]
  
  #---------------- tabFunction Data
  CNMODF <- tabFunction@CNMODF
  
  #================
  #---------------- *** Dynamics of soil carbon
  LASTCP <- INSW(DSTART - 1, LASTRT, 0)             #== root mass of the previous crop
  MBSOL  <- 25 + 24.1*SOC1*TKL1/150
  
  #----------------
  tmp    <- (1 - exp(-DECARB))*TFAC*MBFAC* AMIN1(MFAC, PHFAC)* AFGEN(CNMODF, SOILN1)
  
  CA1DEC <- AMAX1(0, OM1CAS*tmp)
  CA2DEC <- AMAX1(0, OM2CAS*tmp)
  CA3DEC <- AMAX1(0, OM3CAS*tmp)
  
  CARDEC <- CA1DEC + CA2DEC + CA3DEC             #== net mineralization of C from carbohydrates
  
  #== addition of organic matter in soil
  OM1CRB <- (OM1APP*CARBO1 + (RTDETH + LASTCP)*0.2 + RTEXUD)*0.451 - CA1DEC
  OM2CRB <- (OM2APP*CARBO2                                 )*0.451 - CA2DEC
  OM3CRB <- (OM3APP*CARBO3                                 )*0.451 - CA3DEC
  
  OM1CAS <- OM1CRB                    #Line 763: OM1CAS = INTGRL(ZERO,OM1CRB)
  OM2CAS <- OM2CRB                    #Line 767: OM2CAS = INTGRL(ZERO,OM2CRB)
  OM3CAS <- OM3CRB                    #Line 771: OM3CAS = INTGRL(ZERO,OM3CRB)
  
  OM1CEL <- (OM1APP*CELLU1 + (RTDETH + LASTCP)* 0.7 )*0.50 - CL1DEC
  OM2CEL <- (OM2APP*CELLU2                          )*0.50 - CL2DEC
  OM3CEL <- (OM3APP*CELLU3                          )*0.50 - CL3DEC
  
  #== net organic C fraction in the form of cellulose
  OM1CLS <- OM1CEL
  OM2CLS <- OM2CEL
  OM3CLS <- OM3CEL
  
  CL1DEC <- AMAX1(0, OM1CLS*(1 -exp(-DECELL))*TFAC*MBFAC* AMIN1(MFAC, PHFAC))
  CL2DEC <- AMAX1(0, OM2CLS*(1- exp(-DECELL))*TFAC*MBFAC* AMIN1(MFAC, PHFAC))
  CL3DEC <- AMAX1(0, OM3CLS*(1- exp(-DECELL))*TFAC*MBFAC* AMIN1(MFAC, PHFAC))
  
  CELDEC <- CL1DEC + CL2DEC + CL3DEC             #== net mineralization of C from cellulose
  
  OM1LIG <- (OM1APP*LIGNI1 + (RTDETH + LASTCP)*0.1)*0.691 - LI1DEC
  OM2LIG <- (OM2APP*LIGNI2                        )*0.691 - LI2DEC
  OM3LIG <- (OM3APP*LIGNI3                        )*0.691 - LI3DEC
  
  #== net organic C fraction in the form of lignin
  OM1LIS <- OM1LIG
  OM2LIS <- OM2LIG
  OM3LIS <- OM3LIG
  
  LI1DEC <- AMAX1(0, OM1LIS*(1 - exp(-DELIGN))*TFAC*MBFAC* AMIN1(MFAC, PHFAC))
  LI2DEC <- AMAX1(0, OM2LIS*(1 - exp(-DELIGN))*TFAC*MBFAC* AMIN1(MFAC, PHFAC))
  LI3DEC <- AMAX1(0, OM3LIS*(1 - exp(-DELIGN))*TFAC*MBFAC* AMIN1(MFAC, PHFAC))
  
  LIGDEC <- LI1DEC + LI2DEC + LI3DEC             #== net mineralization of C from lignin
  
  #----------------
  #== native soil carbon mineralization in each soil layer
  SOCDC1 <- SOCNT1*(1 - exp(-DESOLC))*TFAC*MBFAC*AMIN1(MFAC, PHFAC)
  SOCDC2 <- SOCNT2*(1 - exp(-DESOLC))*TFAC*MBFAC*AMIN1(MFAC, PHFAC)
  SOCDC3 <- SOCNT3*(1 - exp(-DESOLC))*TFAC*MBFAC*AMIN1(MFAC, PHFAC)
  
  SOCNT1 <- SOC1KG + (-SOCDC1 + CIMMO1)  #Line 812: SOCNT1 = INTGRL(SOC1KG,SOCBL1)
  SOCNT2 <- SOC2KG + (-SOCDC2 + CIMMO2)  #Line 825: SOCNT2 = INTGRL(SOC2KG,SOCBL2)
  SOCNT3 <- SOC3KG + (-SOCDC3 + CIMMO3)  #Line 829: SOCNT3 = INTGRL(SOC3KG,SOCBL3)
  
  DOC1 <- CARDEC + LIGDEC + CELDEC + SOCDC1 - CIMMO1 - CH4PR1 - CO2L1
  DOC2 <-                            SOCDC2 - CIMMO2 - CH4PR2 - CO2L2
  DOC3 <-                            SOCDC3 - CIMMO3 - CH4PR3 - CO2L3
  
  CDOC1 <- DOC1
  CDOC2 <- DOC2
  CDOC3 <- DOC3
  
  #================
  j <- length(carbonMine@DINDEX) + 1
  carbonMine@DINDEX[j] <- DINDEXs
  
  carbonMine@CA1DEC[j] <- CA1DEC
  carbonMine@CA2DEC[j] <- CA2DEC
  carbonMine@CA3DEC[j] <- CA3DEC
  
  carbonMine@CDOC1[j] <- CDOC1
  carbonMine@CDOC2[j] <- CDOC2
  carbonMine@CDOC3[j] <- CDOC3
  
  carbonMine@CL1DEC[j] <- CL1DEC
  carbonMine@CL2DEC[j] <- CL2DEC
  carbonMine@CL3DEC[j] <- CL3DEC
  
  carbonMine@LI1DEC[j] <- LI1DEC
  carbonMine@LI2DEC[j] <- LI2DEC
  carbonMine@LI3DEC[j] <- LI3DEC
  
  carbonMine@MBSOL[j]  <- MBSOL
  
  carbonMine@OM1CAS[j] <- OM1CAS
  carbonMine@OM2CAS[j] <- OM2CAS
  carbonMine@OM3CAS[j] <- OM3CAS
  
  carbonMine@SOCNT1[j] <- SOCNT1
  carbonMine@SOCNT2[j] <- SOCNT2
  carbonMine@SOCNT3[j] <- SOCNT3
  
  #----------------
  return(carbonMine)
}
#==================
# carbonMine <- carbonMineralisation(DINDEXs,carbonInmo,co2Emission,control,EDTSsv,fertilisation,management,methane,nitrogenEmi,root,SNBsv,soilD,stress,tabFunction,carbonMine)