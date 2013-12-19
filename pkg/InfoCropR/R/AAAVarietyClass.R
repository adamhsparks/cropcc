#variety
setClass(Class="VarietyClass",
         
         representation = representation(
 
           DAYSEN = "numeric",
           DLSTG1 = "numeric", 
           DLSTG2 = "numeric",
           GNOCF  = "numeric",
           KDFMAX = "numeric",
           NMAXGR = "numeric",
           POTGWT = "numeric",
           RGRPOT = "numeric",
           RUEMAX = "numeric",
           SLAVAR = "numeric",
           TGBD   = "numeric",
           TGMBD  = "numeric",
           TPMAXD = "numeric",
           TPOPT  = "numeric",
           TTGERM = "numeric",
           TTGF   = "numeric",
           TTVG   = "numeric",
           TVBD   = "numeric",
           VARFLD = "numeric",
           VARNFX = "numeric",
           VRSTMN = "numeric",
           VRSTMX = "numeric",
           ZRTPOT = "numeric"
           
         ),
         
         prototype = prototype( 
 
           DAYSEN = 1,
           DLSTG1 = 0.35,
           DLSTG1 = 0.65,
           GNOCF  = 30000,
           KDFMAX = 0.6,
           NMAXGR = 0.02,
           POTGWT = 42,
           RGRPOT = 0.005,
           RUEMAX = 2.4,
           SLAVAR = 0.0022,
           TGBD   = 7.5,
           TGMBD  = 3.6,
           TPMAXD = 40,
           TPOPT  = 25,
           TTGERM = 70,
           TTGF   = 393,
           TTVG   = 850,
           TVBD   = 4.5,
           VARFLD = 1,
           VARNFX = 1,
           VRSTMN = 1,
           VRSTMX = 1,
           ZRTPOT = 20
           
         ),
         
         validity = function(object)
         {
            TRUE
         }
)