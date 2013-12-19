# srWSRT [subRoutines: SUBR_WSRT]
#-------------
setClass(Class="srWSRTClass",
         
         representation = representation(
            
           DINDEX = "numeric", 
           
           WSERT  = "numeric"            #== soil water stress factor for roots         
         ),
         
         prototype = prototype( 
            
            DINDEX = 10957,
            
            WSERT  = 0             
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)