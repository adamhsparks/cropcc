# soilD [--] = parameters 
#-------------
setClass(Class="SoilDataClass",
         
         representation = representation(
           
           BDM1   = "numeric",
           BDM2   = "numeric",
           BDM3   = "numeric",
           
           DECARB = "numeric",             #== degradation rate of carbohydrate 
           DECELL = "numeric",
           DELIGN = "numeric",
           DESOLC = "numeric",             #== rate constant for soil organic carbon degradation
           
           #== fraction of carbohydrate in each organic matter soil layer
           CARBO1 = "numeric",
           CARBO2 = "numeric",
           CARBO3 = "numeric",
           
           CELLU1 = "numeric", 
           CELLU2 = "numeric", 
           CELLU3 = "numeric",
           
           EC1    = "numeric",  #------------FJAV: Declarated in Line 1188, but Without use in FST
           
           KSATM1 = "numeric", 
           KSATM3 = "numeric",
                      
           LIGNI1 = "numeric",
           LIGNI2 = "numeric", 
           LIGNI3 = "numeric",
           
           NH41I  = "numeric",
           NH42I  = "numeric",
           NH43I  = "numeric",
           
           NO31II = "numeric",
           NO32II = "numeric",
           NO33II = "numeric",
                      
           PHSOL  = "numeric",
           
           # Sand content for pedo-transfer function
           SAND1  = "numeric",
           SAND2  = "numeric",
           SAND3  = "numeric", 
           
           SLOPE  = "numeric",           #== ground inclination
           
           # soil organic carbon in each soil layer
           SOC1   = "numeric",
           SOC2   = "numeric",
           SOC3   = "numeric",
                   
           TKL1   = "numeric",           #== soil layer 1 thickness
           TKL2   = "numeric",           #== soil layer 2 thickness
           
           TKL3M  = "numeric",
           
           TKL3   = "numeric",
           
           WCFCM1 = "numeric",
           WCFCM2 = "numeric",
           WCFCM3 = "numeric",
           
           WCSTM1 = "numeric", 
           WCSTM2 = "numeric", 
           WCSTM3 = "numeric",
                      
           WCWPM1 = "numeric",
           WCWPM2 = "numeric",
           WCWPM3 = "numeric"
            
         ),
         
         prototype = prototype( 
           
           BDM1   = 1.38,
           BDM2   = 1.3,
           BDM3   = 1.3,
            
           DECARB = 0.8, 
           DECELL = 0.05,
           DELIGN = 0.0095,
           DESOLC = 0.001,
           
           CARBO1 = 0.296,
           CARBO2 = 0.2,
           CARBO3 = 0.2,
           
           CELLU1 = 0.627, 
           CELLU2 = 0.7, 
           CELLU3 = 0.7,
           
           EC1    = 0.48,
           
           KSATM1 = 120, 
           KSATM3 = 100,           
           
           LIGNI1 = 0.087, 
           LIGNI2 = 0.1, 
           LIGNI3 = 0.1,
           
           NH41I  = 0.2,  #FJAV: (?)Line 1186: INCON NH41I=0.2;NH42I=0.8;NH43I=.0
           NH42I  = 0.8,
           NH43I  = 0,
           
           NO31II = 0.8,
           NO32II = 0.7,
           NO33II = 0.3,
           
           PHSOL  = 8.1,
           
           SAND1  = 46,
           SAND2  = 46,
           SAND3  = 46,   
           
           SLOPE  = 0,
           
           SOC1   = 0.4,
           SOC2   = 0.3,
           SOC3   = 0.3,
           
           TKL1   = 300,
           TKL2   = 300,
           
           TKL3M  = 600,
           
           TKL3   =   0,
           
           WCFCM1 = 0.24,
           WCFCM2 = 0.24,
           WCFCM3 = 0.24,
           
           WCSTM1 = 0.46, 
           WCSTM2 = 0.44, 
           WCSTM3 = 0.42,
           
           WCWPM1 = 0.07,
           WCWPM2 = 0.07,
           WCWPM3 = 0.07
           
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)