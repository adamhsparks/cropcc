#climate [--] = parameters
#-------------
setClass(Class = "ClimateClass",
         
         representation = representation(          
           
           # Climate Change Data
           CO2    = "numeric"
            
            ),
         
         prototype = prototype(          
           
           # Climate Change Data
           CO2    = 369
            
            ),
         
         validity = function(object)
         {
            return(TRUE)
         }
  )