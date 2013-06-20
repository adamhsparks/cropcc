# management
setClass(Class="ManagementClass",
         
         representation = representation(
            
           #SOWING DATE
           DAS    = "numeric",
           PUDLE  = "numeric",
           WCLSOW = "numeric", #??Commented
           NPLH   = "numeric",
           NH     = "numeric", 
           SEEDAG = "numeric",
           SOWDEP = "numeric",
           SPROUT = "numeric",
           SWSWCH = "logical", #SWSWCH is TRUE for fixed sowing date and is FALSE for soil moisture dependence.
           STTIME = "numeric",
           
           #IRRIGATION
#           IRRTSF = "function", #----- in AAAtabularFunctionsClass.R -----
#           IRRTL1 = "function", #----- in AAAtabularFunctionsClass.R -----
#           IRRTL2 = "function", #----- in AAAtabularFunctionsClass.R -----
#           IRRTL3 = "function", #----- in AAAtabularFunctionsClass.R -----
           BUNDHT = "numeric",
           IRSWCH = "numeric",
           IRRAMT = "numeric",
           SWCWAT = "numeric",
           NEWAGE = "numeric",
           
           #FERTILISATION
           UREAP1 = "function", #----- in AAAtabularFunctionsClass.R -----
           UREAP2 = "function", #----- in AAAtabularFunctionsClass.R -----
           UREAP3 = "function", #----- in AAAtabularFunctionsClass.R -----
           NH4AP1 = "function", #----- in AAAtabularFunctionsClass.R -----
           NH4AP2 = "function", #----- in AAAtabularFunctionsClass.R -----
           NH4AP3 = "function", #----- in AAAtabularFunctionsClass.R -----
           NOAP1  = "function", #----- in AAAtabularFunctionsClass.R -----
           NOAP2  = "function", #----- in AAAtabularFunctionsClass.R -----
           NOAP3  = "function", #----- in AAAtabularFunctionsClass.R -----
           SWCNIT = "numeric",
           NTSWCH = "numeric",
           
           #ORGANIC MATTER
           OM1DAT = "function", #----- in AAAtabularFunctionsClass.R -----
           OM2DAT = "function", #----- in AAAtabularFunctionsClass.R -----
           OM3DAT = "function", #----- in AAAtabularFunctionsClass.R -----
           LASTRT = "numeric",
           CNOM1  = "numeric",
           CNOM2  = "numeric",
           CNOM3  = "numeric",
           CNMODF = "function",  #----- in AAAtabularFunctionsClass.R -----
           EBULTN = "function",  #----- in AAAtabularFunctionsClass.R -----
           TCOEFF = "numeric",
           CNBACT = "numeric"
         ),
         
        prototype = prototype(
           
          #SOWING DATE
          DAS    = 0,
          PUDLE  = 0,
          WCLSOW = 0.20,
          NPLH   = 3, 
          NH     = 33,
          SEEDAG = 0,
          SOWDEP = 30,
          SPROUT = 10,
          SWSWCH = FALSE,
          STTIME = 319,
          
          #IRRIGATION
#          IRRTSF = approxfun(c(0, 19, 20, 21, 45, 46, 47, 70, 71, 72, 90, 91, 92, 110, 111, 112, 365), 
#                             c(0,  0,  0,  0,  0, 50,  0 , 0, 50,  0,  0, 50,  0,   0,  50,   0,   0)),
#          IRRTL1 = approxfun(c(0, 365),c(0,0)),
#          IRRTL2 = approxfun(c(0, 365),c(0,0)),
#          IRRTL3 = approxfun(c(0, 365),c(0,0)),
          BUNDHT = 100,
          IRSWCH = 1,
          IRRAMT = 20,
          SWCWAT = 0,
          NEWAGE = 0,
          
          #FERTILISATION
          UREAP1 = approxfun(c( 0, 1, 20, 21, 22, 34, 35, 36, 59, 60, 61, 365),
                             c(60, 0,  0,  0, 60,  0,  0,  0,  0,  0,  0,   0)),
          UREAP2 = approxfun(c(0, 365),c(0,0)),
          UREAP3 = approxfun(c(0, 365),c(0,0)),
          NH4AP1 = approxfun(c(0, 365),c(0,0)),
          NH4AP2 = approxfun(c(0, 365),c(0,0)),
          NH4AP3 = approxfun(c(0, 365),c(0,0)),
          NOAP1  = approxfun(c(0, 365),c(0,0)),
          NOAP2  = approxfun(c(0, 365),c(0,0)),
          NOAP3  = approxfun(c(0, 365),c(0,0)),
          SWCNIT = 0,
          NTSWCH = 0,
          
          
          #ORGANIC MATTER
          OM1DAT = approxfun(c(0, 365),c(0,0)),
          OM2DAT = approxfun(c(0, 365),c(0,0)),
          OM3DAT = approxfun(c(0, 365),c(0,0)),
          LASTRT = 100,
          CNOM1  = 25, 
          CNOM2  = 14, 
          CNOM3  = 40,
          CNMODF = approxfun(c(0, 5, 100000), c(0.5, 1, 1)),
          EBULTN = approxfun(c(-10, 0,  10,  20, 30,   50, 100, 5000),
                             c(  0, 0, 0.4, 0.3, 0.2, 0.1,   0,    0)),
          TCOEFF = 10,
          CNBACT = 0.1
        ),
         
        validity = function(object)
        {
          TRUE
        }

)