# cropsv [fillingrateStorageOrgans8, growthandRadiation7, lossLAIforPests6, effecctStresCG5, 
#         leafGrowth4, transplantingShock3, cropDamage2, evapoTranspiration] 
#-------------
setClass(Class="CropStateVarsClass",
         
         representation = representation(
           
          DINDEX = "numeric", 

          #EVAPO-TRANSPIRATION
          ATRANS = "numeric",           #== daily rate of transpiration, OR, actual water-uptake
          DSLR   = "numeric",           #== number of days since last wetting
          ETDAY  = "numeric",           #== evapotranspiration per day
          
          EVSW1  = "numeric",
          EVSW2  = "numeric",
          EVSW3  = "numeric", 
          
          TRWL1  = "numeric",           #== transpiration load
          TRWL2  = "numeric",           #== transpiration load
          TRWL3  = "numeric",           #== transpiration load
                    
          #PHENOLOGY
          EFFLAI = "numeric",           #== net effective leaf area for photosynthesis and transpiration
          
          #CROP DAMAGE DUE TO DISEASES
          BLIGHT  = "numeric",           #== for leaf area lost by...
          MILDEW  = "numeric",           #== for leaf area lost by...
          RUST    = "numeric",           #== for leaf area lost by...
          
          #CROP DAMAGE DUE TO STAND REMOVERS
          DMGSTR  = "numeric",           #== for leaf area lost by...
          
          #CROP DAMAGE DUE TO SUCKING PESTS
          HONYLS  = "numeric",           #== loss of honeydew with dead leaves of the crop
          HONYSM  = "numeric",           #== effect of honeydew of sucking pests on stem area, OR, cumulative quantum of honeydew produced by the insect population
          SUCKLV  = "numeric",           #== losses due to sucking pests
          SUCKSO  = "numeric",           #== losses due to pests in storage organs
          SUCKST  = "numeric",           #== loss of stem reserves due to sucking pests
          SUKNLV  = "numeric",           #== N sucked from leaves
          SUKNSO  = "numeric",           #== N sucked from storage organs
          SUKNST  = "numeric",           #== N sucked from stem
          
          #CROP DAMAGE DUE TO TISSUE CONSUMERS
          LRFEED  = "numeric",           #== leaf area removed by pests
          LVFEED  = "numeric",           #== leaf area loss due to defoliators
          NODERT  = "numeric",           #== incidence of tissue consumer, OR, loss of stem reserves due to node borers
          
          #CROP DAMAGE DUE TO WEEDS, VIRUSES, RUSTS AND MILDEWS REDUCING INTERCEPTION
          PSTPAR  = "numeric",           #== radiation captured by the pest, OR, diseased or honeydew-affected fraction of leaf area
          WEEDCV  = "numeric",           #== radiation captures by the weeds, OR, proportion of leaf area of weeds as compared to the crop
          
          #CROP GROWTH AND RADIATION USE EFFICIENCY
          GCROP  = "numeric",            #== growth rate of the crop
          
          #LEAF GROWTH AND SENESCENCE
          DLV    = "numeric",           #== rate of dead leaf weight
          DST    = "numeric",           #== rate of dead stem weight
          LAI    = "numeric",           #== leaf lamina area, OR, leaf area index
          RLAI   = "numeric",           #== net leaf area growth rate
          
          #Loss in LAI due to pests
          DLDETH = "numeric",
          DSAI   = "numeric",           #== death of these green tissues
          LALOSS = "numeric",           #== net loss of LAI due to pests
          RGRL   = "numeric",           #== relative growth rate of LAI
          SAI    = "numeric",           #== integrated photosynthetic areas of stems, sheats, and spikes
          SAIA   = "numeric",
          SLA    = "numeric",           #== specific leaf area
          
          #FILLING RATE OF STORAGE ORGANS
          AGFR   = "numeric",           #== growth rate of storage organs
          POTYLD = "numeric",           #== potential weight of storage organs
          WGRAIN = "numeric",           #== weigths of individual storage organ
          WSO    = "numeric",           #== weigths of storage organs
          
          #STRESS
          FLDLOS = "numeric",           #== crop growth processes, OR, funcition thar reduce water uptake when there is waterlogging in the soil
          FLOOD  = "numeric",
          FROST  = "numeric",
          
          #Loss due to frost
          FRDMG  = "numeric",           #== green area index frost sensitivity
          
          #TRANSPLANTING SHOCK
          PLTR   = "numeric",           #== losses due to transplanting
          TPSHOK = "numeric"

         ),
         
         prototype = prototype(
           
          DINDEX = 10957,
        
          #EVAPO-TRANSPIRATION
          ATRANS = 0,
          DSLR   = 1,
          ETDAY  = 0,
          EVSW1  = 0,
          EVSW2  = 0,
          EVSW3  = 0,
          TRWL1  = 0,
          TRWL2  = 0,
          TRWL3  = 0, 
          
          #CROP DAMAGE DUE TO DISEASES
          BLIGHT   = 0,
          MILDEW   = 0,
          RUST     = 0,
          
          #CROP DAMAGE DUE TO STAND REMOVERS
          DMGSTR  = 0,
          
          #CROP DAMAGE DUE TO SUCKING PESTS
          HONYLS  = 0,
          HONYSM  = 0,
          SUCKLV  = 0,
          SUCKSO  = 0,
          SUCKST  = 0,
          SUKNLV  = 0,
          SUKNSO  = 0,
          SUKNST  = 0,
          
          #CROP DAMAGE DUE TO TISSUE CONSUMERS
          LRFEED  = 0,
          LVFEED  = 0,
          NODERT  = 0,
          
          #CROP DAMAGE DUE TO WEEDS, VIRUSES, RUSTS AND MILDEWS REDUCING INTERCEPTION
          PSTPAR  = 0,
          WEEDCV  = 0,
          
          #PHENOLOGY
          EFFLAI  = 0,
          
          #CROP GROWTH AND RADIATION USE EFFICIENCY
          GCROP  = 0,
          
          #LEAF GROWTH AND SENESCENCE        
          DLV    = 0,
          DST    = 0,
          LAI    = 0,
          RLAI   = 0,
          
          #Loss in LAI due to pests
          DLDETH = 0,
          DSAI   = 0,
          LALOSS = 0,
          RGRL   = 0,
          SAI    = 1,
          SAIA   = 0,
          SLA    = 0,
          
          #FILLING RATE OF STORAGE ORGANS
          AGFR   = 0,
          POTYLD = 0,
          WGRAIN = 0,
          WSO    = 0,
          
          #STRESS
          FLDLOS = 0,
          FLOOD  = 0,
          FROST  = 0,
          
          #Loss due to frost
          FRDMG  = 0,
          
          #TRANSPLANTING SHOCK
          PLTR   = 0,
          TPSHOK = 0

         ),
         
         validity = function(object)
         {
           return(TRUE)
         }
         
)