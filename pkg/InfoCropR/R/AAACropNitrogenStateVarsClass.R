# CNsv [cropNitrogen]
#-------------
setClass(Class="CropNitrogenStateVarsClass",
         
         representation = representation(
            
           ANCRGR  = "numeric",           #== actual N-content
           ANLD    = "numeric",
           ANLV    = "numeric",
           ANRT    = "numeric",
           ANSD    = "numeric",
           ANSO    = "numeric",
           ANST    = "numeric",
           
           #***    Crop nitrogen demand
           ANCRPT = "numeric",           #== potential level of N in different plant parts
           
           #** Actual N supply rates by plant organs, in kg/ha/d
           NMOBIL  = "numeric",
           
           #***  N Fixation
           NFIX   = "numeric",           #== nitrogen fixation
           
           #*** Immobilisation of nitrogen
           NIMMOT  = "numeric",
           NIMMO1  = "numeric",
           NIMMO2  = "numeric",
           NIMMO3  = "numeric",
           
           #*** N uptake by the crop
           NUPTK1  = "numeric",           #== actual crop N-uptake in soil layer 1
           NUPTK2  = "numeric",           #== actual crop N-uptake in soil layer 2
           NUPTK3  = "numeric"            #== actual crop N-uptake in soil layer 3
            
         ),
         
         prototype = prototype( 
            
            ANCRGR = 0,
            ANLD   = 0,
            ANLV   = 0,
            ANRT   = 0,
            ANSD   = 0,
            ANSO   = 0,
            ANST   = 0,
            
            #***    Crop nitrogen demand
            ANCRPT = 0,
            
            #** Actual N supply rates by plant organs, in kg/ha/d
            NMOBIL  = 0,
            
            #***  N Fixation
            NFIX   = 0,
            
            #*** Immobilisation of nitrogen
            NIMMOT  = 0,
            NIMMO1  = 0,
            NIMMO2  = 0,
            NIMMO3  = 0,
            
            #*** N uptake by the crop
            NUPTK1  = 0,
            NUPTK2  = 0,
            NUPTK3  = 0
              
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)