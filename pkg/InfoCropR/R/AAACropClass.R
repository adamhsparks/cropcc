setClass(Class="Crop",
         representation = representation(
           
           Name = "character",
           
           #VARIETY
           VARFLD = "numeric", #sensitivity to flooding
           VRSTMX = "numeric", #sensitivity to high temperature of storage organs
           VRSTMN = "numeric", #sensistivity to low temperature of storage organs
           VARNFX = "numeric", #N fixation capability
           TGMBD = "numeric", #base temperature for sowing to emergence
           TVBD = "numeric",  #base temperature for emergence to anthesis (TBASE in text?)
           TGBD = "numeric",  #base temperature from anthesis to maturity
           TPOPT = "numeric", #optimal temperature (also TOPT in text?)
           TPMAXD = "numeric", #maximum temperature (also TMAX in text?)
           TTGERM = "numeric", #thermal time for sowing to emergence
           TTGF = "numeric", #thermal time from anthesis to maturity
           TTVG = "numeric", #thermal heat units for emergence to anthesis
           RGRPOT = "numeric",
           SLAVAR = "numeric", #specific leaf area
           RUEMAX = "numeric", #radiation use efficiency
           KDFMAX = "numeric", #extinction coefficient of leaves at flowering stage
           GNOCF = "numeric",
           POTGWT = "numeric",
           ZRTPOT = "numeric", #root extension growth rate
           NMAXGR = "numeric",
           DAYSEN = "numeric", #daylength sensitivity

           #PHENOLOGY
           TTGMEX = "function",
           DLSTG1 = "numeric",
           DLSTG2 = "numeric",
           DAYCF = "function", #photoperiod correction factor
           NDRWT = "function",
           DRWT = "function",
                        
           #SOURCE-SINK BALANCE
           DSGFIL = "numeric",
           GNSTG1 = "numeric",
           GNSTG2 = "numeric",
           GNOMAX = "numeric",
           TPRGFR = "numeric",
           STWARM = "numeric",
           STCOOL = "numeric",
           STHIGH = "function",
           STLOW = "function",
           SHELLP = "numeric",
           MOISTC = "numeric",
           ENERGY = "numeric",
           DSSTR1 = "numeric",
           DSSTR2 = "numeric",
           GNSTCR = "numeric",
           GFRVAR = "numeric",
           
           #LEAF AREA AND OTHER GREEN AREA DEVELOPMENT
           FRLVWT = "numeric",
           DSMAXL = "numeric",
           RDRT = "function",
           RDRTP = "function",
           SENWAT = "function",
           SLACF = "function", #relative growth rate of leaf area
           LAIFAC = "function",
           SNLVGA = "function",
           DSATMP = "function",
           NMOBIF = "numeric",
           
           #NITROGEN
           MAXNUP = "numeric",
           GREENF = "numeric", #??? adjustment factor for N-concentration in leaves
           COSNFX = "numeric",
           NMAXLT = "function",
           RFNLV = "numeric",
           RFNST = "numeric",
           RFNRT = "numeric",
           NUPTDS = "numeric",
           CRPNFX = "numeric",
           NFXWAT = "function",
           
           #PHOTOSYNTHESIS
           KDFDS = "function",
           RCFDS = "function",
           RCFLN = "function",
           RCFTP = "function",
           RCFCO2 = "function",
           
           #PARTITIONING
           LLVN = "function",
           LLVST = "function",
           FSTRT = "function",
           FLVTB = "function",
           FSTTB = "function",
           FRTTB = "function",
           
           #WATER RELATIONS
           CROPFC = "numeric",
           #CROPFC =1. FOR RICE, 0.8 FOR OTHERS
           CROPGR = "numeric",
           #CROPGR IS CROP DEPENDENT, 1 FOR LEAFY VEGETABLES 1.5 FOR ONION, CABBAGE
           #2 FOR TOBBACO, 2.5 FOR PEPPER, 3 FOR GRAPE, PEA, POTATO
           #3.5 FOR BEAN, SUNFLOWER, TOMATO, 4 FOR CITRUS, 6 FOR GROUNDNUT,
           #7.5 FOR COTTON,CASSAVA,9 FOR GRAINS,SAFFLOWER,SORGHUM,SOYBEAN,SUGARCANE
           
           #ROOT
           ZRTI = "numeric",
           ZRTMS = "numeric",
           EDPTFT = "function",
           RTMAX = "function",
           ZRTDS = "numeric",
           
           #FROST DAMAGE
           FROSTD = "function",
           FRSTDS = "function",
           FINISHFROST = "numeric",
           FROSSN = "numeric",
           
           #FLOODING SENSITIVITY
           FLDFAC = "function",
           FLODDS = "function",
           FLDCRP = "numeric",
           
           #GENERAL AND SIMULATION CONTROLS
           STDSRT = "numeric",
           SHCKD = "numeric",
           RICE = "numeric",
           NPLSB = "numeric",
           MUSTRD = "numeric",
           POTATO = "numeric",
           LEGUME = "numeric",
           NHRICE = "numeric", #NH4 uptake capability (e.g. rice)
           #NHRICE=0.1 FOR UPLAND CROPS, 1 FOR RICE
           FINISHDS = "numeric",
           FINISHSINKLT = "numeric",
           SWCPOT = "numeric",
           FWCANE = "numeric",
           DSI = "numeric",
           ZERO = "numeric",
           INPOND = "numeric",
           FCSDEP = "function"
           ),
         prototype = prototype(
           Name = "Wheat",
           
           #VARIETY
           VARFLD = 1,
           VRSTMX = 1,
           VRSTMN = 1,
           VARNFX = 1,
           TGMBD = 3.6,
           TVBD = 4.5,
           TGBD = 7.5,
           TPOPT = 25,
           TPMAXD = 40,
           TTGERM = 70,
           TTGF = 393,
           TTVG = 850,
           RGRPOT = 0.005,
           SLAVAR = 0.0022,
           RUEMAX = 2.4,
           KDFMAX = 0.6,
           GNOCF = 30000,
           POTGWT = 42,
           ZRTPOT = 20,
           NMAXGR = 0.02,
           DAYSEN = 1,
           
           #PHENOLOGY
           TTGMEX = approxfun(c(0,10,15,16,100),c(1.2,1,.9,50,1000)),
           DLSTG1 = 0.35,
           DLSTG2 = 0.65,
           DAYCF = approxfun(c(10,11,12,13,14,16,17), c(.6,.75,1,1,1.1,1.14,1.18)),
           NDRWT = approxfun(c(0, 0.2, 0.3, 0.4, 0.5, 0.85, 2), 
                             c(2.0, 1.5, 1.3, 1.35, 1.3, 1, 1)),
           DRWT = approxfun(c(0, 0.2, 0.3, 0.4, 0.5, 0.85, 2), 
                            c(2.0, 1.5, 1.4, 1.35, 1.3, 1, 1)),
           
           #SOURCE-SINK BALANCE
           DSGFIL = 1.06,
           GNSTG1 = 0.65,
           GNSTG2 = 1,
           GNOMAX = 250000000,
           TPRGFR = 16,
           STWARM = 32,
           STCOOL = 2,
           STHIGH = approxfun(c(0, 2, 4, 6, 8), c(0, 0.04, 0.1, 0.3, 0)),
           STLOW  = approxfun(c(0, 2, 4, 6, 8), c(0, 0.04, 0.1, 0.3, 0)),
           SHELLP = 100, #harvest shelling percentage
           MOISTC = 0.88, #moisture correction (1 - moisture)
           ENERGY = 1,
           DSSTR1 = 0.95,
           DSSTR2 = 1.05,
           GNSTCR = 1.35,
           GFRVAR = 2,
           
           #LEAF AREA AND OTHER GREEN AREA DEVELOPMENT
           FRLVWT = 0.25,
           DSMAXL = 0.95,
           RDRT = approxfun(c(0, 0.5, 0.55, 0.85, 1, 1.5, 2.05), 
                            c(0, 0, 0.003, 0.008, 0.01, 0.01, 0.01)),
           RDRTP = approxfun(c(0, 20, 25, 30, 40), c(0, 0, 1.5, 3, 4)),
           SENWAT = approxfun(c(0, 0.5, 0.9, 1, 2), c(3, 1.6, 0, 0, 0)),
           SLACF = approxfun(c(0, 0.55, 1, 2.1), c(1.3, 1.2, 1, 1)),
           LAIFAC = approxfun(c(0, 0.6, 1.1, 2.5), c(0, 0, 0.5, 0.5)),
           SNLVGA = approxfun(c(0, 1, 1.6, 1.8, 2.2), c(0, 0, 0, 0.2, 1)) ,
           DSATMP = approxfun(c(0, 15, 25, 30, 40, 50), c(2.5, 1, 1, 1, 2, 5)),
           NMOBIF = 1,
           
           #NITROGEN
           MAXNUP = 8,
           GREENF = 1,
           COSNFX = 0.01,
           NMAXLT = approxfun(c(0, 0.62, 0.78, 1, 1.15, 1.5, 1.75, 2.2), 
                              c(0.06, 0.04, 0.385, 0.035, 0.035, 0.0285, 0.0195, 0.015)),
           RFNLV = 0.007, 
           RFNST = 0.003,
           RFNRT = 0.004,
           NUPTDS = 1.05,
           CRPNFX = 1,
           NFXWAT = approxfun(c(0, 0.5, 0.8, 1, 1.1, 2.1, 10), c(0, 0.6, 0.95, 1, 1, 0, 0)),
           
           #PHOTOSYNTHESIS
           KDFDS = approxfun(c(0,0.55, 1,2.1), c(0.7,1,1,1)),
           RCFDS = approxfun(c(0, 1, 2.1), c(1, 1, 0.95)),
           RCFLN = approxfun(c(0, 0.5, 1, 2), c(0, 0.5, 1, 1)),
           RCFTP = approxfun(c(0, 10, 15, 20, 25, 30, 35, 50), 
                             c(1, 1, 1, 1, 1, 0.9, 0.7, 0)),
           RCFCO2 = approxfun(c(300, 350, 450, 550, 700, 1000), 
                              c(1, 1, 1.1, 1.15, 1.25, 1.3)), 
           
           #PARTITIONING
           LLVN = approxfun(c(0, 0.5, 0.85, 1, 2), c(1.4, 1.5, 1, 1, 1)),
           LLVST = approxfun(c(0, 0.5, 0.85, 1, 2), c(1.4, 1.5, 1, 1, 1)),
           FSTRT = approxfun(c(0, 0.35, 0.6, 0.8, 0.9, 1, 1.1, 2.1), 
                             c(0.025, 0.025, 0.08, 0.12, 0.34, 0.4, 0, 0)),
           FLVTB = approxfun(c(0, 0.1, 0.26, 0.48, 0.63, 0.78, 0.95, 1, 2.1), 
                             c(1, 0.96, 0.74, 0.58, 0.36, 0.23, 0.1, 0, 0)),
           FSTTB = approxfun(c(0, 0.1, 0.26, 0.48, 0.63, 0.78, 0.95, 1, 1.1, 1.2, 2.1),
                             c(0, 0.04, 0.26, 0.42, 0.64, 0.77, 0.9, 1, 0.04, 0, 0)),
           FRTTB = approxfun(c(0, 0.1, 0.26, 0.48, 0.63, 0.78, 0.95, 1, 2.1),
                             c(0.5, 0.48, 0.33, 0.23, 0.13, 0.05, 0.02, 0, 0)),
           
           #WATER RELATIONS
           CROPFC = 0.82,
           #CROPFC =1. FOR RICE, 0.8 FOR OTHERS
           CROPGR = 9.0,
           #CROPGR IS CROP DEPENDENT, 1 FOR LEAFY VEGETABLES, 1.5 FOR ONION,CABBAGE
           #2 FOR TOBBACO, 2.5 FOR PEPPER, 3 FOR GRAPE, PEA, POTATO
           #3.5 FOR BEAN, SUNFLOWER, TOMATO, 4 FOR CITRUS, 6 FOR GROUNDNUT,
           #7.5 FOR COTTON, CASSAVA, 9 FOR GRAINS,SAFFLOWER,SORGHUM,SOYBEAN,SUGARCANE
           
           #ROOT
           ZRTI = 100,
           ZRTMS = 2000,
           EDPTFT  = approxfun(c(-50, -0.05, 0, 0.15, 0.3, 0.5, 1000.1), 
                               c(0, 0, 0.15, 0.6, 0.8, 1, 1)),
           RTMAX = approxfun(c(500, 700, 800, 1000, 1200), 
                             c(1000, 1200, 1600, 1800, 2000)),
           ZRTDS = 1,
           
           #FROST DAMAGE
           FROSTD = approxfun(c(0, 1, 2, 3, 5, 10, 20),
                             c(0, 0, 0.2, 0.3, 0.5, 1, 1)),
           FRSTDS = approxfun(c(0, 0.7, 0.8, 0.9, 1.2, 2, 2.5), 
                              c(0.7, 0.8, 1, 1.25, 1.3, 0, 0)),
           FINISHFROST = 7,
           FROSSN = 0,
           
           #FLOODING SENSITIVITY
           FLDFAC = approxfun(c(0, 3, 5, 10, 15, 50, 100),
                              c(1, 1, 0.9, 0.85, 0.65, 0, 0)),
           FLODDS = approxfun(c(0, 0.5, 1, 2, 2.1), 
                              c(0.85, 0.9, 1, 1, 1)),
           FLDCRP = 1,
           
           #GENERAL AND SIMULATION CONTROLS
           STDSRT = 100,
           SHCKD = 0.3,
           RICE = 0,
           NPLSB = 1000,
           MUSTRD = 0,
           POTATO = -1,
           LEGUME = 0,
           NHRICE = 0.1,
           #NHRICE=0.1 FOR UPLAND CROPS, 1 FOR RICE
           FINISHDS = 2.01,
           FINISHSINKLT = 0,
           SWCPOT = 0,
           FWCANE = 1,
           DSI = 0,
           ZERO = 0, 
           INPOND = 0.0,
           FCSDEP = approxfun(c(0, 20, 60, 90, 100, 110),c(0, 1, 1, 0.75, 0.4, 0))
         ),
         validity = function(object)
         {
           return(TRUE)
         }

)
