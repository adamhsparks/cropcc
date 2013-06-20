.addSP <- function(SAND)
{
  
  #This is the SOIL subroutine
  BDC <- (1.1 + 0.0045 *SAND)
  WCSTC <- 1 - (BDC/2.65)
  WCFCC <- (0.01875 + 0.00411 * (100-SAND)) * BDC
  WCWPC <- (-0.001185  + 0.00218 * (100-SAND)) * BDC
  WCAD <- max(0.04, -0.0178 + WCWPC* 0.6556)
  KSATC <- SAND * 3
  return(list(BDC, WCSTC, WCFCC, WCWPC, WCAD, KSATC))
}


addSoilProperties <- function(Soil)
{
  
  PDCF1 <- Soil@PDCF1
  PDCF2 <- Soil@PDCF2
  PDCF3 <- Soil@PDCF3
  
  if(!SOILSW)
  {
    
    BD1 <- Soil@BDM1 * PDCF1
    BD2 <- Soil@BDM2 * PDCF2
    BD3 <- Soil@BDM3 * PDCF3
    
    WCFC1 <- Soil@WCFCM1
    WCFC2 <- Soil@WCFCM2
    WCFC3 <- Soil@WCFCM3
    
    WCWP1 <- Soil@WCWPM1
    WCWP2 <- Soil@WCWPM2
    WCWP3 <- Soil@WCWPM3
    
    WCST1 <- Soil@WCSTM1
    WCST2 <- Soil@WCSTM2
    WCST3 <- Soil@WCSTM3
    
    KSAT1 <- Soil@KSATM1 * PDCF1
    KSAT2 <- Soil@KSATM2 * PDCF2 #lacking in source code
    KSAT3 <- Soil@KSATM3 * PDCF3 # * PDCF2 in source code
  }
  
  if(SOILSW)
  {
    results1 <- .addSP(Soil@SAND1)
    BD1 <- results1$BDC * PDCF1
    WCST1 <- results1$WCSTC
    WCFC1 <- results1$WCFCC
    WCWP1 <- results1$WCWPC
    #WCAD1 <- results1$WCAD #not sure about this one...
    KSAT1 <- results1$KSATC * PDCF1
    
    results2 <- .addSP(Soil@SAND2)
    BD2 <- results2$BDC * PDCF2
    WCST2 <- results2$WCSTC
    WCFC2 <- results2$WCFCC
    WCWP2 <- results2$WCWPC
    #WCAD2 <- results2$WCAD
    KSAT2 <- results2$KSATC * PDCF2 #lacking in source code
    
    results3 <- .addSP(Soil@SAND3)
    BD3 <- results3$BDC * PDCF3
    WCST3 <- results3$WCSTC
    WCFC3 <- results3$WCFCC
    WCWP3 <- results3$WCWPC
    #WCAD3 <- results3$WCAD
    KSAT3 <- results3$KSATC * PDCF3 # * PDCF2 in source code
  }

  TKLT <- Soil@TKL1 + Soil@TKL2 + Soil@TKL3
  
  #now stick back in Soil object, changing class definition adding these
  #or is puddling making this a dynamic thing?

}