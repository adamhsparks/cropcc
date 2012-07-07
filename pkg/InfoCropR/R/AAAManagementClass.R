setClass(Class="Management",
         representation = representation(
           #SOWING DATE
           PUDLE = "numeric",
           WCLSOW = "numeric", #??Commented
           NPLH = "numeric",
           NH = "numeric", 
           SEEDAG = "numeric",
           SOWDEP = "numeric",
           SPROUT = "numeric",
           
           #IRRIGATION
           IRRTSF = "function",
           IRRTL1 = "function",
           IRRTL2 = "function",
           IRRTL3 = "function",
           BUNDHT = "numeric",
           IRSWCH = "numeric",
           IRRAMT = "numeric",
           SWCWAT = "numeric",
           
           #FERTILISATION
           UREAP1 = "function",
           UREAP2 = "function",
           UREAP3 = "function",
           NH4AP1 = "function",
           NH4AP2 = "function",
           NH4AP3 = "function",
           NOAP1 = "function",
           NOAP2 = "function",
           NOAP3 = "function",
           SWCNIT = "numeric",
           NTSWCH = "numeric",
           
           #ORGANIC MATTER
           OM1DAT = "function",
           OM2DAT = "function",
           OM3DAT = "function",
           LASTRT = "numeric",
           CNOM1 = "numeric",
           CNOM2 = "numeric",
           CNOM3 = "numeric",
           CNMODF = "function",
           EBULTN = "function",
           TCOEFF = "numeric",
           CNBACT = "numeric"
         ),
        prototype = prototype(       
          #SOWING DATE
          PUDLE = 0,
          WCLSOW = 0.20,
          NPLH = 3, 
          NH = 33,
          SEEDAG = 0,
          SOWDEP = 30,
          SPROUT = 10,
          
          #IRRIGATION
          IRRTSF = approxfun(c(0, 19, 20, 21, 45, 46, 47, 70, 71, 72, 90, 91, 92, 110, 111, 112, 365), 
                             c(0,  0,  0,  0,  0, 50,  0 , 0, 50,  0,  0, 50,  0,   0,  50,   0,   0)),
          IRRTL1 = approxfun(c(0, 365),c(0,0)),
          IRRTL2 = approxfun(c(0, 365),c(0,0)),
          IRRTL3 = approxfun(c(0, 365),c(0,0)),
          BUNDHT = 100,
          IRSWCH = 1,
          IRRAMT = 20,
          SWCWAT = 0,
          
          #FERTILISATION
          UREAP1 = approxfun(c( 0, 1, 20, 21, 22, 34, 35, 36, 59, 60, 61, 365),
                             c(60, 0,  0,  0, 60,  0,  0,  0,  0,  0,  0,   0)),
          UREAP2 = approxfun(c(0, 365),c(0,0)),
          UREAP3 = approxfun(c(0, 365),c(0,0)),
          NH4AP1 = approxfun(c(0, 365),c(0,0)),
          NH4AP2 = approxfun(c(0, 365),c(0,0)),
          NH4AP3 = approxfun(c(0, 365),c(0,0)),
          NOAP1 = approxfun(c(0, 365),c(0,0)),
          NOAP2 = approxfun(c(0, 365),c(0,0)),
          NOAP3 = approxfun(c(0, 365),c(0,0)),
          SWCNIT = 0,
          NTSWCH = 0,
          
          
          #ORGANIC MATTER
          OM1DAT = approxfun(c(0, 365),c(0,0)),
          OM2DAT = approxfun(c(0, 365),c(0,0)),
          OM3DAT = approxfun(c(0, 365),c(0,0)),
          LASTRT = 100,
          CNOM1 = 25, 
          CNOM2 = 14, 
          CNOM3 = 40,
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
