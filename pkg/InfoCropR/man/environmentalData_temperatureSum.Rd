\name{environmentalData_temperatureSum}
\alias{environmentalData_temperatureSum}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Process weather data
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
environmentalData_temperatureSum(TIME, control, crop, management, srSUBPET, SWBsv, tabFunction, weather, EDTSsv)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{TIME}{
%%     ~~Describe \code{DINDEXs} here~~
}
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{crop}{
%%     ~~Describe \code{crop} here~~
}
  \item{management}{
%%     ~~Describe \code{management} here~~
}
  \item{srSUBPET}{
%%     ~~Describe \code{srSUBPET} here~~
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
  \item{EDTSsv}{
%%     ~~Describe \code{EDTSsv} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
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
function (DINDEXs, control, crop, management, srSUBPET, SWBsv, 
    tabFunction, weather, EDTSsv) 
{
    DELT <- control@DELT
    SWCPOT <- control@SWCPOT
    TPSI <- control@TPSI[length(control@TPSI)]
    POTATO <- crop@POTATO
    TTGERM <- crop@TTGERM
    SPROUT <- management@SPROUT
    ANGOT <- srSUBPET@ANGOT[length(srSUBPET@ANGOT)]
    AWF1 <- SWBsv@AWF1[length(SWBsv@AWF1)]
    IRRIG0 <- SWBsv@IRRIG0[length(SWBsv@IRRIG0)]
    IRRIG1 <- SWBsv@IRRIG1[length(SWBsv@IRRIG1)]
    IRRIG2 <- SWBsv@IRRIG2[length(SWBsv@IRRIG2)]
    IRRIG3 <- SWBsv@IRRIG3[length(SWBsv@IRRIG3)]
    CRAINP <- tabFunction@CRAINP
    CTMAXP <- tabFunction@CTMAXP
    CTMINP <- tabFunction@CTMINP
    TTGMEX <- tabFunction@TTGMEX
    DOY <- weather@DOY[weather@DINDEX == DINDEXs]
    RAIN <- weather@RAIN[weather@DINDEX == DINDEXs]
    RDD <- weather@RDD[weather@DINDEX == DINDEXs]
    TMMN <- weather@TMMN[weather@DINDEX == DINDEXs]
    TMMX <- weather@TMMX[weather@DINDEX == DINDEXs]
    VP <- weather@VP[weather@DINDEX == DINDEXs]
    WN <- weather@WN[weather@DINDEX == DINDEXs]
    EDTSsv@TPS[1] <- TPSI
    RADSWC <- EDTSsv@RADSWC[length(EDTSsv@RADSWC)]
    TPS <- EDTSsv@TPS[length(EDTSsv@TPS)]
    CCTMAX <- AFGEN(CTMAXP, DOY)
    CCTMIN <- AFGEN(CTMINP, DOY)
    CCRAIN <- AFGEN(CRAINP, DOY)
    RAINF <- AMAX1(0, RAIN * (100 + CCRAIN)/100)
    TRAIN <- RAINF
    IRRIGS <- IRRIG0 + IRRIG1 + IRRIG2 + IRRIG3
    TIRRIG <- IRRIGS
    TMAX <- TMMX + CCTMAX
    TMIN <- TMMN + CCTMIN
    RADCNT <- 0.12 + REAAND(DOY - 120, 270 - DOY) * 0.05
    DTR <- INSW(RADSWC - 0.1, (ANGOT * RADCNT * sqrt(TMAX - TMIN) + 
        2.7628), RDD)/1e+06
    TPAV <- 0.5 * (TMAX + TMIN)
    TPAD <- (TMAX + TPAV)/2
    RTPS <- (TPAV - TPS)/5
    TPS <- TPS + RTPS
    WIND <- INSW(WN - 0.1, 1.5 + REAAND(DOY - 120, 270 - DOY) * 
        1.5, WN)
    VPSMIN <- 0.6108 * exp(17.27 * TMIN/(TMIN + 237.3))
    VPA <- AMIN1(VPSMIN, INSW(VP - 0.2, VPSMIN, VP))
    TTGM1 <- INSW(POTATO - 1, TTGERM, TTGERM * AFGEN(TTGMEX, 
        SPROUT))
    TTGM <- INSW(SWCPOT - 1, AMAX1(10, TTGM1/AMAX1(0.1, INSW(AWF1 - 
        1, AWF1, AWF1/10))), TTGM1)
    RDAS <- DELT
    DSTART <- RDAS
    j <- length(EDTSsv@DINDEX) + 1
    EDTSsv@DINDEX[j] <- DINDEXs
    EDTSsv@DSTART[j] <- DSTART
    EDTSsv@DTR[j] <- DTR
    EDTSsv@IRRIGS[j] <- IRRIGS
    EDTSsv@RAINF[j] <- RAINF
    EDTSsv@TIRRIG[j] <- TIRRIG
    EDTSsv@TMAX[j] <- TMAX
    EDTSsv@TMIN[j] <- TMIN
    EDTSsv@TPAD[j] <- TPAD
    EDTSsv@TPAV[j] <- TPAV
    EDTSsv@TPS[j] <- TPS
    EDTSsv@TTGM[j] <- TTGM
    EDTSsv@VPA[j] <- VPA
    EDTSsv@VPSMIN[j] <- VPSMIN
    EDTSsv@WIND[j] <- WIND
    return(EDTSsv)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
