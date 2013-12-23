\name{SUBR_WSRT}
\alias{SUBR_WSRT}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Root extension subroutine
}
\description{
Decides if root extension growth continues or ceases.
}
\usage{
SUBR_WSRT(DINDEXs, control, root, soil, soilD, SWBsv, srWSRT)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{DINDEXs}{
%%     ~~Describe \code{DINDEXs} here~~
}
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{root}{
%%     ~~Describe \code{root} here~~
}
  \item{soil}{
%%     ~~Describe \code{soil} here~~
}
  \item{soilD}{
%%     ~~Describe \code{soilD} here~~
}
  \item{SWBsv}{
%%     ~~Describe \code{SWBsv} here~~
}
  \item{srWSRT}{
%%     ~~Describe \code{srWSRT} here~~
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
function (DINDEXs, control, root, soil, soilD, SWBsv, srWSRT) 
{
    TKL3 <- control@TKL3[length(control@TKL3)]
    ZRT <- root@ZRT[length(root@ZRT)]
    WCWP1 <- soil@WCWP1[length(soil@WCWP1)]
    WCWP2 <- soil@WCWP2[length(soil@WCWP2)]
    WCWP3 <- soil@WCWP3[length(soil@WCWP3)]
    TKL1 <- soilD@TKL1
    TKL2 <- soilD@TKL2
    WCL1 <- SWBsv@WCL1[length(SWBsv@WCL1)]
    WCL2 <- SWBsv@WCL2[length(SWBsv@WCL2)]
    WCL3 <- SWBsv@WCL3[length(SWBsv@WCL3)]
    WSERT <- 1
    if ((ZRT < TKL1) && (WCL1 < WCWP1)) 
        WSERT <- 0
    if ((ZRT > TKL1) && (ZRT < (TKL1 + TKL2)) && (WCL2 < WCWP2)) 
        WSERT <- 0
    if ((ZRT > (TKL1 + TKL2)) && (ZRT < (TKL1 + TKL2 + TKL3)) && 
        (WCL3 < WCWP3)) 
        WSERT <- 0
    j <- length(srWSRT@DINDEX) + 1
    srWSRT@DINDEX[j] <- DINDEXs
    srWSRT@WSERT[j] <- WSERT
    return(srWSRT)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
