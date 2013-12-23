\name{effecctStresCG5}
\alias{effecctStresCG5}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Abiotic stress (floods, frost)
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
effecctStresCG5(control, crop, EDTSsv, phenology, SWBsv, tabFunction, cropsv)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{crop}{
%%     ~~Describe \code{crop} here~~
}
  \item{EDTSsv}{
%%     ~~Describe \code{EDTSsv} here~~
}
  \item{phenology}{
%%     ~~Describe \code{phenology} here~~
}
  \item{SWBsv}{
%%     ~~Describe \code{SWBsv} here~~
}
  \item{tabFunction}{
%%     ~~Describe \code{tabFunction} here~~
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
function (control, crop, EDTSsv, phenology, SWBsv, tabFunction, 
    cropsv) 
{
    SWCPOT <- control@SWCPOT
    FLDCRP <- crop@FLDCRP
    FROSSN <- crop@FROSSN
    NHRICE <- crop@NHRICE
    VARFLD <- crop@VARFLD
    FLOOD <- cropsv@FLOOD[length(cropsv@FLOOD)]
    FROST <- cropsv@FROST[length(cropsv@FROST)]
    TMIN <- EDTSsv@TMIN[length(EDTSsv@TMIN)]
    DS <- phenology@DS[length(phenology@DS)]
    AWF1 <- SWBsv@AWF1[length(SWBsv@AWF1)]
    POND <- SWBsv@POND[length(SWBsv@POND)]
    FLDFAC <- tabFunction@FLDFAC
    FLODDS <- tabFunction@FLODDS
    FRSTDS <- tabFunction@FRSTDS
    FROSTD <- tabFunction@FROSTD
    FLDDAY <- INSW(AWF1 - 1.2, INSW(POND - 0.1, -FLOOD, 1), 1)
    FLOOD <- FLDDAY
    FLODLS <- LIMIT(0, 1, AFGEN(FLDFAC, FLOOD) * FLDCRP * VARFLD * 
        INSW(FLOOD - 2, 1, AFGEN(FLODDS, DS)))
    FLDLOS <- INSW(SWCPOT - 1, INSW(NHRICE - 0.3, FLODLS, 1), 
        1)
    FRSDAY <- INSW(TMIN - FROSSN, 1, -FROST)
    FROST <- FRSDAY
    FRDMG <- LIMIT(0, 1, AFGEN(FROSTD, FROST) * INSW(FROST - 
        1, 1, AFGEN(FRSTDS, DS)) + INSW(AWF1 - 0.9, 0, -0.2))
    j <- length(cropsv@FLDLOS) + 1
    cropsv@FLDLOS[j] <- FLDLOS
    cropsv@FLOOD[j] <- FLOOD
    cropsv@FRDMG[j] <- FRDMG
    cropsv@FROST[j] <- FROST
    return(cropsv)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
