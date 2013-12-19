# management [transplantingDate3, germination2, sowingDate] 
#-------------
setClass(Class="ManagementClass",
         
         representation = representation(
           
           DINDEX = "numeric",
           
           #SOWING DATE
           DAS    = "numeric", #--- var
           NH     = "numeric", #---------- par
           NPLH   = "numeric", #---------- par
           PUDLE  = "numeric", #---------- par
           SEEDAG = "numeric", #---------- par
           #xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx   SOW0   = "numeric", #SOWING DATE DEPENDENT UPON MOISTURE IN LAYER 1 OR UPON FIXED DATE
           SOW6   = "numeric", #--- var
           SOWDEP = "numeric", #---------- par           #== sowing depth
           SPROUT = "numeric", #---------- par
           STTIME = "numeric", #--- var ----------: TIMER
           SWSWCH = "numeric", #---------- par         #SWSWCH is 1 for fixed sowing date and is 0 for soil moisture dependence.
                                                       #FJAV: Without evaluation and not change value
           WCLSOW = "numeric", #--- var
           
           #GERMINATION
           SOWFXD = "numeric", #--- var ----------: TIMER
           
           #EMERGENCE SWITCH
           ESW    = "numeric", #--- var
           ESWI   = "numeric", #--- var
           
           #ADDITION FOR RAINFALL DEPENDENT TRANSPLANTING DATE
           RAINSW = "numeric", #---------- par
           
           #IRRIGATION
           BUNDHT = "numeric", #---------- par           #== water in excess height
           IRSWCH = "numeric", #---------- par
           #IRRAMT = "numeric", #---------- par
           SWCWAT = "numeric", #---------- par
           NEWAGE = "numeric", #--- var
           
           #FERTILISATION
           SWCNIT = "numeric", #---------- par
           NTSWCH = "numeric", #---------- par
           
           #ORGANIC MATTER
           LASTRT = "numeric", #---------- par
           CNOM1  = "numeric", #---------- par
           CNOM2  = "numeric", #---------- par
           CNOM3  = "numeric", #---------- par
           TCOEFF = "numeric", #---------- par           #== time coefficient for CO2 emission release
           CNBACT = "numeric"  #---------- par           #== C:N ratio of the bacteria
         ),
         
        prototype = prototype(
          
          DINDEX = 10957,
           
          #SOWING DATE
          DAS    = 0,
          PUDLE  = 0,       # ** PUDLE IS 0 FOR UPLAND AND 1.0 FOR LOWLAND
          WCLSOW = 0,                  #FJAV: Defined in Line 1127: *PARAM WCLSOW =0.20, BUT are commented.
          NPLH   = 3, 
          NH     = 33,
          SEEDAG = 0,
          SOWDEP = 30,
          SPROUT = 10,
          SWSWCH = 1,          
          STTIME = 319,
          SOW6   = 0,
          
          #GERMINATION
          SOWFXD = 0,
          
          #EMERGENCE SWITCH
          ESW    = 0,
          ESWI   = 0,
          
          #ADDITION FOR RAINFALL DEPENDENT TRANSPLANTING DATE
          RAINSW = 0,
          
          #IRRIGATION
          BUNDHT = 100,
          IRSWCH = 1,
          #IRRAMT = 20,                 #FJAV: Defined, Line 1141: PARAM IRSWCH =1. ;IRRAMT =20., but NOT-USED in FST anywhere
          SWCWAT = 0,
          NEWAGE = 0,
          
          #FERTILISATION
          SWCNIT = 0,
          NTSWCH = 0,
          
          
          #ORGANIC MATTER
          LASTRT = 100,
          CNOM1  = 25, 
          CNOM2  = 14, 
          CNOM3  = 40,
          TCOEFF = 10,
          CNBACT = 0.1
        ),
         
        validity = function(object)
        {
          TRUE
        }

)