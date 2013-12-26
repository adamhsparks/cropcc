\name{numberstorageOrgans2}
\alias{numberstorageOrgans2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Number of storage organs
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
numberstorageOrgans2(crop, cropsv, EDTSsv, management, stress, tabFunction, phenology)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
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
function (crop, cropsv, EDTSsv, management, stress, tabFunction, 
    phenology) 
{
    DSSTR1 <- crop@DSSTR1
    DSSTR2 <- crop@DSSTR2
    GNOCF <- crop@GNOCF
    GNOMAX <- crop@GNOMAX
    GNSTG1 <- crop@GNSTG1
    GNSTG2 <- crop@GNSTG2
    GNSTCR <- crop@GNSTCR
    POTGWT <- crop@POTGWT
    STCOOL <- crop@STCOOL
    STWARM <- crop@STWARM
    VRSTMN <- crop@VRSTMN
    VRSTMX <- crop@VRSTMX
    DMGSTR <- cropsv@DMGSTR[length(cropsv@DMGSTR)]
    GCROP <- cropsv@GCROP[length(cropsv@GCROP)]
    WGRAIN <- cropsv@WGRAIN[length(cropsv@WGRAIN)]
    WSO <- cropsv@WSO[length(cropsv@WSO)]
    TMAX <- EDTSsv@TMAX[length(EDTSsv@TMAX)]
    TMIN <- EDTSsv@TMIN[length(EDTSsv@TMIN)]
    DAS <- management@DAS[length(management@DAS)]
    DS <- phenology@DS[length(phenology@DS)]
    GNO <- phenology@GNO[length(phenology@GNO)]
    WSTRES <- stress@WSTRES[length(stress@WSTRES)]
    DRSTRL <- tabFunction@DRSTRL
    EARCUT <- tabFunction@EARCUT
    STHIGH <- tabFunction@STHIGH
    STLOW <- tabFunction@STLOW
    GNLOSS <- GNO * INSW(DS - 0.85, 0, AMAX1(DMGSTR, AFGEN(EARCUT, 
        DAS)/100))
    GNFILL <- INSW(DS - GNSTCR, 0, LIMIT(0, GNO * 0.1, GNO * 
        (1 - WGRAIN/(POTGWT * 0.25)))) + INSW(DS - (GNSTCR + 
        0.35), 0, LIMIT(0, GNO * 0.1, GNO * (1 - WGRAIN/(POTGWT * 
        0.65))))
    TPHIGH <- AMAX1(0, TMAX - STWARM)
    TPCOOL <- AMAX1(0, STCOOL - TMIN)
    STRILE <- GNO * REAAND(DS - DSSTR1, DSSTR2 - DS) * AMAX1(AFGEN(STHIGH, 
        TPHIGH) * VRSTMX, AFGEN(STLOW, TPCOOL) * VRSTMN, AFGEN(DRSTRL, 
        WSTRES))
    GNODAY <- GCROP * REAAND(DS - GNSTG1, GNSTG2 - DS) * GNOCF - 
        AMIN1(GNO, GNLOSS + GNFILL + STRILE)
    GNOPOT <- GNODAY
    GNO <- LIMIT(0, GNOMAX, GNOPOT)
    SINKLT <- INSW(DS - 1.2, 1, GNO * POTGWT/1e+06 - WSO)
    j <- length(phenology@GNO) + 1
    phenology@GNO[j] <- GNO
    phenology@GNLOSS[j] <- GNLOSS
    phenology@SINKLT[j] <- SINKLT
    return(phenology)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
