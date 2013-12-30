\name{evapoTranspiration}
\alias{evapoTranspiration}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Update evapotranspiration
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
evapoTranspiration(control, root, soilD, srFUFR, srSOIL, srSUBPET, SWBsv, tabFunction, cropsv)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{root}{
%%     ~~Describe \code{root} here~~
}
  \item{soilD}{
%%     ~~Describe \code{soilD} here~~
}
  \item{srFUFR}{
%%     ~~Describe \code{srFUFR} here~~
}
  \item{srSOIL}{
%%     ~~Describe \code{srSOIL} here~~
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
function (DINDEXs, control, root, soilD, srFUFR, srSOIL, srSUBPET, 
    SWBsv, tabFunction, cropsv) 
{
    DELT <- control@DELT
    IDSLR <- control@IDSLR
    TKL3 <- control@TKL3[length(control@TKL3)]
    DSLR <- cropsv@DSLR[length(cropsv@DSLR)]
    FLDLOS <- cropsv@FLDLOS[length(cropsv@FLDLOS)]
    WEEDCV <- cropsv@WEEDCV[length(cropsv@WEEDCV)]
    ZRT1 <- root@ZRT1[length(root@ZRT1)]
    ZRT2 <- root@ZRT2[length(root@ZRT2)]
    ZRT3 <- root@ZRT3[length(root@ZRT3)]
    SAND1 <- soilD@SAND1
    TKL1 <- soilD@TKL1
    TKL2 <- soilD@TKL2
    WSE1 <- srFUFR@WSE1[length(srFUFR@WSE1)]
    WSE2 <- srFUFR@WSE2[length(srFUFR@WSE2)]
    WSE3 <- srFUFR@WSE3[length(srFUFR@WSE3)]
    WCAD1 <- srSOIL@WCAD1[length(srSOIL@WCAD1)]
    WCAD2 <- srSOIL@WCAD2[length(srSOIL@WCAD2)]
    WCAD3 <- srSOIL@WCAD3[length(srSOIL@WCAD3)]
    PEVAP <- srSUBPET@PEVAP[length(srSUBPET@PEVAP)]
    PTRANS <- srSUBPET@PTRANS[length(srSUBPET@PTRANS)]
    AWF1 <- SWBsv@AWF1[length(SWBsv@AWF1)]
    AWF2 <- SWBsv@AWF2[length(SWBsv@AWF2)]
    AWF3 <- SWBsv@AWF3[length(SWBsv@AWF3)]
    PNDEVP <- SWBsv@PNDEVP[length(SWBsv@PNDEVP)]
    POND <- SWBsv@POND[length(SWBsv@POND)]
    WL1 <- SWBsv@WL1[length(SWBsv@WL1)]
    WL2 <- SWBsv@WL2[length(SWBsv@WL2)]
    WL3 <- SWBsv@WL3[length(SWBsv@WL3)]
    WLFL1 <- SWBsv@WLFL1[length(SWBsv@WLFL1)]
    EDPTFT <- tabFunction@EDPTFT
    EESTAB <- tabFunction@EESTAB
    ERLB <- ZRT1 * AFGEN(EDPTFT, AWF1) + ZRT2 * AFGEN(EDPTFT, 
        AWF2)
    +ZRT3 * AFGEN(EDPTFT, AWF3)
    TRRM <- PTRANS * FLDLOS/(ERLB + 1e-10)
    TRWL1 <- TRRM * WSE1 * ZRT1 * AFGEN(EDPTFT, AWF1)
    TRWL2 <- TRRM * WSE2 * ZRT2 * AFGEN(EDPTFT, AWF2)
    TRWL3 <- TRRM * WSE3 * ZRT3 * AFGEN(EDPTFT, AWF3)
    ATRANS <- TRWL1 + TRWL2 + TRWL3
    TATRAN <- ATRANS
    PEVAPC <- PEVAP - PEVAP * AMIN1(0.95, WEEDCV)
    DSLRRT <- INSW(POND - 0.5, 1, -(DSLR - 1)/DELT)
    DSLR <- IDSLR + DSLRRT
    EVSD <- AMAX1(0, AMIN1(PEVAPC, PEVAPC/(DSLR + 0.001)^0.5))
    EVSH <- AMAX1(0, AMIN1(PEVAPC, (WL1 - WCAD1 * TKL1)/DELT + 
        WLFL1))
    AEVAP <- INSW(POND - 0.5, EVSD, EVSH)
    EES <- AFGEN(EESTAB, SAND1)
    FEVL1 <- AMAX1(WL1 - WCAD1 * TKL1, 0.1) * exp(-EES * (0.5 * 
        TKL1))
    FEVL2 <- AMAX1(WL2 - WCAD2 * TKL2, 0.1) * exp(-EES * (TKL1 + 
        (0.5 * TKL2)))
    FEVL3 <- AMAX1(WL3 - WCAD3 * TKL3, 0.1) * exp(-EES * (TKL1 + 
        TKL2 + (0.5 * TKL3)))
    AEVAPC <- LIMIT(0, AEVAP, AEVAP - PNDEVP)
    EVSW1 <- AEVAPC * FEVL1/(FEVL1 + FEVL2 + FEVL3)
    EVSW2 <- AEVAPC * FEVL2/(FEVL1 + FEVL2 + FEVL3)
    EVSW3 <- AEVAPC * FEVL3/(FEVL1 + FEVL2 + FEVL3)
    TAEVAP <- AEVAP
    ETDAY <- ATRANS + AEVAP
    ETSUM <- ETDAY
    j <- length(cropsv@DINDEX) + 1
    cropsv@DINDEX[j] <- DINDEXs
    cropsv@ATRANS[j] <- ATRANS
    cropsv@DSLR[j] <- DSLR
    cropsv@ETDAY[j] <- ETDAY
    cropsv@EVSW1[j] <- EVSW1
    cropsv@EVSW2[j] <- EVSW2
    cropsv@EVSW3[j] <- EVSW3
    cropsv@TRWL1[j] <- TRWL1
    cropsv@TRWL2[j] <- TRWL2
    cropsv@TRWL3[j] <- TRWL3
    return(cropsv)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
