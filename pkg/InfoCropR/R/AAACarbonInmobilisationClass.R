# carbonInmo [carbonInmobilisation] 
#-------------
setClass(Class="CarbonInmobilisationClass",
         
         representation = representation(
            
           DINDEX = "numeric", 
           
           # carbon immobilized by the soil bacteria
           CIMMO1 = "numeric",
           CIMMO2 = "numeric",
           CIMMO3 = "numeric"
           
            
         ),
         
         prototype = prototype( 
            
            DINDEX = 10957,
            
            CIMMO1 = 0,
            CIMMO2 = 0,
            CIMMO3 = 0
              
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)