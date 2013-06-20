# soil
#TODO validity, using info on page 64-65.
setClass(Class="SoilClass",
         
         representation = representation(
           
           DINDEX = "numeric",
           
           DAPUDL = "numeric",
           
           PDCF1 = "numeric",
           PDCF2 = "numeric",
           PDCF3 = "numeric",
           
           DECARB = "numeric", 
           DECELL = "numeric",
           DELIGN = "numeric",
           DESOLC = "numeric",
           
           CARBO1 = "numeric",
           CARBO2 = "numeric",
           CARBO3 = "numeric",
           
           CELLU1 = "numeric", 
           CELLU2 = "numeric", 
           CELLU3 = "numeric",
           
           LIGNI1 = "numeric", 
           LIGNI2 = "numeric", 
           LIGNI3 = "numeric",
           
           TKL1 = "numeric",
           TKL2 = "numeric",
           TKL3 = "numeric",
          
           TKL3M = "numeric",
           
           SOILSW = "numeric",   #SOILSW IS 0. FOR MEASURED DATA, OTHERWISE = 1.
           
           WCFC1  = "numeric",
           WCFC2  = "numeric",
           WCFC3  = "numeric",
           
           WCFCM1 = "numeric",
           WCFCM2 = "numeric",
           WCFCM3 = "numeric",
           
           WCWP1  = "numeric",
           WCWP2  = "numeric",
           WCWP3  = "numeric",
           
           WCWPM1 = "numeric",
           WCWPM2 = "numeric",
           WCWPM3 = "numeric",
           
           WCST1  = "numeric",
           WCST2  = "numeric",
           WCST3  = "numeric",
           
           WCSTM1 = "numeric", 
           WCSTM2 = "numeric", 
           WCSTM3 = "numeric",
           
           KSAT1 = "numeric",
           KSAT2 = "numeric",
           KSAT3 = "numeric",
           
           KSATM1 = "numeric", 
           KSATM3 = "numeric",
           
           SAND1 = "numeric",
           SAND2 = "numeric",
           SAND3 = "numeric",
           
           SOC1 = "numeric",
           SOC2 = "numeric",
           SOC3 = "numeric",
           
           BDM1 = "numeric",
           BDM2 = "numeric",
           BDM3 = "numeric",
           
           PHSOL = "numeric",
           
           SLOPE = "numeric",
           
           NH41I = "numeric",
           NH42I = "numeric",
           NH43I = "numeric",
           
           NO31II = "numeric",
           NO32II = "numeric",
           NO33II = "numeric",
           
           EC1 = "numeric",

           N2NRAT = "numeric",
           
           N2DRAT = "numeric",
           
#           RNSOIL = "function",  #----- in AAAtabularFunctionsClass.R -----
           EZRTTB = "function", #----- in AAAtabularFunctionsClass.R -----
#           EESTAB = "function", #----- in AAAtabularFunctionsClass.R -----
#           SOILAB = "function", #----- in AAAtabularFunctionsClass.R -----
#           PDCOEF = "function",  #----- in AAAtabularFunctionsClass.R -----
           EHFAC  = "function" #----- in AAAtabularFunctionsClass.R -----
          ),
         
         prototype = prototype( 
           
           DINDEX = 10957, 
           DAPUDL = 0, #Line 423:       DAPUDL <- INSW(DAS-SEEDAG, 0, AMAX1(0, DAS+1-NEWAGE))
           PDCF1  = 0, #Lines 424,5:    PDCF1  <- INSW(PUDLE-0.98, 1, INSW(DAPUDL-0.1, 1, LIMIT(1, 1.1, 1.1-0.002*DAPUDL)))
           PDCF2  = 0, #Lines 426,7,8:  PDCF2  <- INSW(PUDLE-0.98, 1, INSW(DAPUDL-0.1, 1, LIMIT(0, 1, AFGEN(PDCOEF, SAND2)+ INSW(DAPUDL-40, 0, 0.005*(DAPUDL-39)))))
           PDCF3  = 0, #Lines 429,30:   PDCF3  <- INSW(PUDLE-0.98, 1, INSW(DAPUDL-0.1, 1, LIMIT(0, 1, 0.9+0.002*DAPUDL)))
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
           LIGNI1 = 0.087, 
           LIGNI2 = 0.1, 
           LIGNI3 = 0.1,
           
           TKL1 = 300,
           TKL2 = 300,
           TKL3 = 600, #Line 36: TKL3 <- INSW(PUDLE-0.5, TKL3M, .1)
           
           TKL3M = 600,
           
           SOILSW = 0,  #SOILSW IS 0. FOR MEASURED DATA, OTHERWISE =1.
           
           WCFC1  = 0.24,
           WCFC2  = 0.24,
           WCFC3  = 0.24,
           
           WCFCM1 = 0.24,
           WCFCM2 = 0.24,
           WCFCM3 = 0.24,
           
           WCWP1  = 0, #Line 407  WCWP1 <- INSW(SOILSW - 1, WCWPM1, WCWPC1)
           WCWP2  = 0, #Line 408: WCWP2 <- INSW(SOILSW - 1, WCWPM2, WCWPC2)
           WCWP3  = 0, #Line 409: WCWP3 <- INSW(SOILSW - 1, WCWPM3, WCWPC3)
           
           WCWPM1 = 0.07,
           WCWPM2 = 0.07,
           WCWPM3 = 0.07,
           
           WCST1  = 0.46,
           WCST2  = 0.44,
           WCST3  = 0.42,
           
           WCSTM1 = 0.46, 
           WCSTM2 = 0.44, 
           WCSTM3 = 0.42,
           
           KSAT1 = 120,
           KSAT2 = 0, 
           KSAT3 = 100,
           
           KSATM1 = 120, 
           KSATM3 = 100,
           
           SAND1 = 46,     # Line 1180 in "infocrop-wheat.FST", # Line 962,3  in "infocrop-wheat.FST"
           SAND2 = 46,
           SAND3 = 46,
           
           SOC1 = 0.4,
           SOC2 = 0.3,
           SOC3 = 0.3,
           
           BDM1 = 1.38,
           BDM2 = 1.3,
           BDM3 = 1.3,
           
           PHSOL = 8.1,
           SLOPE = 0,
           
           NH41I = 0.2,
           NH42I = 0.8,
           NH43I = 0,
           
           NO31II = 0.8,
           NO32II = 0.7,
           NO33II = 0.3,
           
           EC1 = 0.48,
           
#           RNSOIL = approxfun(c(0,1,5,10,20,100), c(0,0,0.15,0.6,0.8,0.8)), 
           EZRTTB = approxfun(c(0, 1, 1.5, 1.7, 2), c(0.67, 0.67, 0.9, 1, 1)),
#           EESTAB = approxfun(c(0, 20, 30, 40, 50, 60, 80, 100), c(0.004, 0.004, 0.0035, 0.003, 0.0025, 0.002, 0.0015, 0.0015)),
#           SOILAB = approxfun(c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 1), c(0.5, 0.3, 0.25, 0.22, 0.15, 0.1, 0.1)),
           N2NRAT = 0.002,
           N2DRAT = 0.003,
#           PDCOEF = approxfun(c(0, 20, 30, 65, 80, 100), c(0.8, 0.2, 0.2, 0.4, 0.8, 1)), 
           EHFAC = approxfun(c(-400, -220, -150, -100, -50, 0, 50, 5000), c(1, 1, 0.9, 0.65, 0.4, 0.1, 0, 0))
           ),
         
         validity = function(object)
         {
            TRUE
         }
         
)