# srDELAY
#-------------
setClass(Class="srDELAYClass",
         
         representation = representation(

           NLEAFP  = "numeric"
           
            
         ),
         
         prototype = prototype( 

            NLEAFP = 0
              
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)