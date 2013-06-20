# SWBsv
setClass(Class="SWBStateVarsClass",
         
         representation = representation(
            
           AWF1   = "numeric",
           AWF2   = "numeric",
           AWF3   = "numeric",
           
           DAPOND = "numeric",
           
           IRRIG0 = "numeric",
           IRRIG1 = "numeric",
           IRRIG2 = "numeric",
           IRRIG3 = "numeric",
           
           PONDTP = "numeric",
           
           WCL1   = "numeric",
           WCL2   = "numeric",
           WCL3   = "numeric",
           
           WL1RT  = "numeric",
           WL2RT  = "numeric",
           WL3RT  = "numeric",
           
           WL1    = "numeric",
           WL2    = "numeric",
           WL3    = "numeric",
           
           WL1T   = "numeric",
           WL2T   = "numeric",
           WL3T   = "numeric",
           
           DINDEX = "numeric"
            
         ),
         
         prototype = prototype( 
            
           AWF1   = 0,
           AWF2   = 0,
           AWF3   = 0,
           
           DAPOND = 0,
           
           IRRIG0 = 0,
           IRRIG1 = 0,
           IRRIG2 = 0,
           IRRIG3 = 0,
           
           PONDTP = 0,
           
           WCL1   = 0,
           WCL2   = 0,
           WCL3   = 0,
           
           WL1RT  = 0,
           WL2RT  = 0,
           WL3RT  = 0,
           
           WL1    = 10, # Arbitrary values, temporal 
           WL2    = 10,
           WL3    = 10,
           
           WL1T   = 64.8,
           WL2T   = 57.6,
           WL3T   = 108,
           
           DINDEX = 10957
 
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)