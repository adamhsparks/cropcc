# methane [methaneEmission] 
#-------------
setClass(Class="MethaneClass",
         
         representation = representation(
            
           CH4PR1 = "numeric",
           CH4PR2 = "numeric",
           CH4PR3 = "numeric",
           
           CH4TOT = "numeric",           #== methane production
           CHEMIT = "numeric",           #== total emission of methane from soils
           
           CHSOIL = "numeric"            #== methane accumulated in the soil
            
         ),
         
         prototype = prototype( 
            
            CH4PR1 = 0,
            CH4PR2 = 0,
            CH4PR3 = 0,
            
            CH4TOT = 0,
            CHEMIT = 0,
            
            CHSOIL = 0
            
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)