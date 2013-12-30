\name{SUBR_GLA}
\alias{SUBR_GLA}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Leaf area subroutine
}
\description{
This subroutine computes daily increase of leaf area index (ha leaf/ ha ground/ d)   }
\usage{
SUBR_GLA(control, cropsv, GRsv, management, phenology, stress, srGLA)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{cropsv}{
%%     ~~Describe \code{cropsv} here~~
}
  \item{GRsv}{
%%     ~~Describe \code{GRsv} here~~
}
  \item{management}{
%%     ~~Describe \code{management} here~~
}
  \item{phenology}{
%%     ~~Describe \code{phenology} here~~
}
  \item{stress}{
%%     ~~Describe \code{stress} here~~
}
  \item{srGLA}{
%%     ~~Describe \code{srGLA} here~~
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
function (DINDEXs, control, cropsv, GRsv, management, phenology, 
    stress, srGLA) 
{
    DELT <- control@DELT
    LAII <- control@LAII[length(control@LAII)]
    LAI <- cropsv@LAI[length(cropsv@LAI)]
    RGRL <- cropsv@RGRL[length(cropsv@RGRL)]
    SLA <- cropsv@SLA[length(cropsv@SLA)]
    RWLVG <- GRsv@RWLVG[length(GRsv@RWLVG)]
    ESW <- management@ESW[length(management@ESW)]
    ESWI <- management@ESWI[length(management@ESWI)]
    DS <- phenology@DS[length(phenology@DS)]
    HUVG <- phenology@HUVG[length(phenology@HUVG)]
    WSTRES <- stress@WSTRES[length(stress@WSTRES)]
    GLAI <- AMAX1(0, SLA * RWLVG)
    if ((DS < 0.2) && (LAI < 0.75)) 
        GLAI <- AMAX1(0, LAII * (exp(RGRL * HUVG)) * WSTRES)
    if (RGRL <= 0) 
        GLAI <- 0
    if (ESW == 1) 
        GLAI <- AMAX1(0, LAII/DELT)
    if (ESWI == 0) 
        GLAI <- 0
    j <- length(srGLA@DINDEX) + 1
    srGLA@DINDEX[j] <- DINDEXs
    srGLA@GLAI[j] <- GLAI
    return(srGLA)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
