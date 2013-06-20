# cropsv
setClass(Class="CropStateVarsClass",
         
         representation = representation(
           
          DINDEX = "numeric", 
          LAI    = "numeric",
          EVSW1  = "numeric",
          EVSW2  = "numeric",
          EVSW3  = "numeric",
          TRRM   = "numeric",
          TRWL1  = "numeric",
          TRWL2  = "numeric",
          TRWL3  = "numeric",
          WEEDCV = "numeric",
          WSE1   = "numeric",
          WSE2   = "numeric",
          WSE3   = "numeric",
          ZRT1   = "numeric",
          ZRT2   = "numeric",
          ZRT3   = "numeric",
          EZRT   = "numeric",
          
          #STRESS
          FLDLOS = "numeric"

         ),
         
         prototype = prototype(
           
          DINDEX = 10957,
          LAI    = 0,         
          EVSW1  = 0,
          EVSW2  = 0,
          EVSW3  = 0,
          TRRM   = 0,
          TRWL1  = 0, #Line 352: TRWL1 <- TRRM*WSE1*ZRT1*AFGEN(EDPTFT, AWF1)
          TRWL2  = 0, #Line 353: TRWL2 <- TRRM*WSE2*ZRT2*AFGEN(EDPTFT, AWF2)
          TRWL3  = 0, #Line 354: TRWL3 <- TRRM*WSE3*ZRT3*AFGEN(EDPTFT, AWF3)
          WEEDCV = 0,  
          WSE1   = 0,
          WSE2   = 0,
          WSE3   = 0,
          ZRT1   = 0,
          ZRT2   = 0,
          ZRT3   = 0,
          EZRT   = 0,
          
          #STRESS
          FLDLOS = 0

         ),
         
         validity = function(object)
         {
           return(TRUE)
         }
         
)