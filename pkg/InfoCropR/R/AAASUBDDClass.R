#SUBDD
setClass(Class="SUBDDClass",
         
         representation = representation(
            
            HU     = "numeric",
            DINDEX = "numeric"
            
         ),
         
         prototype = prototype( 
            
            HU  = 0,
            DINDEX = 10957
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)