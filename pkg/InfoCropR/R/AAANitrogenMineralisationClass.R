# nitrogenMine [nitrogenMineralisation]
#-------------
setClass(Class="NitrogenMineralisationClass",
         
         representation = representation(
            
           DINDEX = "numeric", 
           
           # temporary variable for N mineralization
           MRATE1 = "numeric",
           MRATE2 = "numeric",
           MRATE3 = "numeric",
           
           # net mineralization of soil N
           NMINS1 = "numeric",
           NMINS2 = "numeric",
           NMINS3  = "numeric"          
            
         ),
         
         prototype = prototype( 
            
            DINDEX = 10957,
            
            MRATE1 = 0,
            MRATE2 = 0,
            MRATE3 = 0,
            
            NMINS1 = 0,
            NMINS2 = 0,
            NMINS3 = 0
              
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)