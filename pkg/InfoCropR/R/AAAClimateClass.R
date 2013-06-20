#climate
setClass(Class = "ClimateClass",
         
         representation = representation(
           # Environmental Data and Temperature Sum
           CCRAIN = "numeric",
           DSTART = "numeric",
           RAINF  = "numeric",
           RDAS   = "numeric",
           
           # Climate Change Data
           CO2    = "numeric"
            
            ),
         
         prototype = prototype(
           # Environmental Data and Temperature Sum
           CCRAIN = 0,   #Line 64:  CCRAIN <- AFGEN (CRAINP, DOY) 
           DSTART = 1,   #Line 92:  DSTART = INTGRL (ZERO, RDAS) // R> dDSTART <- RDAS
           RAINF  = 7.2, #Line 70:  RAINF  <- AMAX1(0.,RAIN*(100.+ CCRAIN)/100.)
           RDAS   = 1,   #Line 93:  RDAS   <- DELT
           
           # Climate Change Data
           CO2    = 369
            
            ),
         
         validity = function(object)
         {
            return(TRUE)
         }
  )