# GRsv [growthRates] 
#-------------
setClass(Class="GrowthRateStateVarsClass",
         
         representation = representation(
           
          DINDEX = "numeric", 
          
          LSTR   = "numeric",           #== stem reserves
          RWLVG  = "numeric",           #== net growth rate of leaves
          RWRT   = "numeric",           #== net growth rate of stems
          RWSO   = "numeric",           #== net growth rate of storage organs = current dry matter production
          RWST   = "numeric",           #== net growth rate of roots
          TDM    = "numeric",           #== total dry matter of the crop
          WIR    = "numeric",           #== reserves of carbohydrates in stems available for growth
          WLVD   = "numeric",           #== weigths of dead leaves
          WLVG   = "numeric",           #== weigths of green leaves
          WRT    = "numeric",           #== weigths of roots
          WST    = "numeric",           #== weigths of stem
          WSTD   = "numeric",
          WSTEM  = "numeric"

         ),
         
         prototype = prototype(
           
          DINDEX = 10957,
          
          LSTR   = 0,
          RWLVG  = 0,
          RWRT   = 0,   
          RWSO   = 0, 
          RWST   = 0,
          TDM    = 0,
          WIR    = 0,
          WLVD   = 0,
          WLVG   = 0,
          WRT    = 0,
          WST    = 0,
          WSTD   = 0,
          WSTEM  = 0

         ),
         
         validity = function(object)
         {
           return(TRUE)
         }
         
)