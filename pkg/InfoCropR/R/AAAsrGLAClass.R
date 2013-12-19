# srGLA [subRoutines: SUBR_GLA]
#-------------
setClass(Class="srGLAClass",
         
         representation = representation(
            
           DINDEX = "numeric", 
           GLAI  = "numeric"            #== leaf area growth rate
            
         ),
         
         prototype = prototype( 
            
            DINDEX = 10957,
            GLAI  = 0
              
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)