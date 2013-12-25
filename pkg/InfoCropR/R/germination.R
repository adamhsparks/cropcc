germination <- function(phenology, management) 
{
  
  #---------- phenology Data
  j <- length(phenology@DS)
  
  if(management@ESW[j] > 0.5) 
  {  
    management@ESW[j+1] <- 1
    management@ESWI[j+1] <- 1 #ESWI should be eliminated later; it is just an auxiliary variable in FST
    return(management)
  }
  else 
  {
    DS <- phenology@RDSA[j]
    
    #---------------- GERMINATION
    GERM <- max(0, DS - 0.1)
    ESW <- as.integer(GERM > 0)
    
    #---------------- EMERGENCE SWITCH
    management@ESW[j+1]    <- ESW 
    management@ESWI[j+1]   <- ESW 
    
    #----------------
    return(management)
  }
}

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