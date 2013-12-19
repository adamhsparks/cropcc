#srFUFR [subRoutines: SUBR_FUFR]
#-------------
setClass(Class="srFUFRClass",
         
         representation = representation(
            
            DINDEX = "numeric",
            
            WSE1   = "numeric",           #== water stress effect
            WSE2   = "numeric",
            WSE3   = "numeric"
         ),
         
         prototype = prototype( 

            DINDEX = 10957,
            
            WSE1   = 0,
            WSE2   = 0,
            WSE3   = 0
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)