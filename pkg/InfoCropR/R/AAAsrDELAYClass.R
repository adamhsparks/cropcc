# srDELAY
#-------------
setClass(Class="srDELAYClass",
         
         representation = representation(
            
           DINDEX = "numeric", 
           NLEAFP  = "numeric"
           
            
         ),
         
         prototype = prototype( 
            
            DINDEX = 10957,
            NLEAFP = 0
              
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)