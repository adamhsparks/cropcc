# pestD [--] = parameters 
#-------------
setClass(Class="PestDataClass",
         
         representation = representation(
           
           #Loss in LAI due to pests        
           RGRFAC = "numeric",
           
           #-----
           CONSR  = "numeric",           #== feeding rate per insect per day, for beetles
           FEEDRT = "numeric",           #== feeding rate per insect per day, for grasshoppers
           FRPSTL = "numeric",           #== proportion of pest population on leaves
           FRPSTS = "numeric",           #== proportion of pest population on stem
           RGMPST = "numeric",           #== reduction in germination due to pest // (Wheat), (insects: Mole cricket), (GR)    #FJAV: ???
                                                                                 #== (Soybean), (insects: Seed maggot), (SR)   #FJAV: ???
           
           SKINWT = "numeric",           #== weight of one insect (and pest population per unit area?)
           SUCKRT = "numeric",           #== sucking rate per unit insect weight per day
           SUKNRT = "numeric"            #== N sucking rate per unit insect weight per day
           
         ),
         
         prototype = prototype( 
           
           #Loss in LAI due to pests        
           RGRFAC = 1,

           #-----
           CONSR  = 2.5e-6,
           FEEDRT = 1.5e-6,
           FRPSTL = 0.6,
           FRPSTS = 0.2,
           RGMPST = 1,
           SKINWT = 0.4,
           SUCKRT = 4.5e-7,
           SUKNRT = 8.92e-9
                      
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)