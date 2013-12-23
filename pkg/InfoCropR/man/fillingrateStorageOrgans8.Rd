\name{fillingrateStorageOrgans8}
\alias{fillingrateStorageOrgans8}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
fillingrateStorageOrgans8(crop, EDTSsv, GRsv, phenology, cropsv)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{crop}{
%%     ~~Describe \code{crop} here~~
}
  \item{EDTSsv}{
%%     ~~Describe \code{EDTSsv} here~~
}
  \item{GRsv}{
%%     ~~Describe \code{GRsv} here~~
}
  \item{phenology}{
%%     ~~Describe \code{phenology} here~~
}
  \item{cropsv}{
%%     ~~Describe \code{cropsv} here~~
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
function (crop, EDTSsv, GRsv, phenology, cropsv) 
{
    DSGFIL <- crop@DSGFIL
    ENERGY <- crop@ENERGY
    GFRVAR <- crop@GFRVAR
    MOISTC <- crop@MOISTC
    POTGWT <- crop@POTGWT
    SHELLP <- crop@SHELLP
    TPRGFR <- crop@TPRGFR
    AGFR <- cropsv@AGFR[length(cropsv@AGFR)]
    TPAV <- EDTSsv@TPAV[length(EDTSsv@TPAV)]
    RWSO <- GRsv@RWSO[length(GRsv@RWSO)]
    TDM <- GRsv@TDM[length(GRsv@TDM)]
    DS <- phenology@DS[length(phenology@DS)]
    GNLOSS <- phenology@GNLOSS[length(phenology@GNLOSS)]
    GNO <- phenology@GNO[length(phenology@GNO)]
    MAXGFR <- AMIN1(GFRVAR * 1.33, GFRVAR * (2^((TPAV - TPRGFR)/10))) * 
        GNO/1e+06
    WSO <- AGFR
    AGFR <- AMAX1(0, AMIN1(MAXGFR, RWSO)) * REAAND(DS - DSGFIL, 
        2 - DS) - WSO * GNLOSS/NOTNUL(GNO)
    WGRAIN <- AMIN1(POTGWT, WSO * 1e+06/NOTNUL(GNO))
    YIELD <- WSO/(MOISTC * ENERGY * SHELLP/100)
    HI <- YIELD/NOTNUL(TDM)
    POTYLD <- GNO * POTGWT/1e+06
    j <- length(cropsv@AGFR) + 1
    cropsv@AGFR[j] <- AGFR
    cropsv@POTYLD[j] <- POTYLD
    cropsv@WGRAIN[j] <- WGRAIN
    cropsv@WSO[j] <- WSO
    return(cropsv)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
