# tabFunction [--] = tables 
#-------------
setClass(Class="tabularFunctionsClass",
         
         representation = representation(
                           
               CNMODF = "numeric",             #== correction factor for soil nitrogen
               COFST  = "numeric",
               CRAINP = "numeric",
               CTMAXP = "numeric",
               CTMINP = "numeric",
               CUTIND = "numeric",           #== (Chickpea), (insects: Cutworm), (SR)
                                             #== (Potato), (insects: Cutworm/ white grub), (SR)
               
               DAMIND = "numeric",           #== (Cotton), (diseases: Root rot), (SR)
                                             #== (Groundnut), (diseases: Bacterial wilt), (SR)
                                             #== (Maize), (diseases: Charcoal rot), (SR)
                                             #== (Chickpea), (diseases: collar rot), (SR)
                                             #== (Pigeonpea), (diseases: Wilt), (SR)
                                             #== (Sugarcane), (diseases: Red rot/ Smut/ Wilt), (SR)
                                             #== (Soybean), (diseases: Seedling rot), (SR)
               
               DAYCF  = "numeric",  #photoperiod correction factor
               DRSTRL = "numeric",
               DRWT   = "numeric",
               DSATMP = "numeric",             #== temperature acelerator of DSAI
               EARCUT = "numeric",           #== loss in storage organs due to ear cutting caterpillar, OR, (Rice), (insects: Gundhi bug/ earcutting caterpillar), (ARR, TC) 
                                                                                                        #== (Wheat), (diseases: Loose smut), (ARR, TC) 
                                                                                                        #== (Cotton), (insects: Bollworms), (ARR, TC) 
                                                                                                        #== (Cotton), (diseases: Anthracnose), (ARR, TC)
                                                                                                        #== (Maize), (insects: Cob borer), (LS, TC)     #FJAV: ???
                                                                                                        #== (Maize), (diseases: Head smut), (ARR, TC)
                                                                                                        #== (Sorghum), (insects: Sorghum midge/ webworm), (ARR, TC)
                                                                                                        #== (Sorghum), (diseases: Loose smut/ head smut), (ARR, TC)
                                                                                                        #== (Pearl millet), (insects: Sorghum midge), (ARR, TC)
                                                                                                        #== (Pearl millet), (diseases: Green earbug/ ergot), (ARR, TC)
                                                                                                        #== (Chickpea), (insects: Pod borer), (ARR, TC)
                                                                                                        #== (Pigeonpea), (insects: Pod borers/ pod fly), (ARR, TC)
                                                                                                        #== (Potato), (insects: Potato ruber moth), (ARR, TC)
                                                                                                        #== (Potato), (diseases: Brown rot/ scab), (ARR, TC)
               
               EBULTN = "numeric",
               EDPTFT = "numeric",
               EESTAB = "numeric",
               EHFAC  = "numeric",
               EZRTTB = "numeric",
               FCSDEP = "numeric",             #== funtion to reducing the weight of seedlings at emergence
               FLDFAC = "numeric",
               FLODDS = "numeric",           #== crop stage of development
               FLVTB  = "numeric",
               FROSTD = "numeric",
               FRSTDS = "numeric",
               FRTTB  = "numeric",
               FSTRT  = "numeric",             #== crop and development stage-specific partitioning coefficients
               FSTTB  = "numeric",
               IRRTL1 = "numeric",
               IRRTL2 = "numeric",
               IRRTL3 = "numeric",
               IRRTSF = "numeric",
               KDFDS  = "numeric",           #== sensitivity to the age of the plant in KDF
               LAIFAC = "numeric",           #== crop-specific of the maximum leaf lamina area index
               LLVN   = "numeric",           #== partitioning to N stress
               LLVST  = "numeric",           #== partitioning to water stress
               LVFOLD = "numeric",           #== per cent incidence of leaf folder, OR, (Rice), (insects: Leaffolder/hispa), (ARR, TC) 
                                                                                    #== (Cotton), (insects: Leaf roller), (ARR, TC)
                                                                                    #== (Groundnut), (insects: Leafminer), (ARR, TC)
               MBTAB  = "numeric",
               MTAB   = "numeric",
               MTABD  = "numeric",
               MTABEH = "numeric",
               NDRWT  = "numeric",
               NFXWAT = "numeric",           #== effect of water in N fixation
               NH4AP1 = "numeric",
               NH4AP2 = "numeric",
               NH4AP3 = "numeric",
               NMAXLT = "numeric",
               NOAP1  = "numeric",
               NOAP2  = "numeric",
               NOAP3  = "numeric",
               NODEBR = "numeric",           #== (Wheat), (diseases: Black rust), (TC)
                                             #== (Pigeonpea), (diseases: Canker), (TC)
                                             #== (Sugarcane), (insects: Internode borer), (TC)
               
               OM1DAT = "numeric",
               OM2DAT = "numeric",
               OM3DAT = "numeric",
               PDCOEF = "numeric",           #== correcction to adjust bulk density and hydraulic conductivity of the soil
               PHTAB  = "numeric",
               PHTABV = "numeric",
               PPLFBD = "numeric",           #== total number of beetles per hectare per day, OR, (Groundnut), (insects: Red hairy caterpillar), (TC)
                                                                                              #== (Maize), (insects: Weevil), (TC)
                                                                                              #== (Pearl millet), (insects: Grey weevil), (TC)
                                                                                              #== (Potato), (insects: Defoliating beetles), (TC)
                                                                                              #== (Soybean), (insects: Leaf feeding caterpillars), (TC)
                                                                                              #== (Rape-seed mustard), (insects: Flea beetle/ saw fly), (TC)
                                                                                              #== (Rape-seed mustard), (insects: cabbage-worm), (TC)
               
               PPLFGD = "numeric",           #== total number of grasshoppers per hectare per day
               PPOSKD = "numeric",           #== (Rice), (insects: Brown plant-hopper, White-backed planthopper), (LS, AS) 
                                             #== (Wheat), (insects: Aphids), (LS, AS) 
                                             #== (Cotton), (insects: Jassids/ aphids/ whitefly), (LS, AS)
                                             #== (Groundnut), (insects: Aphids), (LS, AS)
                                             #== (Maize), (insects: Aphids), (LS, AS)
                                             #== (Sorghum), (insects: Earhead bug), (LS, AS)
                                             #== (Chickpea), (insects: Aphids/ leafhopper), (LS, AS)
                                             #== (Pigeonpea), (insects: Aphids/ leafhopper/ whitefly), (SR, ARR)   #FJAV: ????
                                             #== (Sugarcane), (insects: Pyrilla/ mealy bug/ scale insect/ white fly), (LS, AS)
                                             #== (Potato), (insects: Aphids/ leafhopper), (SR, ARR)   #FJAV: ????
                                             #== (Soybean), (insects: Jassids/ white fly), (LS, AS)
                                             #== (Rape-seed mustard), (insects: Aphids), (LS, AS)
               
               RCFCO2 = "numeric",           #== a crop-specific input for simulated effect of increase of CO2 in C3 plants
               RCFDS  = "numeric",           #== change in plant chemical composition with age
               RCFLN  = "numeric",           #== dependent on nitrogen- deficiency in the crop
               RCFTP  = "numeric",           #== crop-specific decrease in photosynthesis effect by temperature
               RDRT   = "numeric",
               RDRTP  = "numeric",           #== crop-specific change in senescence rate due to temperature
               RNSOIL = "numeric",
               RTMAX  = "numeric",
               SBINFD = "numeric",           #== (Rice), (insects: Stem borer, Gall midge), (SR) 
                                             #== (Wheat), (insects: Stem borer/ shoot fly), (SR) 
                                             #== (Cotton), (insects: Stem weevil), (SR)
                                             #== (Groundnut), (insects: Stem borer), (SR)
                                             #== (Maize), (insects: Stem borer/ shootfly/ cutworms), (SR)
                                             #== (Sorghum), (insects: Shootfly/ stem borer), (SR)
                                             #== (Pearl millet), (insects: Stem borer/ shoot fly), (SR)
                                             #== (Sugarcane), (insects: Shoot borer/ root borer), (SR)
                                             #== (Soybean), (insects: Stem fly/ white grub), (SR)
               
               SENWAT = "numeric",           #== crop-specific change in senescence rate due to water stress
               SEVLT  = "numeric",           #== (Rice), (diseases: Brown spot/ blast, Bacterial leaf blight/ sheath blight), (LS, ARR, TC) 
                                             #== (Wheat), (diseases: Foliar blight), (LS, AS, TC) 
                                             #== (Cotton), (diseases: Bacterial blight), (LS, AS, TC) 
                                             #== (Cotton), (diseases: Verticillium), (LS, AS, TC)
                                             #== (Groundnut), (diseases: Tikka disease), (LS, AS, TC)
                                             #== (Maize), (diseases: Brown spot), (LS, ARR, TC)
                                             #== (Pearl millet), (diseases: Leaf spot), (LS, ARR, TC)
                                             #== (Chickpea), (diseases: Ascochyta), (LS, ARR, TC)
                                             #== (Pigeonpea), (diseases: Leaf spot Powdery), (LS, ARR, TC)
                                             #== (Potato), (diseases: Early blight/ late blight), (SR, LS, ARR)
                                             #== (Soybean), (diseases: Rhizoctonia blight), (LS, ARR, TC)
                                             #== (Rape-seed mustard), (diseases: Alternaria leaf spot), (ARR, AS, TR)
               
               SEVR   = "numeric",           #== (Wheat), (diseases: Brown rust), () 
                                             #==          (diseases: yellow rust), (LS, ARR, TC)
                                             #== (Groundnut), (diseases: Rust), (LS, AS, TC)
                                             #== (Pearl millet), (diseases: Rust), (LS, ARR, TC)
                                             #== (Rape-seed mustard), (diseases: White rust), (ARR, AS, TR)
               
               SEVRPT = "numeric",
               SEVRPM = "numeric",
               SLACF  = "numeric",           #== relative growth rate of leaf area (aj indicator of early vigour)
               SNLVGA = "numeric",           #== senecence rate ¿OR? development stage
               SOILAB = "numeric",
               STHIGH = "numeric",
               STLOW  = "numeric",
               TERIND = "numeric",           #== (Wheat), (insects: Termites), (SR)
                                             #== (Groundnut), (insects: Termites/ white grub), (SR)
                                             #== (Sugarcane), (insects: Termites/ white grubs), (SR)
               
               TMPTAB = "numeric",
               TMPTBV = "numeric",
               TTGMEX = "numeric",
               UREAP1 = "numeric",
               UREAP2 = "numeric",
               UREAP3 = "numeric",
               WEED   = "numeric"            #== (Rice), (weeds: Weeds), (LS)
               #==================================================================
               #Damage mechanisms
               # GR: germination reducer
               # SR: stand remover
               # LS: light stealer
               # ARR: assimilation rate reducer
               # AS: assimilate sapper
               # TC: tissue consumer
               # TR: turgour reducer
               #==================================================================
         ),
         
         prototype = prototype(   # c(x1,y1, x2,y2, x3,y3, ..., xn,yn)
            
            CNMODF = c(0,0.5, 5,1, 100000,1),
            COFST  = c(0,1, 300,1, 400,1, 700,1.2, 1000,1.3),
            CRAINP = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            CTMAXP = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            CTMINP = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            CUTIND = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            DAMIND = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            DAYCF  = c(10,0.6, 11,0.75, 12,1, 13,1, 14,1.1, 16,1.14, 17,1.18),
            DRSTRL = c(0,0.1, 0.5,0, 1,0),
            DRWT   = c(0,2, 0.2,1.5, 0.3,1.4, 0.4,1.35, 0.5,1.3, 0.85,1, 2,1),
            DSATMP = c(0,2.5, 15,1, 25,1, 30,1, 40,2, 50,5),
            EARCUT = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            EBULTN = c(-10,0, 0,1, 10,0.4, 20,0.3, 30,0.2, 50,0.1, 100,0, 5000,0),
            EDPTFT = c(-50,0, -0.05,0, 0,0.15, 0.15,0.6, 0.3,0.8, 0.5,1, 1000.1,1),
            EESTAB = c(0,0.004, 20,0.004, 30,0.0035, 40,0.003, 50,0.0025, 60,0.002, 80,0.0015, 100,0.0015),
            EHFAC  = c(-400,1, -220,1, -150,0.9, -100,0.65, -50,0.4, 0,0.1, 50,0, 5000,0),
            EZRTTB = c(0,0.67, 1,0.67, 1.5,0.9, 1.7,1, 2,1),
            FCSDEP = c(0,0, 20,1, 60,1, 90,0.75, 100,0.4, 110,0),
            FLDFAC = c(0,1, 3,1, 5,0.90, 10,0.85, 15,0.65, 50,0, 100,0),
            FLODDS = c(0,0.85, 0.5,0.9, 1,1, 2,1, 2.1,1),   #FJAV: Sobra el penúltimo
            FLVTB  = c(0,1, 0.1,0.96, 0.26,0.74, 0.48,0.58, 0.63,0.36, 0.78,0.23, 0.95,0.1, 1,0, 2.1,0),
            FROSTD = c(0,0, 1,0, 2,0.2, 3,0.3, 5,0.5, 10,1, 20,1),
            FRSTDS = c(0,0.7, 0.7,0.8, 0.8,1, 0.9,1.25, 1.2,1.3, 2,0, 2.5,0),
            FRTTB  = c(0,0.5, 0.1,0.48, 0.26,0.33, 0.48,0.23, 0.63,0.13, 0.78,0.05, 0.95,0.02, 1,0, 2.1,0),
            FSTRT  = c(0,0.025, 0.35,0.025, 0.6,0.08, 0.8,0.12, 0.9,0.34, 1,0.4, 1.1,0, 2.1,0),
            FSTTB  = c(0,0, 0.1,0.04, 0.26,0.26, 0.48,0.42, 0.63,0.64, 0.78,0.77, 0.95,0.9, 1,1, 1.1,0.04, 1.2,0, 2.1,0),
            IRRTL1 = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            IRRTL2 = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            IRRTL3 = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            IRRTSF = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            KDFDS  = c(0,0.7, 0.55,1, 1,1, 2.1,1),
            LAIFAC = c(0,0, 0.6,0, 1.1,0.5, 2.5,0.5),
            LLVN   = c(0,1.4, 0.5,1.5, 0.85,1, 1,1, 2,1),
            LLVST  = c(0,1.4, 0.5,1.5, 0.85,1, 1,1, 2,1),
            LVFOLD = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            MBTAB  = c(5,0.2, 15,0.3, 25,0.7, 35,0.9, 70,1, 200,1, 500,1),
            MTAB   = c(0,0, 0.1,0, 0.4,0.7, 0.8,1, 1,1, 2,0.6, 2.5,0.2, 4,0, 500,0),
            MTABD  = c(0,0, 0.3,0, 0.7,0.1, 1,0.2, 2,0.8, 2.2,1, 500,1),
            MTABEH = c(0,300, 2,150, 4,50, 9,-160, 16,-220, 23,-280, 30,-285, 44,-287, 58,-287, 65,-300, 500,-300),
            NDRWT  = c(0,2, 0.2,1.5, 0.3,1.3, 0.4,1.35, 0.5,1.3, 0.85,1, 2,1),
            NFXWAT = c(0,0, 0.5,0.6, 0.8,0.95, 1,1, 1.1,1, 2.1,0, 10,0),
            NH4AP1 = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            NH4AP2 = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            NH4AP3 = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            NMAXLT = c(0,0.06, 0.62,0.04, 0.78,0.0385, 1,0.035, 1.15,0.035, 1.5,0.0285, 1.75,0.0195, 2.2,0.015),
            NOAP1  = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            NOAP2  = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            NOAP3  = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            NODEBR = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            OM1DAT = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            OM2DAT = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            OM3DAT = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            PDCOEF = c(0,0.8, 20,0.2, 30,0.2, 65,0.4, 80,0.8, 100,1),
            PHTAB  = c(0,0, 4,0.4, 5,0.7, 6,0.9, 7,1, 8.5,0.9, 9,0.7, 10,0.5, 14,0),
            PHTABV = c(5,0.1, 6.5,0.4, 7,0.8, 7.5,1, 8,1.2, 9,1.5, 10,2),
            PPLFBD = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            PPLFGD = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            PPOSKD = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            RCFCO2 = c(300,1, 350,1, 450,1.1, 550,1.15, 700,1.25, 1000,1.3),
            RCFDS  = c(0,1, 1,1, 2.1,0.95),
            RCFLN  = c(0,0, 0.5,0.5, 1,1, 2,1),
            RCFTP  = c(0,1, 10,1, 15,1, 20,1, 25,1, 30,0.9, 35,0.7, 50,0),  #FJAV: Sobran points 2 a 4
            RDRT   = c(0,0, 0.5,0, 0.55,0.003, 0.85,0.008, 1,0.01, 1.5,0.01, 2.05,0.01),
            RDRTP  = c(0,0, 20,0, 25,1.5, 30,3, 40,4),
            RNSOIL = c(0,0, 1,0, 5,0.15, 10,0.6, 20,0.8, 100,0.8),  
            RTMAX  = c(500,1000, 700,1200, 800,1600, 1000,1800, 1200,2000),
            SBINFD = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            SENWAT = c(0,3.0, 0.5,1.6, 0.9,0, 1,0, 2,0),
            SEVLT  = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            SEVR   = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            SEVRPT = c(0,0, 0.01,0.99, 0.05,0.85, 0.1,0.75, 0.5,0.5, 1,0.01),
            SEVRPM = c(0,0, 366,0),   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            SLACF  = c(0,1.3, 0.55,1.2, 1,1, 2.1,1),
            SNLVGA = c(0,0, 1,0, 1.6,0, 1.8,0.2, 2.2,1),
            SOILAB = c(0,0.5, 0.1,0.3, 0.2,0.25, 0.3,0.22, 0.4,0.15, 0.5,0.1, 1,0.1),
            STHIGH = c(0,0, 2,0.04, 4,0.1, 6,0.3, 8,0, 20,0),  #FJAV: Original end in 8,0
            STLOW  = c(0,0, 2,0.04, 4,0.1, 6,0.3, 8,0),
            TERIND = c(0,0, 366,0),  #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            TMPTAB = c(0,0, 4.9,0, 5,0.2, 10,0.2, 20,0.4, 25,0.75, 30,1, 35,0.9, 40,0.8),  #FJAV: Original begin in 5,0.2
            TMPTBV = c(0,0, 6.9,0, 7,0.2, 16,0.4, 24,0.8, 32,1, 40,1, 50,0.8),  #FJAV: Original begin in 7,0.2
            TTGMEX = c(0,1.2, 10,1, 15,0.9, 16,50, 100,1000),
            UREAP1 = c(0,60, 1,0, 20,0, 21,60, 22,0, 34,0, 35,0, 36,0, 59,0, 60,0, 61,0, 366,0),  #FJAV: Original end in 365,*
            UREAP2 = c(0,0, 366,0),  #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            UREAP3 = c(0,0, 366,0),  #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
            WEED   = c(0,0, 366,0)   #CONSTANT FUNCTION IN ZERO  #FJAV: Original end in 365,*
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)