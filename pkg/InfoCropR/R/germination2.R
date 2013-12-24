germination2 <- function(phenology, DINDEXs, management) #JvE: ALSO emergence!!!
{
  #---------- phenology Data
  RDSA <- phenology@RDSA[length(phenology@RDSA)]
  
  #---------- management Data
  STTIME    <- management@STTIME
  
  #================
  #---------------- GERMINATION
  GERMIX <- RDSA                       #Line 109: GERMIX = INTGRL(ZERO,RDSA)
  GERM1  <- REAAND(0.1 - GERMIX, 1)
  GERMI  <- GERM1                      #Line 110: GERMI  = INTGRL(ZERO,GERM1)
  EMERG  <- INSW(GERMIX - 0.1, 1000, STTIME + GERMI) #JvE STTIME should really be sowing date. 
  
  #---------------- EMERGENCE SWITCH
  TIME   <- DINDEXs #---------------- FJAV: ???????????
  #According to documentation TIME is an FST variable linked to the TIMER statement
  #It is related to DOY, which is why it starts at 319...
  
  #----------------------------------------------
  ESW  <- REAAND(TIME - EMERG + 0.5, EMERG - TIME + 0.5) #JvE: EMERG is either 1000 or STTIME + 1
  #JvE: No emergence occurs if RDSA does not increase to 0.1 on the first day!
  #This needs to change!
  #It seems that the assumption is that emergence occurs 1 day after germination
  ESWI <- ESW                          #Line 117: ESWI = INTGRL(ZERO,ESW)
    
  management@ESW    <- ESW
  management@ESWI   <- ESWI
  
  #----------------
  return(management)
}
#==================
# management <- germination2(phenology,DINDEXs,management)


# *GERMINATION
# 
# GERMIX = INTGRL(ZERO,RDSA)
# GERMI  = INTGRL(ZERO,GERM1)
# GERM1  = REAAND(.1-GERMIX,1.)
# EMERG  = INSW(GERMIX-.1,1000.,STTIME+GERMI)
# SOWFXD = STTIME
# 
# ** EMERGENCE SWITCH
# ESW    = REAAND(TIME-EMERG+0.5,EMERG-TIME+0.5)
# ESWI   = INTGRL(ZERO,ESW)