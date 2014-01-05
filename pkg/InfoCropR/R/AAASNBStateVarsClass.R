# SNBsv [soilNitrogenBalance]
#-------------
setClass(Class="SNBStateVarsClass",
         
         representation = representation(
           
           # Nitrate content in each soil layer
           NO31   = "numeric",
           NO32   = "numeric",
           NO33   = "numeric",
           
           NO31T  = "numeric",
           NO32T  = "numeric",
           NO33T  = "numeric",
           
           #Soil N balance
           SOILN1 = "numeric",
           SOILNT = "numeric",           
           
           #***   Ammonia balance (NH4) in each soil layer
           NH41   = "numeric",
           NH42   = "numeric", 
           NH43   = "numeric",
           
           NH41T  = "numeric",
           NH42T  = "numeric", 
           NH43T  = "numeric",
           
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
                      
            NO31   = 0.8,
            NO32   = 0.7,
            NO33   = 0.3,
            
            NO31T  = 0.8, #Only difference with NO31 is that these can go below 0.001
            NO32T  = 0.7,
            NO33T  = 0.3,
            
            SOILN1 = 0,
            
            SOILNT = 0,            
            
            #***   Ammonia balance
            NH41   = 0.2,           #== [kg/ha]
            NH42   = 0.8,           #== [kg/ha]
            NH43   = 0,           #== [kg/ha]

            NH41T  = 0.2,
            NH42T  = 0.8, 
            NH43T  = 0,
            
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