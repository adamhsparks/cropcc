# SOWING DATE DEPENDENT UPON MOISTURE IN LAYER 1 OR UPON FIXED DATE
# SWSWCH IS 1 FOR FIXED SOWING DATE, &IS 0 FOR SOIL MOISTURE DEPENDENCE

sowingDate <- function(Management, Weather)
{
  
  #Fetch inputs
  if(Management@SWSWCH){return(1)} 
  else
  {
    #get inputs
    
    WCL1
    WCLSOW
    
    #calculate
    
    SOW0   = INSW (WCL1-WCLSOW,0.,1.)
    SOW1   = INTGRL(ZERO, SOW0)
    SOW5   = INSW(SOW1-1.,0.,1.)
    SOW6   = INSW(SWSWCH-1.,SOW5, INSW(SOWFXD-TIME-1.,1.,0.))
    DAS    = INTGRL (ZERO, SOW6)
    WCLSOW =.85*WCFC1
    PARAM SWSWCH  =  1.
    
  }

  

  
  #**** ADDITION FOR RAINFALL DEPENDENT TRANSPLANTING DATE
  
  DLYTRP  = INSW(RAINSW-1.,0.,INSW(DAS-SEEDAG,0.,INSW(WCL1-WCLTRP,0.,1.)))
  DLYRAN  = INTGRL(ZERO,  DLYTRP)
  XT      = INSW(RAINSW-1.,0.,INSW(DLYRAN-1.,1.,0.))
  XT1   = INTGRL(XTIN, XT)
  INCON XTIN=1.
  NEWAGE  = INSW(RAINSW-1.,SEEDAG,INSW(DAS-SEEDAG,0.,XT1))
  *RAINSW  = INSW(IRSWCH-1.,1.,0.)
  PARAM RAINSW =0.
  WCLTRP  = WCFC1*0.85
  
  
  
}