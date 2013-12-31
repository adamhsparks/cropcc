# soil [puddling2, soilProperties] 
#-------------
setClass(Class="SoilClass",
         
         representation = representation(
           
           #== bulk density
           BD1    = "numeric",
           BD2    = "numeric",
           BD3    = "numeric",
           
           # Correction factor to adjust bulk density and hydraulic conductivity of the soil
           PDCF1 = "numeric",
           PDCF2 = "numeric",
           PDCF3 = "numeric",           
           
           TKLT  = "numeric",           #== soil depth
           
           # Field capacity (pedo-transfer function)
           WCFC1  = "numeric",
           WCFC2  = "numeric",
           WCFC3  = "numeric",
          
           # Wilting point (pedo-transfer function)
           WCWP1  = "numeric",
           WCWP2  = "numeric",
           WCWP3  = "numeric",
           
           # Saturation (pedo-transfer function)
           WCST1  = "numeric",
           WCST2  = "numeric",
           WCST3  = "numeric",           
           
           KSAT1 = "numeric",
           KSAT3 = "numeric",

           N2NRAT = "numeric", #---------- par ---           #== rate constant of nitrification
           N2DRAT = "numeric"  #---------- par ---           #== rate constant of denitrification

          ),
         
         prototype = prototype( 
           
           BD1 = 0,
           BD2 = 0,
           BD3 = 0,

           PDCF1  = 0,
           PDCF2  = 0,
           PDCF3  = 0,
           
           TKLT = 1200,
           
           WCFC1  = 0.24,
           WCFC2  = 0.24,
           WCFC3  = 0.24,
           
           WCWP1  = 0, 
           WCWP2  = 0, 
           WCWP3  = 0,            
           
           WCST1  = 0.46,
           WCST2  = 0.44,
           WCST3  = 0.42,           
           
           KSAT1 = 120,
           KSAT3 = 100,
           
           N2NRAT = 0.002,
           N2DRAT = 0.003

           ),
         
         validity = function(object)
         {
            TRUE
         }
         
)