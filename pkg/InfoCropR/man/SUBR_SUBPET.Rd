\name{SUBR_SUBPET}
\alias{SUBR_SUBPET}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Potential evapotranspiration subroutine
}
\description{
Calculates potential evapotranspiration
}
\usage{
SUBR_SUBPET(TIME, climate, control, cropsv, EDTSsv, soil, SWBsv, tabFunction, weather, srSUBPET)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{TIME}{
%%     ~~Describe \code{DINDEXs} here~~
}
  \item{climate}{
%%     ~~Describe \code{climate} here~~
}
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{cropsv}{
%%     ~~Describe \code{cropsv} here~~
}
  \item{EDTSsv}{
%%     ~~Describe \code{EDTSsv} here~~
}
  \item{soil}{
%%     ~~Describe \code{soil} here~~
}
  \item{SWBsv}{
%%     ~~Describe \code{SWBsv} here~~
}
  \item{tabFunction}{
%%     ~~Describe \code{tabFunction} here~~
}
  \item{weather}{
%%     ~~Describe \code{weather} here~~
}
  \item{srSUBPET}{
%%     ~~Describe \code{srSUBPET} here~~
}
}
\details{
This subroutine calculates reference evapotranspiration in a manner similar to Penman (1948). To obtain crop evapo-transpiration, multiplication with a Penman crop factor should be done. Calculations can be carried out for three types of surfaces: water, wet soil, and short grass (ISURF=1,2,3 resp.). When the input variable TMDI is set to zero, a single calculation is done and an estimate is provided of temperature difference between the environment and the surface (DT). If the absolute value of DT is large an iterative Penman can be carried out which continues until the new surface temperature differs by no more than TMDI from the old surface temperature. Two types of long-wave radiation calculations are available Swinbank and Brunt. The switch between the two is made by choosing the right values for ANGA and ANGB. If ANGA and ANGB are zero, Swinbank is used, if both are positive, Brunt is used and the ANGA and ANGB values are in the calculation of the cloud cover.          }
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (DINDEXs, climate, control, cropsv, EDTSsv, soil, SWBsv, 
    tabFunction, weather, srSUBPET) 
{
    LHVAP = 2454000
    PSCH = 0.067
    DEGTRAD = 0.017453292
    SIGMA = 5.668e-08
    CO2 <- climate@CO2
    ETSWCH <- control@ETSWCH
    LAI <- cropsv@LAI[length(cropsv@LAI)]
    TMAX <- EDTSsv@TMAX[length(EDTSsv@TMAX)]
    TMIN <- EDTSsv@TMIN[length(EDTSsv@TMIN)]
    TPAV <- EDTSsv@TPAV[length(EDTSsv@TPAV)]
    VPA <- EDTSsv@VPA[length(EDTSsv@VPA)]
    VPSMIN <- EDTSsv@VPSMIN[length(EDTSsv@VPSMIN)]
    WIND <- EDTSsv@WIND[length(EDTSsv@WIND)]
    WCFC1 <- soil@WCFC1[length(soil@WCFC1)]
    WCST1 <- soil@WCST1[length(soil@WCST1)]
    WCL1 <- SWBsv@WCL1[length(SWBsv@WCL1)]
    COFST <- tabFunction@COFST
    SOILAB <- tabFunction@SOILAB
    DOY <- weather@DOY[weather@DINDEX == DINDEXs]
    LAT <- weather@LAT
    RDD <- weather@RDD[weather@DINDEX == DINDEXs]
    COSTOM <- AFGEN(COFST, CO2)
    SALBDO <- AFGEN(SOILAB, WCFC1) * (1 - 0.5 * WCL1/WCST1)
    ALBEDO <- INSW(LAI - 0.02, SALBDO, 0.23 - (0.23 - SALBDO) * 
        exp(-0.75 * LAI))
    PTFAC <- INSW(TMIN - 13, 1.25, 0.4)
    DEC <- -asin(sin(23.45 * DEGTRAD) * cos(2 * pi * (DOY + 10)/365))
    SINLD <- sin(DEGTRAD * LAT) * sin(DEC)
    COSLD <- cos(DEGTRAD * LAT) * cos(DEC)
    AOB <- SINLD/COSLD
    if (AOB < -1) {
        DAYL <- 0
        ZZCOS <- 0
        ZZSIN <- 1
    }
    else if (AOB > 1) {
        DAYL <- 24
        ZZCOS <- 0
        ZZSIN <- -1
    }
    else {
        DAYL <- 12 * (1 + 2 * asin(AOB)/pi)
        DAYLP <- 12 * (1 + 2 * asin((-sin(-4 * DEGTRAD) + SINLD)/COSLD)/pi)
        ZZA <- pi * (12 + DAYL)/24
        ZZCOS <- cos(ZZA)
        ZZSIN <- sin(ZZA)
    }
    DSINB <- 2 * 3600 * (DAYL * 0.5 * SINLD - 12 * COSLD * ZZCOS/pi)
    DSINBE <- 2 * 3600 * (DAYL * (0.5 * SINLD + 0.2 * SINLD^2 + 
        0.1 * COSLD^2) - (12 * COSLD * ZZCOS + 9.6 * SINLD * 
        COSLD * ZZCOS + 2.4 * COSLD^2 * ZZCOS * ZZSIN)/pi)
    SOLCON <- 1370 * (1 + 0.033 * cos(2 * pi * DOY/365))
    ANGOT <- SOLCON * DSINB
    DATMTR <- LIMIT(0, 1, RDD/ANGOT)
    RDLOI <- SIGMA * (TPAV + 273.16)^4
    RDLO <- 86400 * RDLOI
    RDLII <- DATMTR * (5.31e-13 * (TPAV + 273.16)^6 - RDLOI)/0.7 + 
        RDLOI
    RDLI <- 86400 * RDLII
    RDN <- (1 - ALBEDO) * RDD + RDLI - RDLO
    VPSMAX <- 0.6108 * exp(17.27 * TMAX/(TMAX + 237.3))
    VPS <- (VPSMAX + VPSMIN)/2
    VPSL <- 238.102 * 17.32491 * VPS/(TPAV + 238.102)^2
    VPD <- AMAX1(0, VPS - VPA)
    FU2 <- 2.63 * (1 + 0.54 * WIND * COSTOM)
    EA <- VPD * FU2
    ETRD <- (RDN * (VPSL/(VPSL + PSCH)))/LHVAP
    if (ETSWCH <= 0) {
        ETAE <- (PSCH * EA)/(VPSL + PSCH)
    }
    else {
        ETAE <- PTFAC * ETRD
    }
    ETD <- ETRD + ETAE
    PTRANS <- ETRD * (1 - exp(-0.5 * LAI)) + ETAE * (AMIN1(2, 
        LAI))
    PEVAP <- exp(-0.5 * LAI) * (ETRD + ETAE)
    j <- length(srSUBPET@DINDEX) + 1
    srSUBPET@DINDEX[j] <- DINDEXs
    srSUBPET@ANGOT[j] <- ANGOT
    srSUBPET@DAYLP[j] <- DAYLP
    srSUBPET@PEVAP[j] <- PEVAP
    srSUBPET@PTRANS[j] <- PTRANS
    return(srSUBPET)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
