\name{growthRates}
\alias{growthRates}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
growthRates(DINDEXs, control, crop, cropsv, management, phenology, root, stress, tabFunction, GRsv)
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
  \item{management}{
%%     ~~Describe \code{management} here~~
}
  \item{phenology}{
%%     ~~Describe \code{phenology} here~~
}
  \item{root}{
%%     ~~Describe \code{root} here~~
}
  \item{stress}{
%%     ~~Describe \code{stress} here~~
}
  \item{tabFunction}{
%%     ~~Describe \code{tabFunction} here~~
}
  \item{GRsv}{
%%     ~~Describe \code{GRsv} here~~
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
function (DINDEXs, control, crop, cropsv, management, phenology, 
    root, stress, tabFunction, GRsv) 
{
    FWCANE <- control@FWCANE
    WLVI <- control@WLVI[length(control@WLVI)]
    WRTI <- control@WRTI[length(control@WRTI)]
    WSTI <- control@WSTI
    ENERGY <- crop@ENERGY
    AGFR <- cropsv@AGFR[length(cropsv@AGFR)]
    DLV <- cropsv@DLV[length(cropsv@DLV)]
    DST <- cropsv@DST[length(cropsv@DST)]
    GCROP <- cropsv@GCROP[length(cropsv@GCROP)]
    PLTR <- cropsv@PLTR[length(cropsv@PLTR)]
    SUCKLV <- cropsv@SUCKLV[length(cropsv@SUCKLV)]
    SUCKSO <- cropsv@SUCKSO[length(cropsv@SUCKSO)]
    SUCKST <- cropsv@SUCKST[length(cropsv@SUCKST)]
    WSO <- cropsv@WSO[length(cropsv@WSO)]
    LSTR <- GRsv@LSTR[length(GRsv@LSTR)]
    RWLVG <- GRsv@RWLVG[length(GRsv@RWLVG)]
    RWRT <- GRsv@RWRT[length(GRsv@RWRT)]
    RWSO <- GRsv@RWSO[length(GRsv@RWSO)]
    RWST <- GRsv@RWST[length(GRsv@RWST)]
    WIR <- GRsv@WIR[length(GRsv@WIR)]
    WLVG <- GRsv@WLVG[length(GRsv@WLVG)]
    WLVD <- GRsv@WLVD[length(GRsv@WLVD)]
    WRT <- GRsv@WRT[length(GRsv@WRT)]
    WST <- GRsv@WST[length(GRsv@WST)]
    WSTD <- GRsv@WSTD[length(GRsv@WSTD)]
    ESW <- management@ESW[length(management@ESW)]
    DS <- phenology@DS[length(phenology@DS)]
    RTDETH <- root@RTDETH[length(root@RTDETH)]
    NSTRES <- stress@NSTRES[length(stress@NSTRES)]
    WSTRES <- stress@WSTRES[length(stress@WSTRES)]
    FLVTB <- tabFunction@FLVTB
    FRTTB <- tabFunction@FRTTB
    FSTRT <- tabFunction@FSTRT
    FSTTB <- tabFunction@FSTTB
    LLVN <- tabFunction@LLVN
    LLVST <- tabFunction@LLVST
    CFPART <- AMAX1(AFGEN(LLVN, NSTRES), AFGEN(LLVST, WSTRES))
    FRT <- AFGEN(FRTTB, DS) * CFPART
    FSH <- 1 - FRT
    FLV <- AFGEN(FLVTB, DS)
    FST <- AFGEN(FSTTB, DS)
    FSO <- 1 - (FLV + FST)
    GrowthRmod <- function(Time, State, Pars) {
        with(as.list(State), {
            dWLVG <- WLVI * ESW + RWLVG
            dWLVD <- DLV
            dWST <- WSTI * ESW + RWST
            dWSTD <- DST
            dWRT <- WRTI * ESW + RWRT - RTDETH
            dWIR <- GCROP * FSH * FST * AFGEN(FSTRT, DS) + AMAX1(0, 
                RWSO - AGFR) - AMIN1(WIR, LSTR + SUCKST + WIR * 
                (1 - PLTR))
            WLEAF <- WLVG + WLVD
            WSTEM <- (WST + WIR) * FWCANE
            TDM <- WLEAF + WSTEM + WSTD + WSO/ENERGY
            RWLVG <- GCROP * FSH * FLV - AMIN1(WLVG, DLV + SUCKLV + 
                WLVG * (1 - PLTR))
            RWST <- GCROP * FSH * FST * (1 - AFGEN(FSTRT, DS)) - 
                AMIN1(WST, DST + WST * (1 - PLTR))
            RWSO <- AMAX1(0, GCROP * FSH * FSO) - AMIN1(WSO, 
                SUCKSO)
            RWRT <- GCROP * FRT - AMIN1(WRT, WRT * (1 - PLTR))
            LSTR <- INSW(DS - 1, 0, WIR * 0.1)
            return(list(c(dWLVG, dWLVD, dWST, dWSTD, dWRT, dWIR), 
                TDM, RWLVG, RWST, RWSO, RWRT, LSTR, WSTEM))
        })
    }
    yini <- c(WLVG = WLVG, WLVD = WLVD, WST = WST, WSTD = WSTD, 
        WRT = WRT, WIR = WIR)
    times <- seq(0, 1, 1)
    out <- ode(yini, times, GrowthRmod, parms = NULL)
    WLVG <- out[2, 2]
    WLVD <- out[2, 3]
    WST <- out[2, 4]
    WSTD <- out[2, 5]
    WRT <- out[2, 6]
    WIR <- out[2, 7]
    TDM <- out[2, 8]
    RWLVG <- out[2, 9]
    RWST <- out[2, 10]
    RWSO <- out[2, 11]
    RWRT <- out[2, 12]
    LSTR <- out[2, 13]
    WSTEM <- out[2, 14]
    j <- length(GRsv@DINDEX) + 1
    GRsv@DINDEX[j] <- DINDEXs
    GRsv@LSTR[j] <- LSTR
    GRsv@RWLVG[j] <- RWLVG
    GRsv@RWRT[j] <- RWRT
    GRsv@RWSO[j] <- RWSO
    GRsv@RWST[j] <- RWST
    GRsv@TDM[j] <- TDM
    GRsv@WIR[j] <- WIR
    GRsv@WLVD[j] <- WLVD
    GRsv@WLVG[j] <- WLVG
    GRsv@WRT[j] <- WRT
    GRsv@WST[j] <- WST
    GRsv@WSTD[j] <- WSTD
    GRsv@WSTEM[j] <- WSTEM
    return(GRsv)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
