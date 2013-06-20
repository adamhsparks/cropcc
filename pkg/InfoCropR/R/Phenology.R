# phenology <- function(Weather, Crop, State, i)
# {
#   
#   DS <- State$DS[i]
#   
# 
#   
#   
#   if(DS<0.1)
#   {
#     
#     TGMBD <- Crop$TGMBD
#     SOW6
#     RDS <- (TPAV-TGMBD)*SOW6*.1/TTGM
#   
#   }
# 
#   if(DS >= 0.1 & DS < 1)
#   {
#     
#     TPSHOK <- 
#     TTVG <- 
#       
#     RDS    = TPSHOK*HUVG*DAYLC*MAXSTD/TTVG
#     MAXSTD = AMAX1(AFGEN(DRWT,WSTRES),AFGEN(NDRWT,NSTRES))
#     DAYLC  = INSW((DS-DLSTG1)*(DLSTG2-DS),1.,AFGEN(DAYCF,DAYLP)*DAYSEN)
#     HUVG   = AMAX1(0.,HU+INSW(POTATO-1.,0.,INSW(DS-.85,...
#                                                 INSW(TMIN-15.,HU*0.5,0.),0.))+MSTARD*TRECIP)
#     MSTARD = INSW (MUSTRD -1.,0.,25.)
#     TRECIP = AMIN1(1.,1./INSW(TMIN-10.,NOTNUL(TMIN),10000.))
#     
#   }
#   
#   if(DS >= 1)
#   {
#     
#     TTGF <-
#     TPOPT <-
#     TPAV <-
#     TGBD <-
#     RDS    <- AMAX1(0.,AMIN1(TPOPT,TPAV)-TGBD)*MAXSTD/TTGF    #ERROR: DRR <- ...
#     MAXSTD <- AMAX1(AFGEN(DRWT,WSTRES),AFGEN(NDRWT,NSTRES))
#     
#   }
#    
#   DS <- DS + RDS
#   State$DS[i+1] <- DS
#   return(State)
#   
# }
#   
#   
# ***   Phenological development
# 
# CALL SUBDD  (TMAX,TMIN,TVBD, TPOPT,TPMAXD, HU  )
# DS     = INTGRL(DSI,RDS)
# RDS    = INSW(DS-0.1,RDSA,RDSB)
# 
# RDSA   = (TPAV-TGMBD)*SOW6*.1/TTGM
# 
# RDSB   = INSW(DS-1.,DRV,DRR)
# DRV    = TPSHOK*HUVG*DAYLC*MAXSTD/TTVG
# MAXSTD = AMAX1(AFGEN(DRWT,WSTRES),AFGEN(NDRWT,NSTRES))
# DAYLC  = INSW((DS-DLSTG1)*(DLSTG2-DS),1.,AFGEN(DAYCF,DAYLP)*DAYSEN)
# DRR    = AMAX1(0.,AMIN1(TPOPT,TPAV)-TGBD)*MAXSTD/TTGF
# HUVG   = AMAX1(0.,HU+INSW(POTATO-1.,0.,INSW(DS-.85,...
#                                             INSW(TMIN-15.,HU*0.5,0.),0.))+MSTARD*TRECIP)
# MSTARD = INSW (MUSTRD -1.,0.,25.)
# TRECIP = AMIN1(1.,1./INSW(TMIN-10.,NOTNUL(TMIN),10000.))
# ANTHD  = INTGRL(ZERO,DAYSF)
# DAYSF  = INSW(DS-1.,SOW6,0.)
# GFD    = AMAX1(0.,DAS-ANTHD)
# FINISH GFD >60.

