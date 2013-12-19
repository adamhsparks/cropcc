# root [rootingDepth2, rhizodeposition] 
#-------------
setClass(Class="RootClass",
         
         representation = representation(
            
           DINDEX = "numeric", 
           
           RTEXUD = "numeric",             #== root exudates (assumed to be entirey carbohydrates)
           RTDETH = "numeric",           
           
           #ROOTING DEPTH
           ZRT    = "numeric",           #== root depth
           ZRT1   = "numeric",
           ZRT2   = "numeric",
           ZRT3   = "numeric"
           
            
         ),
         
         prototype = prototype( 
            
            DINDEX = 10957,
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