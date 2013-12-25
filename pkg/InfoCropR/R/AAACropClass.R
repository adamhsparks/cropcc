setClass(Class="CropClass",
         
         representation = representation(
           
           Name = "character",
           
           #VARIETY
           DAYSEN = "numeric", #daylength sensitivity
           #FWCANE = "numeric", #a variety-specific factor to convert the stem weight to economic yield
           GNOCF  = "numeric",
           KDFMAX = "numeric", #extinction coefficient of leaves at flowering stage
           NMAXGR = "numeric",
           POTGWT = "numeric", #potential weight
           RGRPOT = "numeric", #USER -SPECIFIED INPUT
           RUEMAX = "numeric", #radiation use efficiency
           SLAVAR = "numeric", #cultivar-specific leaf area
           TGBD   = "numeric", #base temperature from anthesis to maturity
           TGMBD  = "numeric", #base temperature for sowing to seedling emergence
           TPMAXD = "numeric", #maximum temperature (also TMAX in text?)
           TPOPT  = "numeric", #optimal temperature (also TOPT in text?)
           TTGERM = "numeric", #thermal time for sowing to seedling emergence
           TTGF   = "numeric", #thermal time from anthesis to maturity
           TTVG   = "numeric", #thermal heat units for emergence to anthesis, OR, thermal time to anthesis
           TVBD   = "numeric", #base temperature for emergence to anthesis (TBASE in text?)
           VARFLD = "numeric", #varietal sensitivity to flooding
           VARNFX = "numeric", #variety coefficient for N fixation capability
           VRSTMN = "numeric", #sensistivity to low temperature of storage organs
           VRSTMX = "numeric", #sensitivity to high temperature of storage organs
           ZRTPOT = "numeric", #root extension growth rate
                      
           #PHENOLOGY
           DLSTG1 = "numeric", #A photosensitive period within development stage
           DLSTG2 = "numeric", #A photosensitive period within development stage         
           
           #SOURCE-SINK BALANCE
           DSGFIL = "numeric", #crop-specific development stage
           
           GNSTG1 = "numeric",
           GNSTG2 = "numeric",
           
           GNOMAX = "numeric",
           TPRGFR = "numeric",
           STWARM = "numeric",
           STCOOL = "numeric",
           SHELLP = "numeric",           #== shelling percentage
           MOISTC = "numeric",           #== moisture content of the storage organs
           ENERGY = "numeric",           #== energy content of storage organs
           
           DSSTR1 = "numeric",           #== short period starting shortly before anthesis
           DSSTR2 = "numeric",           #== few days after anthesis
           
           GNSTCR = "numeric",
           GFRVAR = "numeric",
           
           #LEAF AREA AND OTHER GREEN AREA DEVELOPMENT
           FRLVWT = "numeric", #== Fraction of seeds that is in leaves at the seedling emergence stage
           DSMAXL = "numeric", #== maximum leaf lamina area index at a predetermined crop-specific stage
           NMOBIF = "numeric",
           
           #NITROGEN
           MAXNUP = "numeric",           #== pre-determined maximum rate of N-uptake
           GREENF = "numeric",           #== a variety-specific adjustment factor for N-concentration in leaves
           COSNFX = "numeric",           #== energy cost of nitrogen fixation
           RFNLV  = "numeric",           #== leaves residual N-content of senescence plants
           RFNST  = "numeric",           #== stem residual N-content of senescence plants
           RFNRT  = "numeric",           #== root residual N-content of senescence plants
           NUPTDS = "numeric",           #== crop-specific development stage for not N uptake
           CRPNFX = "numeric",           #== crop coefficient for N fixation         
           
           #WATER RELATIONS
           CROPFC = "numeric",
           #CROPFC =1. FOR RICE, 0.8 FOR OTHERS
           CROPGR = "numeric",
           #CROPGR IS CROP DEPENDENT, 1 FOR LEAFY VEGETABLES 1.5 FOR ONION, CABBAGE
           #2 FOR TOBBACO, 2.5 FOR PEPPER, 3 FOR GRAPE, PEA, POTATO
           #3.5 FOR BEAN, SUNFLOWER, TOMATO, 4 FOR CITRUS, 6 FOR GROUNDNUT,
           #7.5 FOR COTTON,CASSAVA,9 FOR GRAINS,SAFFLOWER,SORGHUM,SOYBEAN,SUGARCANE
           
           #ROOT
           ZRTI   = "numeric",           #== initial value of rooting depth at seedling emergence
           ZRTMS  = "numeric",
           ZRTDS  = "numeric",           #== pre-defined stage for root extension stop
           
           #FROST DAMAGE
           FROSSN      = "numeric",           #== crop-specific minimum temperature
           
           #CROP DAMAGE DUE TO DISEASES
           RUSTST  = "numeric",
           
           #FLOODING SENSITIVITY
           FLDCRP = "numeric",           #== crop tolerance
           
           
           #GENERAL AND SIMULATION CONTROLS
           STDSRT = "numeric",
           SHCKD  = "numeric",
           RICE   = "numeric",
           NPLSB  = "numeric",
           MUSTRD = "numeric",
           POTATO = "numeric",
           LEGUME = "numeric",
           NHRICE = "numeric"         #NH4 uptake capability (e.g. rice)
           #NHRICE=0.1 FOR UPLAND CROPS, 1 FOR RICE                 
           
           ),
         
         prototype = prototype(
            
           Name = "Wheat",
           
           #VARIETY
           VARFLD = 1,
           VRSTMX = 1,
           VRSTMN = 1,
           VARNFX = 1,
           TGMBD  = 3.6,
           TVBD   = 4.5,
           TGBD   = 7.5,
           TPOPT  = 25,
           TPMAXD = 40,
           TTGERM = 70,
           TTGF   = 393,
           TTVG   = 850,
           RGRPOT = 0.005,
           SLAVAR = 0.0022,
           RUEMAX = 2.4,
           KDFMAX = 0.6,
           GNOCF  = 30000,
           POTGWT = 42,
           ZRTPOT = 20,
           NMAXGR = 0.02,
           #FWCANE = 1,
           DAYSEN = 1,
           
           #PHENOLOGY
           DLSTG1 = 0.35,
           DLSTG2 = 0.65,
           
           #SOURCE-SINK BALANCE
           DSGFIL = 1.06,
           GNSTG1 = 0.65,
           GNSTG2 = 1,
           GNOMAX = 250000000,
           TPRGFR = 16,
           STWARM = 32,
           STCOOL = 2,
           SHELLP = 100,  #harvest shelling percentage
           MOISTC = 0.88, #moisture correction (1 - moisture)
           ENERGY = 1,
           DSSTR1 = 0.95,
           DSSTR2 = 1.05,
           GNSTCR = 1.35,
           GFRVAR = 2,
           
           #LEAF AREA AND OTHER GREEN AREA DEVELOPMENT
           FRLVWT = 0.25,
           DSMAXL = 0.95,
           NMOBIF = 1,
           
           #NITROGEN
           MAXNUP = 8,
           GREENF = 1,
           COSNFX = 0.01,
           RFNLV = 0.007, 
           RFNST = 0.003,
           RFNRT = 0.004,
           NUPTDS = 1.05,
           CRPNFX = 1,           
           
           #WATER RELATIONS
           CROPFC = 0.82,  #CROPFC =1. FOR RICE, 0.8 FOR OTHERS
           CROPGR = 9.0,   #CROPGR IS CROP DEPENDENT:
                           #    1   FOR LEAFY VEGETABLES, 
                           #    1.5 FOR ONION, CABBAGE,
                           #    2   FOR TOBBACO, 
                           #    2.5 FOR PEPPER, 
                           #    3   FOR GRAPE, PEA, POTATO,
                           #    3.5 FOR BEAN, SUNFLOWER, TOMATO, 
                           #    4   FOR CITRUS, 
                           #    6   FOR GROUNDNUT,
                           #    7.5 FOR COTTON, CASSAVA, 
                           #    9 FOR GRAINS, SAFFLOWER, SORGHUM, SOYBEAN, SUGARCANE
           
           #ROOT
           ZRTI = 100,
           ZRTMS = 2000,
           ZRTDS = 1,
           
           #FROST DAMAGE
           FROSSN = 0,
           
           #CROP DAMAGE DUE TO DISEASES
           RUSTST   = 0,
           
           #FLOODING SENSITIVITY
           FLDCRP = 1,
           
           #GENERAL AND SIMULATION CONTROLS
           STDSRT = 100,
           SHCKD = 0.3,
           RICE = 0,
           NPLSB = 1000,
           MUSTRD = 0,
           POTATO = -1,
           LEGUME = 0,
           NHRICE = 0.1
           #NHRICE=0.1 FOR UPLAND CROPS, 1 FOR RICE                    

         ),
         
         validity = function(object)
         {
           return(TRUE)
         }

)