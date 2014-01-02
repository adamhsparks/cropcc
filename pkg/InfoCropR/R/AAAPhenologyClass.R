# phenology [numberstorageOrgans2, phenologicalDevelopment]
#-------------
setClass(Class="PhenologyClass",
         
         representation = representation(
           
            ANTHD  = "numeric",
            DS     = "numeric", #== Development stage
            GFD    = "numeric",
            GNLOSS = "numeric",
            GNO    = "numeric",
            HUVG   = "numeric", #== Daily increment in heat units [?C/day] = thermal time
            RDSA   = "numeric",
            SINKLT = "numeric",
            WSTI   = "numeric"
                        
         ),
         
         prototype = prototype( 
            
            ANTHD  = 0,
            DS     = 0,
            GFD    = 0,
            GNLOSS = 0,
            GNO    = 0,
            HUVG   = 0,
            RDSA   = 0,
            SINKLT = 0

         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)