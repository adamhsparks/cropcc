# nitrogenEmi [nitrogenEmission] 
#-------------
setClass(Class="NitrogenEmissionClass",
         
         representation = representation(
           
           MBFAC  = "numeric",           #== correction factor for microbial biomass, soil N mineralization
           N2ODEN = "numeric",           #== N2O formed due to denitrification
           N2ONIT = "numeric",
           N2OTOT = "numeric"            #== N2O emission
           
            
         ),
         
         prototype = prototype( 
            
            MBFAC  = 0,
            N2ODEN = 0,
            N2ONIT = 0,
            N2OTOT = 0
              
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)