# SWBsv [soilwaterBalance] 
#-------------
setClass(Class="SWBStateVarsClass",
         
         representation = representation(
           
           DINDEX = "numeric",
           
           AWF1   = "numeric", #== available water fraction in soil layer 1
           AWF2   = "numeric", #== available water fraction in soil layer 2
           AWF3   = "numeric", #== available water fraction in soil layer 3
           
           DAPOND = "numeric",
           DRAIN  = "numeric",           #== actual drainage
           
           IRRIG0 = "numeric",           #== surface irrigation
           IRRIG1 = "numeric",
           IRRIG2 = "numeric",
           IRRIG3 = "numeric",
           
           PNDEVP = "numeric",           #== surface evaportion of ponded water
           POND   = "numeric",           #== free-standing water on soil surface depth
           PONDTP = "numeric",
           
           RNOFF  = "numeric",           #== runoff
           
           WCL1   = "numeric",
           WCL2   = "numeric",
           WCL3   = "numeric",
           
           WL1RT  = "numeric",
           WL2RT  = "numeric",
           WL3RT  = "numeric",
           
           # net water content in soil layer No.
           WL1    = "numeric",
           WL2    = "numeric",
           WL3    = "numeric",
           
           WL1T   = "numeric",
           WL2T   = "numeric",
           WL3T   = "numeric",
           
           WLFL1 = "numeric",           #== surface water infiltration to soil layer 1
           WLFL2 = "numeric",           #== downward flux from soil layer 1 to soil layer 2
           WLFL3 = "numeric",           #== downward flux from soil layer 2 to soil layer 3
           WLFL4 = "numeric",           #== downward flux from soil layer 3 to subsoil
           WLFL5 = "numeric",           #== upward flux from subsoil to soil layer 3
           WLFL6 = "numeric",           #== upward flux from soil layer 3 to soil layer 2
           WLFL7 = "numeric",           #== upward flux from soil layer 2 to soil layer 1
           WLFL8 = "numeric"            #== upward flux from soil layer 1 to surface
            
         ),
         
         prototype = prototype( 
            
           AWF1   = 0,
           AWF2   = 0,
           AWF3   = 0,
           
           DAPOND = 0,
           DRAIN  = 0,
           
           IRRIG0 = 0,
           IRRIG1 = 0,
           IRRIG2 = 0,
           IRRIG3 = 0,
           
           PNDEVP = 0,
           POND   = 0,
           PONDTP = 0,
           
           RNOFF  = 0,
           
           WCL1   = 0,
           WCL2   = 0,
           WCL3   = 0,
           
           WL1RT  = 0,
           WL2RT  = 0,
           WL3RT  = 0,
           
           WL1    = 0, 
           WL2    = 0,
           WL3    = 0,
           
           WL1T   = 0,
           WL2T   = 0,
           WL3T   = 0, 
           
           WLFL1  = 0,
           WLFL2  = 0,
           WLFL3  = 0,
           WLFL4  = 0,
           WLFL5  = 0,
           WLFL6  = 0,
           WLFL7  = 0,
           WLFL8  = 0,
           
           DINDEX = 10957
 
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)