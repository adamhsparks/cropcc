\name{initialConditions_runControl}
\alias{initialConditions_runControl}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
initialConditions_runControl(DINDEXs, crop, cropsv, management, pestD, phenology, soilD, tabFunction, weather, control)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{DINDEXs}{
%%     ~~Describe \code{DINDEXs} here~~
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
  \item{pestD}{
%%     ~~Describe \code{pestD} here~~
}
  \item{phenology}{
%%     ~~Describe \code{phenology} here~~
}
  \item{soilD}{
%%     ~~Describe \code{soilD} here~~
}
  \item{tabFunction}{
%%     ~~Describe \code{tabFunction} here~~
}
  \item{weather}{
%%     ~~Describe \code{weather} here~~
}
  \item{control}{
%%     ~~Describe \code{control} here~~
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
function (DINDEXs, crop, cropsv, management, pestD, phenology, 
    soilD, tabFunction, weather, control) 
{
    DSI <- control@DSI
    SEEDRT <- control@SEEDRT
    SWCPOT <- control@SWCPOT
    FRLVWT <- crop@FRLVWT
    GREENF <- crop@GREENF
    POTATO <- crop@POTATO
    SLAVAR <- crop@SLAVAR
    LAI <- cropsv@LAI[length(cropsv@LAI)]
    PUDLE <- management@PUDLE[length(management@PUDLE)]
    SOWDEP <- management@SOWDEP[length(management@SOWDEP)]
    SWCNIT <- management@SWCNIT[length(management@SWCNIT)]
    SWCWAT <- management@SWCWAT[length(management@SWCWAT)]
    RGMPST <- pestD@RGMPST
    DS <- phenology@DS[length(phenology@DS)]
    BDM1 <- soilD@BDM1
    BDM2 <- soilD@BDM2
    BDM3 <- soilD@BDM3
    NO31II <- soilD@NO31II
    NO32II <- soilD@NO32II
    NO33II <- soilD@NO33II
    SOC1 <- soilD@SOC1
    SOC2 <- soilD@SOC2
    SOC3 <- soilD@SOC3
    TKL1 <- soilD@TKL1
    TKL2 <- soilD@TKL2
    TKL3M <- soilD@TKL3M
    WCFCM1 <- soilD@WCFCM1
    WCFCM2 <- soilD@WCFCM2
    WCFCM3 <- soilD@WCFCM3
    FCSDEP <- tabFunction@FCSDEP
    NMAXLT <- tabFunction@NMAXLT
    SLACF <- tabFunction@SLACF
    TMMN <- weather@TMMN[weather@DINDEX == DINDEXs]
    TMMX <- weather@TMMX[weather@DINDEX == DINDEXs]
    TPSI <- 0.5 * (TMMX + TMMN)
    TKL3 <- INSW(PUDLE - 0.5, TKL3M, 0.1)
    WCLI1 <- WCFCM1 * 0.9
    WCLI2 <- WCFCM2 * 0.8
    WCLI3 <- WCFCM3 * 0.75
    WL1I <- WCLI1 * TKL1
    WL2I <- WCLI2 * TKL2
    WL3I <- WCLI3 * TKL3
    WLVI <- SEEDRT * AFGEN(FCSDEP, SOWDEP) * FRLVWT * RGMPST
    WRTI <- SEEDRT - WLVI
    LAII <- WLVI * SLAVAR * AFGEN(SLACF, DSI)
    NRTI <- WRTI * AFGEN(NMAXLT, DSI) * GREENF * 0.5
    NLVI <- WLVI * AFGEN(NMAXLT, DSI) * GREENF
    SOC1KG <- SOC1 * TKL1/150 * 22000 * INSW(PUDLE - 0.98, BDM1/1.56, 
        1)
    SOC2KG <- SOC2 * TKL2/150 * 22000 * INSW(PUDLE - 0.98, BDM2/1.56, 
        1)
    SOC3KG <- SOC3 * TKL3/150 * 22000 * INSW(PUDLE - 0.98, BDM3/1.56, 
        1)
    NO31I <- NO31II
    NO32I <- NO32II
    NO33I <- NO33II
    SWXWAT <- INSW(SWCPOT - 1, INSW(SWCWAT - 1, 0, 1), 1)
    SWXNIT <- INSW(SWCPOT - 1, INSW(SWCNIT - 1, 0, 1), 1)
    FPOTAT <- INSW(POTATO - 1, 10, INSW(DS - 0.75, 10, INSW(LAI - 
        0.08, -1, 1)))
    j <- length(control@LAII) + 1
    control@FPOTAT[j] <- FPOTAT
    control@LAII[j] <- LAII
    control@NLVI[j] <- NLVI
    control@NRTI[j] <- NRTI
    control@NO31I[j] <- NO31I
    control@NO32I[j] <- NO32I
    control@NO33I[j] <- NO33I
    control@SOC1KG[j] <- SOC1KG
    control@SOC2KG[j] <- SOC2KG
    control@SOC3KG[j] <- SOC3KG
    control@SWXNIT[j] <- SWXNIT
    control@SWXWAT[j] <- SWXWAT
    control@TKL3[j] <- TKL3
    control@TPSI[j] <- TPSI
    control@WL1I[j] <- WL1I
    control@WL2I[j] <- WL2I
    control@WL3I[j] <- WL3I
    control@WLVI[j] <- WLVI
    control@WRTI[j] <- WRTI
    return(control)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
