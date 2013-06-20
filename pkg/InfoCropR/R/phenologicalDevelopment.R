#phenology
phenologicalDevelopment <- function(i, phenology, tabFunction, variety, weather)
{

#---------- tabFunction Data
CTMAXP <- tabFunction@CTMAXP
CTMINP <- tabFunction@CTMINP

#---------- variety Data
# TPMAXD <- variety@TPMAXD
# TPOPT  <- variety@TPOPT
# TVBD   <- variety@TVBD

#---------- weather Data
DOY   <- weather@DOY[weather@DINDEX == i]

TMMN  <- weather@TMMN[weather@DINDEX == i]
TMMX  <- weather@TMMX[weather@DINDEX == i]

#----------
CCTMAX <- AFGEN(CTMAXP, DOY)
CCTMIN <- AFGEN(CTMINP, DOY)

TMAX   <- TMMX + CCTMAX
TMIN   <- TMMN + CCTMIN

return(phenology)
}