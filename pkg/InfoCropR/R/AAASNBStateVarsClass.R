# SNBsv [soilNitrogenBalance]
#-------------
setClass(Class="SNBStateVarsClass",
         
         representation = representation(
           
           # Nitrate content in each soil layer
           NO31   = "numeric",
           NO32   = "numeric",
           NO33   = "numeric",
           
           #Soil N balance
           SOILN1 = "numeric",
           SOILNT = "numeric",           
           
           #***   Ammonia balance (NH4) in each soil layer
           NH41   = "numeric",
           NH42   = "numeric", 
           NH43   = "numeric",
           
           T1     = "numeric",
           T2     = "numeric",
           T3     = "numeric",
           
           #** N fluxes
           NAPOND = "numeric",
           
           #*** Urea hydrolysis
           U1     = "numeric",
           U2     = "numeric",
           U3     = "numeric"
            
         ),
         
         prototype = prototype( 
            
            NO31   = 0,
            NO32   = 0,
            NO33   = 0,
            
            SOILN1 = 0,
            
            SOILNT = 0,            
            
            #***   Ammonia balance
            NH41   = 0,           #== [kg/ha]
            NH42   = 0,           #== [kg/ha]
            NH43   = 0,           #== [kg/ha]
            T1   = 0,
            T2   = 0,
            T3   = 0,
            
            #** N fluxes
            NAPOND = 0,
            
            #*** Urea hydrolysis
            U1   = 0,
            U2   = 0,
            U3   = 0
              
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)