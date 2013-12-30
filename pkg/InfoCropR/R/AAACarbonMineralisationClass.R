# carbonMine [carbonMineralisation]
#-------------
setClass(Class="CarbonMineralisationClass",
         
         representation = representation(
   
           #== carbon mineralized from organic matter
           CA1DEC = "numeric",
           CA2DEC = "numeric",
           CA3DEC = "numeric",
           
           #== dissolved organic C pool
           CDOC1  = "numeric",
           CDOC2  = "numeric",
           CDOC3  = "numeric",
           
           CL1DEC = "numeric",
           CL2DEC = "numeric",
           CL3DEC = "numeric",
           
           LI1DEC = "numeric",
           LI2DEC = "numeric",
           LI3DEC = "numeric",
           
           #== net organic matter available
           OM1CAS = "numeric",
           OM2CAS = "numeric",
           OM3CAS = "numeric",           
           
           #== net soil organic carbon available
           SOCNT1 = "numeric",
           SOCNT2 = "numeric",
           SOCNT3 = "numeric",
           
           #*** Dynamics of soil carbon
           MBSOL  = "numeric"           #== microbial biomass
            
         ),
         
         prototype = prototype( 
            
            CA1DEC = 0,
            CA2DEC = 0,
            CA3DEC = 0,
            
            CDOC1  = 0,
            CDOC2  = 0,
            CDOC3  = 0,
            
            CL1DEC = 0,
            CL2DEC = 0,
            CL3DEC = 0,
            
            LI1DEC = 0,
            LI2DEC = 0,
            LI3DEC = 0,
            
            OM1CAS = 0,
            OM2CAS = 0,
            OM3CAS = 0,            
            
            SOCNT1 = 0,
            SOCNT2 = 0,
            SOCNT3 = 0,
            
            #*** Dynamics of soil carbon
            MBSOL  = 0
            
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)