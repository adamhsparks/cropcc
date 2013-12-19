# co2Emission [co2emission_globalWarmingPotential] 
#-------------
setClass(Class="CO2EmissionClass",
         
         representation = representation(
            
           DINDEX = "numeric", 
           
           CO2BAL = "numeric",
           
           CO2L1  = "numeric",
           CO2L2  = "numeric",
           CO2L3  = "numeric",
           
           GWP    = "numeric"            #== global warming potential
            
         ),
         
         prototype = prototype( 
            
            DINDEX = 10957,
            
            CO2BAL = 0,
            
            CO2L1  = 0,
            CO2L2  = 0,
            CO2L3  = 0,
            
            GWP    = 0            #== [kg_CO2 / ha]
              
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)