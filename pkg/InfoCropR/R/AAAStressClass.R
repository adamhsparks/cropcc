# stress [stressMulti]
#-------------
setClass(Class="StressClass",
         
         representation = representation(
            
           DINDEX = "numeric", 
           
           MFAC   = "numeric",           #== correction factor for moisture, regulation of microbiological processes
           NSTRES = "numeric",           #== effect of nitrogen deficiency = nitrogen stress
           WSTRES = "numeric",           #== water stress
           
           #*** Effects of temperature on soil
           TFAC   = "numeric",           #== correction factor for temperature, regulation of microbiological processes
           TFACV  = "numeric",           #== correction factor for temperature, voaltilization of N
           
           #*** Effects of pH on soil processes
           PHFAC  = "numeric",           #== correction factor for pH, regulation of microbiological processes
           PHFACV = "numeric"            #== correction factor for pH, voaltilization of N
         ),
         
         prototype = prototype( 
            
            DINDEX = 10957,
            
            MFAC   = 0,
            NSTRES = 0,
            WSTRES = 0,
            
            #*** Effects of temperature on soil
            TFAC   = 0,
            TFACV  = 0,
            
            #*** Effects of pH on soil processes
            PHFAC  = 0,
            PHFACV = 0          
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)