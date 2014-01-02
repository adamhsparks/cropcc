#TODO JvE: Germination and emergence should be moved to cropsv, perhaps all variables!

setClass(Class="ManagementClass",
         
         representation = representation(
           
           #SOWING DATE
           DAS    = "numeric", #variable
           NH     = "numeric", #parameter
           NPLH   = "numeric", #parameter
           PUDLE  = "numeric", #parameter
           SEEDAG = "numeric", #parameter
           #SOW0   = "numeric", #SOWING DATE DEPENDENT UPON MOISTURE IN LAYER 1 OR UPON FIXED DATE
           SOW6   = "numeric", #variable
           SOWDEP = "numeric", #parameter        #== sowing depth
           SOWFXD = "numeric", #parameter
           SPROUT = "numeric", #parameter
           SWSWCH = "numeric", #parameter         #SWSWCH is 1 for fixed sowing date and is 0 for soil moisture dependence.
                                                       #FJAV: Without evaluation and not change value
           WCLSOW = "numeric", #variable
           
           #SEED RATE
           SEEDRT = "numeric", #parameter
           
           #EMERGENCE SWITCH
           ESW    = "numeric", #variable 
           ESWI   = "numeric", #variable
           
           #ADDITION FOR RAINFALL DEPENDENT TRANSPLANTING DATE
           RAINSW = "numeric", #---------- par
           
           #IRRIGATION
           BUNDHT = "numeric", #---------- par           #== water in excess height
           IRSWCH = "numeric", #---------- par
           #IRRAMT = "numeric", #---------- par
           SWCWAT = "numeric", #---------- par
           XT1   = "numeric", #----------- parameter
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
          SOW6   = 0,
          
          #SEED RATE
          SEEDRT = 100,
          
          #GERMINATION
          SOWFXD = 319,
          
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
          XT1 = 1,
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