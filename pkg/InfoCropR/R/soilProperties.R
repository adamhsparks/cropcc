# soil
soilProperties <- function(control, soilD, srSOIL, soil)
{
  #---------------- control Data
  SOILSW <- control@SOILSW
  TKL3   <- control@TKL3[length(control@TKL3)]
  
  #---------------- soil Data
  PDCF1  <- soil@PDCF1[length(soil@PDCF1)]
  PDCF2  <- soil@PDCF2[length(soil@PDCF2)]
  PDCF3  <- soil@PDCF3[length(soil@PDCF3)]
  
  #---------------- soilD Data
  BDM1   <- soilD@BDM1
  BDM2   <- soilD@BDM2
  BDM3   <- soilD@BDM3
  
  KSATM1 <- soilD@KSATM1
  KSATM3 <- soilD@KSATM3
  
  TKL1   <- soilD@TKL1
  TKL2   <- soilD@TKL2
  
  WCFCM1 <- soilD@WCFCM1
  WCFCM2 <- soilD@WCFCM2
  WCFCM3 <- soilD@WCFCM3
  
  WCSTM1 <- soilD@WCSTM1
  WCSTM2 <- soilD@WCSTM2
  WCSTM3 <- soilD@WCSTM3
  
  WCWPM1 <- soilD@WCWPM1
  WCWPM2 <- soilD@WCWPM2
  WCWPM3 <- soilD@WCWPM3
  
  #---------------- srSOIL Data
  BDC1   <- srSOIL@BDC1[length(srSOIL@BDC1)]
  BDC2   <- srSOIL@BDC2[length(srSOIL@BDC2)]
  BDC3   <- srSOIL@BDC3[length(srSOIL@BDC3)]
  
  KSATC1 <- srSOIL@KSATC1[length(srSOIL@KSATC1)]
  KSATC3 <- srSOIL@KSATC3[length(srSOIL@KSATC3)]
  
  WCFCC1 <- srSOIL@WCFCC1[length(srSOIL@WCFCC1)]
  WCFCC2 <- srSOIL@WCFCC2[length(srSOIL@WCFCC2)]
  WCFCC3 <- srSOIL@WCFCC3[length(srSOIL@WCFCC3)]
  
  WCSTC1 <- srSOIL@WCSTC1[length(srSOIL@WCSTC1)]
  WCSTC2 <- srSOIL@WCSTC2[length(srSOIL@WCSTC2)]
  WCSTC3 <- srSOIL@WCSTC3[length(srSOIL@WCSTC3)]
  
  WCWPC1 <- srSOIL@WCWPC1[length(srSOIL@WCWPC1)]
  WCWPC2 <- srSOIL@WCWPC2[length(srSOIL@WCWPC2)]
  WCWPC3 <- srSOIL@WCWPC3[length(srSOIL@WCWPC3)]
  
  #================
  BD1 <- INSW(SOILSW - 1, BDM1, BDC1) * PDCF1
  BD2 <- INSW(SOILSW - 1, BDM2, BDC2) * PDCF2
  BD3 <- INSW(SOILSW - 1, BDM3, BDC3) * PDCF3
  
  WCFC1 <- INSW(SOILSW - 1, WCFCM1, WCFCC1)
  WCFC2 <- INSW(SOILSW - 1, WCFCM2, WCFCC2)
  WCFC3 <- INSW(SOILSW - 1, WCFCM3, WCFCC3)
  
  WCWP1 <- INSW(SOILSW - 1, WCWPM1, WCWPC1)
  WCWP2 <- INSW(SOILSW - 1, WCWPM2, WCWPC2)
  WCWP3 <- INSW(SOILSW - 1, WCWPM3, WCWPC3)
  
  WCST1 <- INSW(SOILSW - 1, WCSTM1, WCSTC1)
  WCST2 <- INSW(SOILSW - 1, WCSTM2, WCSTC2)
  WCST3 <- INSW(SOILSW - 1, WCSTM3, WCSTC3)
  
  KSAT1 <- INSW(SOILSW - 1, KSATM1, KSATC1) * PDCF1
  KSAT3 <- INSW(SOILSW - 1, KSATM3, KSATC3) * PDCF2
  
  TKLT <- TKL1 + TKL2 + TKL3
  
  #================
  j <- length(soil@BD1) + 1
  
  soil@BD1[j]    <- BD1
  soil@BD2[j]    <- BD2
  soil@BD3[j]    <- BD3
  
  soil@WCFC1[j]    <- WCFC1
  soil@WCFC2[j]    <- WCFC2
  soil@WCFC3[j]    <- WCFC3
  
  soil@WCWP1[j]    <- WCWP1
  soil@WCWP2[j]    <- WCWP2
  soil@WCWP3[j]    <- WCWP3
  
  soil@WCST1[j]    <- WCST1
  soil@WCST2[j]    <- WCST2
  soil@WCST3[j]    <- WCST3
  
  soil@KSAT1[j]    <- KSAT1
  soil@KSAT3[j]    <- KSAT3
  
  soil@TKLT[j]     <- TKLT
  
  #----------------
  return(soil)
}
#-------------------------------------------
# soil <- soilProperties(DINDEXs,control,soilD,srSOIL,soil)