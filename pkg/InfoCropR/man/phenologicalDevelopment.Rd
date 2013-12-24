\name{phenologicalDevelopment}
\alias{phenologicalDevelopment}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Phenological development
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
phenologicalDevelopment(DINDEXs, control, crop, cropsv, EDTSsv, management, srSUBDD, srSUBPET, stress, tabFunction, phenology)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{DINDEXs}{
%%     ~~Describe \code{DINDEXs} here~~
}
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{crop}{
%%     ~~Describe \code{crop} here~~
}
  \item{cropsv}{
%%     ~~Describe \code{cropsv} here~~
}
  \item{EDTSsv}{
%%     ~~Describe \code{EDTSsv} here~~
}
  \item{management}{
%%     ~~Describe \code{management} here~~
}
  \item{srSUBDD}{
%%     ~~Describe \code{srSUBDD} here~~
}
  \item{srSUBPET}{
%%     ~~Describe \code{srSUBPET} here~~
}
  \item{stress}{
%%     ~~Describe \code{stress} here~~
}
  \item{tabFunction}{
%%     ~~Describe \code{tabFunction} here~~
}
  \item{phenology}{
%%     ~~Describe \code{phenology} here~~
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
function (DINDEXs, control, crop, cropsv, EDTSsv, management, 
    srSUBDD, srSUBPET, stress, tabFunction, phenology) 
{
    DSI <- control@DSI
    DAYSEN <- crop@DAYSEN
    DLSTG1 <- crop@DLSTG1
    DLSTG2 <- crop@DLSTG2
    MUSTRD <- crop@MUSTRD
    POTATO <- crop@POTATO
    TGBD <- crop@TGBD
    TGMBD <- crop@TGMBD
    TTGF <- crop@TTGF
    TPOPT <- crop@TPOPT
    TTVG <- crop@TTVG
    TPSHOK <- cropsv@TPSHOK[length(cropsv@TPSHOK)]
    TMIN <- EDTSsv@TMIN[length(EDTSsv@TMIN)]
    TPAV <- EDTSsv@TPAV[length(EDTSsv@TPAV)]
    TTGM <- EDTSsv@TTGM[length(EDTSsv@TTGM)]
    DAS <- management@DAS[length(management@DAS)]
    SOW6 <- management@SOW6[length(management@SOW6)]
    DS <- phenology@DS[length(phenology@DS)]
    HU <- srSUBDD@HU[length(srSUBDD@HU)]
    DAYLP <- srSUBPET@DAYLP[length(srSUBPET@DAYLP)]
    NSTRES <- stress@NSTRES[length(stress@NSTRES)]
    WSTRES <- stress@WSTRES[length(stress@WSTRES)]
    DAYCF <- tabFunction@DAYCF
    DRWT <- tabFunction@DRWT
    NDRWT <- tabFunction@NDRWT
    DAYLC <- INSW((DS - DLSTG1) * (DLSTG2 - DS), 1, AFGEN(DAYCF, 
        DAYLP) * DAYSEN)
    MAXSTD <- AMAX1(AFGEN(DRWT, WSTRES), AFGEN(NDRWT, NSTRES))
    MSTARD <- INSW(MUSTRD - 1, 0, 25)
    TRECIP <- AMIN1(1, 1/INSW(TMIN - 10, NOTNUL(TMIN), 10000))
    HUVG <- AMAX1(0, HU + INSW(POTATO - 1, 0, INSW(DS - 0.85, 
        INSW(TMIN - 15, HU * 0.5, 0), 0)) + MSTARD * TRECIP)
    DRV <- TPSHOK * HUVG * DAYLC * MAXSTD/TTVG
    DRR <- AMAX1(0, AMIN1(TPOPT, TPAV) - TGBD) * MAXSTD/TTGF
    RDSA <- (TPAV - TGMBD) * SOW6 * 0.1/TTGM
    RDSB <- INSW(DS - 1, DRV, DRR)
    RDS <- INSW(DS - 0.1, RDSA, RDSB)
    DS <- DSI + RDS
    DS <- INSW(DS, -DS, DS)
    ANTHD <- INSW(DS - 1, SOW6, 0)
    GFD <- AMAX1(0, DAS - ANTHD)
    j <- length(phenology@DINDEX) + 1
    phenology@DINDEX[j] <- DINDEXs
    phenology@ANTHD[j] <- ANTHD
    phenology@DS[j] <- DS
    phenology@GFD[j] <- GFD
    phenology@HUVG[j] <- HUVG
    phenology@RDSA[j] <- RDSA
    return(phenology)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
