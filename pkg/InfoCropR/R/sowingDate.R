#management
sowingDate <- function(DINDEXs, soil, SWBsv, management)
{
  #------------------ management data
  SOWFXD <- management@STTIME #JvE: This statement was a bit lost among the germination code, but should be here. Start time, however, should not be part of management, but of "control" (timer)
  SWSWCH <- management@SWSWCH
  
  #------------------ soil data
  WCFC1 <- soil@WCFC1[length(soil@WCFC1)]
  
  #------------------ SWBsv data
  WCL1 <- SWBsv@WCL1[length(SWBsv@WCL1)]
  
  #================
  WCLSOW <- 0.85*WCFC1
  SOW0   <- INSW(WCL1 - WCLSOW, 0, 1)
  SOW1   <- SOW0                       #Line 100: SOW1 = INTGRL(ZERO, SOW0)
  SOW5   <- INSW(SOW1 - 1, 0, 1)
  
  #----------------------------------------------
  TIME   <- DINDEXs #---------------- FJAV: ???????????
  #----------------------------------------------
  
  SOW6   <- INSW(SWSWCH - 1, SOW5, INSW(SOWFXD - TIME - 1, 1, 0))
  DAS    <- SOW6                       #Line 103: DAS = INTGRL(ZERO, SOW6)
  
  #================
  j <- length(management@DINDEX) + 1
  management@DINDEX[j] <- DINDEXs
  
  management@SOW6[j]   <- SOW6
  management@DAS[j]    <- DAS
  management@WCLSOW[j] <- WCLSOW
  
  #----------------
  return(management)
}
#==================
# management <- sowingDate(DINDEXs,soil,SWBsv,management)