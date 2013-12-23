\name{SUBR_FUFR}
\alias{SUBR_FUFR}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Water stress subroutine
}
\description{
Computes factors accounting for water stress effect on water uptake.
}
\usage{
SUBR_FUFR(DINDEXs, crop, soil, srSUBPET, SWBsv, srFUFR)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{DINDEXs}{
%%     ~~Describe \code{DINDEXs} here~~
}
  \item{crop}{
%%     ~~Describe \code{crop} here~~
}
  \item{soil}{
%%     ~~Describe \code{soil} here~~
}
  \item{srSUBPET}{
%%     ~~Describe \code{srSUBPET} here~~
}
  \item{SWBsv}{
%%     ~~Describe \code{SWBsv} here~~
}
  \item{srFUFR}{
%%     ~~Describe \code{srFUFR} here~~
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
function (DINDEXs, crop, soil, srSUBPET, SWBsv, srFUFR) 
{
    CROPFC <- crop@CROPFC
    CROPGR <- crop@CROPGR
    RICE <- crop@RICE
    WCFC1 <- soil@WCFC1[length(soil@WCFC1)]
    WCFC2 <- soil@WCFC2[length(soil@WCFC2)]
    WCFC3 <- soil@WCFC3[length(soil@WCFC3)]
    WCST1 <- soil@WCST1[length(soil@WCST1)]
    WCST2 <- soil@WCST2[length(soil@WCST2)]
    WCST3 <- soil@WCST3[length(soil@WCST3)]
    WCWP1 <- soil@WCWP1[length(soil@WCWP1)]
    WCWP2 <- soil@WCWP2[length(soil@WCWP2)]
    WCWP3 <- soil@WCWP3[length(soil@WCWP3)]
    PTRANS <- srSUBPET@PTRANS[length(srSUBPET@PTRANS)]
    WCL1 <- SWBsv@WCL1[length(SWBsv@WCL1)]
    WCL2 <- SWBsv@WCL2[length(SWBsv@WCL2)]
    WCL3 <- SWBsv@WCL3[length(SWBsv@WCL3)]
    P <- AMIN1(0.95, AMAX1(0.1, CROPGR/(CROPGR + PTRANS)))
    WCCR1 <- WCWP1 + (1 - P) * (WCFC1 - WCWP1)
    WCCR2 <- WCWP2 + (1 - P) * (WCFC2 - WCWP2)
    WCCR3 <- WCWP3 + (1 - P) * (WCFC3 - WCWP3)
    WCWET1 <- CROPFC * WCST1
    WCWET2 <- CROPFC * WCST2
    WCWET3 <- CROPFC * WCST3
    if ((WCL1 > WCWET1) && (RICE > 0)) 
        FR1 <- 1
    if ((WCL2 > WCWET2) && (RICE > 0)) 
        FR2 <- 1
    if ((WCL3 > WCWET3) && (RICE > 0)) 
        FR3 <- 1
    if ((WCL1 > WCWET1) && (RICE <= 0)) {
        FR1 <- (WCST1 - WCL1)/(WCST1 - WCWET1 + 1e-06)
    }
    else {
        if (WCL1 > WCCR1) {
            FR1 <- 1
        }
        else {
            FR1 <- (WCL1 - WCWP1)/(WCCR1 - WCWP1 + 1e-06)
        }
    }
    if ((WCL2 > WCWET2) && (RICE <= 0)) {
        FR2 <- (WCST2 - WCL2)/(WCST2 - WCWET2 + 1e-06)
    }
    else {
        if (WCL2 > WCCR2) {
            FR2 <- 1
        }
        else {
            FR2 <- (WCL2 - WCWP2)/(WCCR2 - WCWP2 + 1e-06)
        }
    }
    if ((WCL3 > WCWET3) && (RICE <= 0)) {
        FR3 <- (WCST3 - WCL3)/(WCST3 - WCWET3 + 1e-06)
    }
    else {
        if (WCL3 > WCCR3) {
            FR3 <- 1
        }
        else {
            FR3 <- (WCL3 - WCWP3)/(WCCR3 - WCWP3 + 1e-06)
        }
    }
    WSE1 <- AMIN1(1, AMAX1(0, FR1))
    WSE2 <- AMIN1(1, AMAX1(0, FR2))
    WSE3 <- AMIN1(1, AMAX1(0, FR3))
    j <- length(srFUFR@DINDEX) + 1
    srFUFR@DINDEX[j] <- DINDEXs
    srFUFR@WSE1[j] <- WSE1
    srFUFR@WSE2[j] <- WSE2
    srFUFR@WSE3[j] <- WSE3
    return(srFUFR)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
