# phenology [numberstorageOrgans2, phenologicalDevelopment]
#-------------
setClass(Class="PhenologyClass",
         
         representation = representation(
            
            DINDEX = "numeric",
           
            ANTHD  = "numeric",
            DS     = "numeric", #== Development stage
            GFD    = "numeric",
            GNLOSS = "numeric",
            GNO    = "numeric",
            HUVG   = "numeric", #== Daily increment in heat units [?C/day] = thermal time
            RDSA   = "numeric",
            SINKLT = "numeric"
                        
         ),
         
         prototype = prototype( 
           
            DINDEX = 10957,
            
            ANTHD  = 0,
            DS     = 0, #JvE: No DSI needed!
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