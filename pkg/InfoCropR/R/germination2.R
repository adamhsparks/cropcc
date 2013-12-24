#management
germination2 <- function(phenology, DINDEXs, management)
{
  #---------- phenology Data
  RDSA <- phenology@RDSA[length(phenology@RDSA)]
  
  #---------- management Data
  STTIME    <- management@STTIME[length(management@STTIME)]
  
  #================
  #---------------- GERMINATION
  GERMIX <- RDSA                       #Line 109: GERMIX = INTGRL(ZERO,RDSA)
  GERM1  <- REAAND(0.1 - GERMIX, 1)
  GERMI  <- GERM1                      #Line 110: GERMI  = INTGRL(ZERO,GERM1)
  EMERG  <- INSW(GERMIX - 0.1, 1000, STTIME + GERMI)
  SOWFXD <- STTIME
  
  #---------------- EMERGENCE SWITCH
  #----------------------------------------------
  TIME   <- DINDEXs #---------------- FJAV: ???????????
  
  #JvE: Need to look at this because DINDEXs does not start at 1 !!!
  
  #----------------------------------------------
  ESW  <- REAAND(TIME - EMERG + 0.5, EMERG - TIME + 0.5)
  ESWI <- ESW                          #Line 117: ESWI = INTGRL(ZERO,ESW)
  
  #================
  j <- length(management@SOWFXD) + 1
  management@SOWFXD <- SOWFXD
  
  management@ESW    <- ESW
  management@ESWI   <- ESWI
  
  #----------------
  return(management)
}
#==================
# management <- germination2(phenology,DINDEXs,management)