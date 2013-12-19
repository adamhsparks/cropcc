#srSUBDD [subRoutines: SUBR_SUBDD]
#-------------
setClass(Class="srSUBDDClass",
         
         representation = representation(

            DINDEX = "numeric",
            
            HU     = "numeric" #== Hourly increments in termal time
            
         ),
         
         prototype = prototype( 
          
            DINDEX = 10957,
            
            HU     = 0
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)