# fertilisation [fertilisation]
#-------------
setClass(Class="FertilisationClass",
         
         representation = representation(                     
           
           # N applied through NH4 in each soil layer
           NHAPL1 = "numeric",
           NHAPL2 = "numeric",
           NHAPL3 = "numeric",
           
           # N applied through NO3 in each soil layer
           NOAPL1 = "numeric",
           NOAPL2 = "numeric",
           NOAPL3 = "numeric",
           
           OM1APP = "numeric",
           OM2APP = "numeric",
           OM3APP = "numeric",
           
           ORGNIT = "numeric",
           
           RAINN  = "numeric",           #== Rainfall N soil input
           
           # N applied through urea in each soil layer
           UAPPL1 = "numeric",
           UAPPL2 = "numeric",
           UAPPL3 = "numeric"
            
         ),
         
         prototype = prototype( 
           
            NHAPL1 = 0,
            NHAPL2 = 0,
            NHAPL3 = 0,
            
            NOAPL1 = 0,
            NOAPL2 = 0,
            NOAPL3 = 0,
            
            OM1APP = 0,
            OM2APP = 0,
            OM3APP = 0,
            
            ORGNIT = 0,
            
            RAINN  = 0,
            
            UAPPL1 = 0,
            UAPPL2 = 0,
            UAPPL3 = 0
              
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)