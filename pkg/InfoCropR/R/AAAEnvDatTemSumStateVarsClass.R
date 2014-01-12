setClass(Class="EnvDatTemSumStateVarsClass",
         
         representation = representation(

           DSTART   = "numeric",
           DTR      = "numeric",           #== incident solar radiation
           IRRIGS   = "numeric",
           RADSWC   = "numeric",
           RAINF    = "numeric",
           TRAIN    = "numeric",
           TIRRIG   = "numeric",
           TMAX     = "numeric",
           TMIN     = "numeric",
           TPAD     = "numeric",           #== mean daytime temperature
           TPAV     = "numeric",           #== mean ambient temperature
           TPS      = "numeric",
           TTGM     = "numeric",           #== thermal time
           VPA      = "numeric",
           VPSMIN   = "numeric",
           WIND     = "numeric"
           
         ),
         
         prototype = prototype( 

           DSTART   = 0,
           DTR      = 0,
           IRRIGS   = 0,
           RADSWC   = 1, # ---------- par ---
           RAINF    = 0,
           TIRRIG   = 0,
           TRAIN    = 0,
           TMAX     = 0,
           TMIN     = 0,
           TPAD     = 0,
           TPAV     = 0,
           TPS      = 0,
           TTGM     = 1,
           VPA      = 0,
           VPSMIN   = 0,
           WIND     = 0
           
         ),
         
         validity = function(object)
         {
            TRUE
         }
)