\name{SUBR_SUBDD}
\alias{SUBR_SUBDD}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Heat units subroutine
}
\description{
This subroutine calculates the daily amount of heat units for calculation of the phenological development rate and early leaf area growth.}
\usage{
SUBR_SUBDD(crop, EDTSsv, srSUBDD)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{crop}{
%%     ~~Describe \code{crop} here~~
}
  \item{EDTSsv}{
%%     ~~Describe \code{EDTSsv} here~~
}
  \item{srSUBDD}{
%%     ~~Describe \code{srSUBDD} here~~
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
function (DINDEXs, crop, EDTSsv, srSUBDD) 
{
    TPMAXD <- crop@TPMAXD
    TPOPT <- crop@TPOPT
    TVBD <- crop@TVBD
    TMAX <- EDTSsv@TMAX[length(EDTSsv@TMAX)]
    TMIN <- EDTSsv@TMIN[length(EDTSsv@TMIN)]
    TM <- (TMAX + TMIN)/2
    TT <- 0
    for (I in 1:24) {
        TD <- TM + 0.5 * abs(TMAX - TMIN) * cos(0.2618 * (I - 
            14))
        if ((TD > TVBD) && (TD < TPMAXD)) {
            if (TD > TPOPT) 
                TD <- TPOPT - (TD - TPOPT) * (TPOPT - TVBD)/(TPMAXD - 
                  TPOPT)
            TT <- TT + (TD - TVBD)/24
        }
    }
    j <- length(srSUBDD@HU) + 1
    srSUBDD@HU[j] <- TT
    srSUBDD@DINDEX[j] <- DINDEXs
    return(srSUBDD)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
