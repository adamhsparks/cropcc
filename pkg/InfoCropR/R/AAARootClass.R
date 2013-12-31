# root [rootingDepth2, rhizodeposition] 
#-------------
setClass(Class="RootClass",
         
         representation = representation(
           
           RTEXUD = "numeric",             #== root exudates (assumed to be entirey carbohydrates)
           RTDETH = "numeric",           
           
           #ROOTING DEPTH
           ZRT    = "numeric",           #== root depth
           ZRT1   = "numeric",
           ZRT2   = "numeric",
           ZRT3   = "numeric"
           
            
         ),
         
         prototype = prototype( 
            
            RTEXUD = 0,
            RTDETH = 0,
            
            #ROOTING DEPTH
            ZRT    = 0,
            ZRT1   = 0,
            ZRT2   = 0,
            ZRT3   = 0
              
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)