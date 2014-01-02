initCrop <- function(crop, management, tabFunction, pestD, phenology)
{
  
  SEEDRT <- management@SEEDRT
  FCSDEP <- tabFunction@FCSDEP
  SOWDEP <- management@SOWDEP
  FRLVWT <- crop@FRLVWT
  SLAVAR <- crop@SLAVAR
  SLACF <- tabFunction@SLACF
  RGMPST <- pestD@RGMPST
  DSI <- phenology@DS[1]
  NMAXLT <- tabFunction@NMAXLT
  GREENF <- crop@GREENF
  
  WLVI <- SEEDRT * AFGEN(FCSDEP, SOWDEP) * FRLVWT * RGMPST
  WRTI <- SEEDRT - WLVI
  
  LAII <- WLVI * SLAVAR *AFGEN(SLACF, DSI) 
  
  NRTI <- WRTI * AFGEN(NMAXLT, DSI) * GREENF * 0.5
  NLVI <- WLVI * AFGEN(NMAXLT, DSI) * GREENF
  
  crop@WLVI <- WLVI    
  crop@WRTI <- WRTI 
  crop@LAII <- LAII
  crop@NRTI <- NRTI
  crop@NLVI <- NLVI
  
  return(crop)  
    
}