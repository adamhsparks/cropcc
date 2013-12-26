setClass(Class="ControlClass",
         
         representation = representation(
 
           #------------------ SIMULATION CONTROLS
           STTIME = "numeric",
           AEZ    = "numeric",  #------------FJAV: Declarated in Line 1206, but Without use in FST
           
           #All of the following should simply be the first value of each object (phenology, cropsv, etc.)
           
           DSI    = "numeric",                 #== Initial value of Development stage (DS)
           
           ETSWCH = "numeric",
           GRSWCH = "numeric",  #------------FJAV: Declarated in Line 1205, but Without use in FST
           IDSLR  = "numeric",
           INPOND = "numeric",                 #== initial state of surface ponding of water
           LAII   = "numeric", # (*)           #== Initial leaf area index
           NLVI   = "numeric", # (*)           #== initial leaves rate of change in N-content
           
           NO31I  = "numeric", # (*)
           NO32I  = "numeric", # (*)
           NO33I  = "numeric", # (*)
           
           NRTI   = "numeric", # (*)           #== initial root rate of change in N-content
           
           SOC1KG = "numeric", # (*) #First value of SOCNT1
           SOC2KG = "numeric", # (*) #First value of SOCNT2
           SOC3KG = "numeric", # (*)
           
           SOILSW = "numeric",
           TKL3   = "numeric", # (*)           #== soil layer 3 thickness
           TPSI   = "numeric", # (*)
           
           #*** Switches for simulation control
           SWXNIT = "numeric", # (*)
           FPOTAT = "numeric", # (*)
           
           #------------------
           DELT   = "numeric",
           FINTIM = "numeric",  #------------FJAV: Declarated in Line 1161, but Without use in FST
           IRRSEN = "numeric",
           NTADD  = "numeric",  #------------FJAV: (?) With 5 deffined values in different lines, but without explicit use in FST
           PRDEL  = "numeric",  #------------FJAV: Declarated in Line 1161, but Without use in FST
           SEEDRT = "numeric",                 #== Quantity of seeds sown, OR, seed rate
           SWCPOT = "numeric",  #------------FJAV: Declarated in Lines 1072, and 1236
           SWXWAT = "numeric", # (*)
           
           WL1I  = "numeric", # (*)
           WL2I  = "numeric", # (*)
           WL3I  = "numeric", # (*)
           
           WLVI   = "numeric", # (*)           #== Initial leaf weight
           WRTI   = "numeric", # (*)           #== Initial root weight
           
           WSTI   = "numeric",
           
           XTIN   = "numeric"
           
         ),
         
         prototype = prototype( 
 
           #------------------ SIMULATION CONTROLS
           STTIME = 319,
           AEZ    = 1,
           
           DSI    = 0,
           
           ETSWCH = 0,  #------------FJAV: Ninguna asignaci?n cambia su valor en FST, asignado en Line 1204, pero es un conmutador! (?)
           GRSWCH = 0,
           IDSLR  = 1,
           INPOND = 0,
           LAII   = 0,
           NLVI   = 0,
           
           NO31I  = 0,
           NO32I  = 0,
           NO33I  = 0,
           
           NRTI   = 0,
           
           SOC1KG = 0, 
           SOC2KG = 0,
           SOC3KG = 0,
           
           SOILSW = 0,    #Line 1175: * SOILSW IS 0. FOR MEASURED DATA, OTHERWISE =1.
           TKL3   = 0,
           TPSI   = 0,
           
           #*** Switches for simulation control
           SWXNIT = 0,
           FPOTAT = 0,
           
           #------------------
           DELT   = 1, 
           FINTIM = 500,
           IRRSEN = 1,
           NTADD  = 120,   #------------FJAV: Line 547: PARAM NTADD=120 / Line 1228: PARAM NTADD=0 / Line 1230: PARAM NTADD = 50 / Line 1232: PARAM NTADD = 100 / Line 1234: PARAM NTADD = 150
           PRDEL  = 1,
           SEEDRT = 100,
           SWCPOT = 1,     #------------FJAV: Declarated in Line 1072:  PARAM SWCPOT = 0;  and Line 1236: PARAM SWCPOT = 1
                           #FJAV: Without evaluation, and not change value             
           SWXWAT = 0,
           
           WL1I = 0,
           WL2I = 0,
           WL3I = 0,
           
           WLVI   = 0,
           WRTI   = 0,
           
           WSTI   = 0,
           
           XTIN   = 1
           
         ),
         
         validity = function(object)
         {
            TRUE
         }
)