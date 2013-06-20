# tabFunction
setClass(Class="tabularFunctionsClass",
         
         representation = representation(
            
               COFST  = "numeric",
               CRAINP = "numeric",
               IRRTSF = "numeric",
               RNSOIL = "numeric",
               PDCOEF = "numeric",
               IRRTL3 = "numeric",
               WEED   = "numeric",
               EESTAB = "numeric",
               IRRTL2 = "numeric",
               EDPTFT = "numeric",
               CTMAXP = "numeric",
               CTMINP = "numeric",
               TTGMEX = "numeric",
               DRWT   = "numeric",
               NDRWT  = "numeric",
               IRRTL1 = "numeric",
               SOILAB = "numeric"
         ),
         
         prototype = prototype(   # c(x1,y1, x2,y2, x3,y3, ..., xn,yn)
            
            COFST  = c(0,1, 300,1, 400,1, 700,1.2, 1000,1.3),
            CRAINP = c(0,0, 365,0),
            CTMAXP = c(0,0, 365,0),
            CTMINP = c(0,0, 365,0),
            DRWT   = c(0,2, 0.2,1.5, 0.3,1.4, 0.4,1.35, 0.5,1.3, 0.85,1, 2,1),
            EESTAB = c(0,0.004, 20,0.004, 30,0.0035, 40,0.003, 50,0.0025, 60,0.002, 80,0.0015, 100,0.0015),
            EDPTFT = c(-50,0, -0.05,0, 0,0.15, 0.15,0.6, 0.3,0.8, 0.5,1, 1000.1,1),
            IRRTL1 = c(0,0, 365,0),
            IRRTL2 = c(0,0, 365,0),
            IRRTL3 = c(0,0, 365,0),
            IRRTSF = c(0,0, 365,0),
            NDRWT  = c(0,2, 0.2,1.5, 0.3,1.3, 0.4,1.35, 0.5,1.3, 0.85,1, 2,1),
            PDCOEF = c(0,0.8, 20,0.2, 30,0.2, 65,0.4, 80,0.8, 100,1),
            RNSOIL = c(0,0, 1,0, 5,0.15, 10,0.6, 20,0.8, 100,0.8),                        
            SOILAB = c(0,0.5, 0.1,0.3, 0.2,0.25, 0.3,0.22, 0.4,0.15, 0.5,0.1, 1,0.1),
            TTGMEX = c(0,1.2, 10,1, 15,0.9, 16,50, 100,1000),
            WEED   = c(0,0, 365,0)
            
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)