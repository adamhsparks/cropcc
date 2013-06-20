# SOWING DATE DEPENDENT UPON MOISTURE IN LAYER 1 OR UPON FIXED DATE
# SWSWCH IS 1 FOR FIXED SOWING DATE, &IS 0 FOR SOIL MOISTURE DEPENDENCE

sowingDate <- function(i, Management, SoilWater, Soil)
{
  
  #Fetch inputs
  SWSWCH <- Management@SWSWCH
  SOWFXD <- Management@SOWFXD
  
  if(SWSWCH) {SOW6 <- ifelse(SOWFXD < i, 0, 1)}
  else
  {
        
    #Fetch more inputs
    WCL1 <- SoilWater@WCL1 #TODO make object SoilWaterBalance, etc.
    WCFC1 <- Soil@WCFC1 #add this to Soil (addSoilProperties.R)
    
    #calculate
    WCLSOW <- 0.85 * WCFC1
    SOW0   <- ifelse(WCL1-WCLSOW < 0, 1, 0) #check if not the other way around
    SOW1   <- SOW1 + SOW0
    SOW5   <- ifelse(SOW1 < 0, 1, 0) #check also
    SOW6   <- SOW5
  }
  
  return(SOW6)
  
}

  

  
#   #**** ADDITION FOR RAINFALL DEPENDENT TRANSPLANTING DATE
#   
#   DLYTRP  = INSW(RAINSW-1.,0.,INSW(DAS-SEEDAG,0.,INSW(WCL1-WCLTRP,0.,1.)))
#   DLYRAN  = INTGRL(ZERO,  DLYTRP)
#   XT      = INSW(RAINSW-1.,0.,INSW(DLYRAN-1.,1.,0.))
#   XT1   = INTGRL(XTIN, XT)
#   INCON XTIN=1.
#   NEWAGE  = INSW(RAINSW-1.,SEEDAG,INSW(DAS-SEEDAG,0.,XT1))
#   *RAINSW  = INSW(IRSWCH-1.,1.,0.)
#   PARAM RAINSW =0.
#   WCLTRP  = WCFC1*0.85
  