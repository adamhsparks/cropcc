\name{rootingDepth2}
\alias{rootingDepth2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Rooting depth
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
rootingDepth2(control, crop, cropsv, GRsv, management, phenology, soil, soilD, srWSRT, tabFunction, root)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{crop}{
%%     ~~Describe \code{crop} here~~
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
  \item{soil}{
%%     ~~Describe \code{soil} here~~
}
  \item{soilD}{
%%     ~~Describe \code{soilD} here~~
}
  \item{srWSRT}{
%%     ~~Describe \code{srWSRT} here~~
}
  \item{tabFunction}{
%%     ~~Describe \code{tabFunction} here~~
}
  \item{root}{
%%     ~~Describe \code{root} here~~
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
function (control, crop, cropsv, GRsv, management, phenology, 
    soil, soilD, srWSRT, tabFunction, root) 
{
    TKL3 <- control@TKL3[length(control@TKL3)]
    TTVG <- crop@TTVG
    ZRTI <- crop@ZRTI
    ZRTDS <- crop@ZRTDS
    ZRTMS <- crop@ZRTMS
    ZRTPOT <- crop@ZRTPOT
    FLDLOS <- cropsv@FLDLOS[length(cropsv@FLDLOS)]
    RWRT <- GRsv@RWRT[length(GRsv@RWRT)]
    ESW <- management@ESW[length(management@ESW)]
    ESWI <- management@ESWI[length(management@ESWI)]
    DS <- phenology@DS[length(phenology@DS)]
    ZRT <- root@ZRT[length(root@ZRT)]
    BD1 <- soil@BD1[length(soil@BD1)]
    BD2 <- soil@BD2[length(soil@BD2)]
    BD3 <- soil@BD3[length(soil@BD3)]
    TKLT <- soil@TKLT[length(soil@TKLT)]
    TKL1 <- soilD@TKL1
    TKL2 <- soilD@TKL2
    WSERT <- srWSRT@WSERT[length(srWSRT@WSERT)]
    EZRTTB <- tabFunction@EZRTTB
    RTMAX <- tabFunction@RTMAX
    BDSEL <- INSW(ZRT - TKL1, BD1, INSW(ZRT - TKL1 - TKL2, BD2, 
        BD3))
    EZRTC <- ZRTPOT * AFGEN(EZRTTB, BDSEL)
    ZRTM <- AMIN1(AFGEN(RTMAX, TTVG), ZRTMS, TKLT)
    EZRT <- ZRTI * ESW + (EZRTC * ESWI * WSERT * REAAND(ZRTM - 
        ZRT, ZRTDS - DS) * INSW(-DS, 1, 0) * FLDLOS) * INSW(RWRT - 
        1, 0, 1)
    ZRT <- EZRT
    ZRT1 <- LIMIT(0, TKL1, ZRT)
    ZRT2 <- LIMIT(0, TKL2, ZRT - TKL1)
    ZRT3 <- LIMIT(0, TKL3, ZRT - TKL1 - TKL2)
    j <- length(root@ZRT) + 1
    root@ZRT[j] <- ZRT
    root@ZRT1[j] <- ZRT1
    root@ZRT2[j] <- ZRT2
    root@ZRT3[j] <- ZRT3
    return(root)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
