# nitrogenD [--] = parameters 
#-------------
setClass(Class="NitrogenDataClass",
         
         representation = representation(
            
           ASOLC  = "numeric",           #== assimilation rate (per day) of C by the soil microbes
           DESOLN = "numeric",           #== rate constant of mineralization of soil N 
           DNRATE = "numeric",           #== rate constant of denitrification of soil
           LNH4   = "numeric",           #== threshold concentration of NH4 below wich no ammonium volatilization occurs
           NBIOL  = "numeric",           #== Biological N-fixation N soil input
           NIRATE = "numeric",           #== rate constant of nitrification Volatilization
           NTFRAC = "numeric",      #FJAV: Defined in Line 546 but Without use in FST
           TCDRN  = "numeric",           #== time constant for N drainage
           TCVOL  = "numeric",           #== time constant for volatilization of N
           UHRATE = "numeric"            #== rate of urea hydrolysis
         ),
         
         prototype = prototype( 
            
            ASOLC  = 0.3,
            DESOLN = 0.0043,           #== [1/d]
            DNRATE = 0.05,
            LNH4   = 2.2,              #== [kg/ha]
            NBIOL  = 0.04,
            NIRATE = 0.35,
            NTFRAC = 1,
            TCDRN  = 10,
            TCVOL  = 10,
            UHRATE = 0.6               #== [1/d]
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)