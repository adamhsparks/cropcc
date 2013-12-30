\name{soilwaterBalance}
\alias{soilwaterBalance}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Soil water balance
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
soilwaterBalance(TIME, control, cropsv, EDTSsv, management, soil, soilD, srSUBPET, tabFunction, weather, SWBsv)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{TIME}{
%%     ~~Describe \code{control} here~~
}
\item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{cropsv}{
%%     ~~Describe \code{cropsv} here~~
}
  \item{EDTSsv}{
%%     ~~Describe \code{EDTSsv} here~~
}
  \item{management}{
%%     ~~Describe \code{management} here~~
}
  \item{soil}{
%%     ~~Describe \code{soil} here~~
}
  \item{soilD}{
%%     ~~Describe \code{soilD} here~~
}
  \item{srSUBPET}{
%%     ~~Describe \code{srSUBPET} here~~
}
  \item{tabFunction}{
%%     ~~Describe \code{tabFunction} here~~
}
  \item{weather}{
%%     ~~Describe \code{weather} here~~
}
  \item{SWBsv}{
%%     ~~Describe \code{SWBsv} here~~
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
function (DINDEXs, control, cropsv, EDTSsv, management, soil, 
    soilD, srSUBPET, tabFunction, weather, SWBsv) 
{
    INPOND <- control@INPOND
    IRRSEN <- control@IRRSEN
    TKL3 <- control@TKL3[length(control@TKL3)]
    SWXWAT <- control@SWXWAT[length(control@SWXWAT)]
    WL1I <- control@WL1I[length(control@WL1I)]
    WL2I <- control@WL2I[length(control@WL2I)]
    WL3I <- control@WL3I[length(control@WL3I)]
    LAI <- cropsv@LAI[length(cropsv@LAI)]
    ETDAY <- cropsv@ETDAY[length(cropsv@ETDAY)]
    EVSW1 <- cropsv@EVSW1[length(cropsv@EVSW1)]
    EVSW2 <- cropsv@EVSW2[length(cropsv@EVSW2)]
    EVSW3 <- cropsv@EVSW3[length(cropsv@EVSW3)]
    TRWL1 <- cropsv@TRWL1[length(cropsv@TRWL1)]
    TRWL2 <- cropsv@TRWL2[length(cropsv@TRWL2)]
    TRWL3 <- cropsv@TRWL3[length(cropsv@TRWL3)]
    WEEDCV <- cropsv@WEEDCV[length(cropsv@WEEDCV)]
    DSTART <- EDTSsv@DSTART[length(EDTSsv@DSTART)]
    RAINF <- EDTSsv@RAINF[length(EDTSsv@RAINF)]
    BUNDHT <- management@BUNDHT[length(management@BUNDHT)]
    DAS <- management@DAS[length(management@DAS)]
    IRSWCH <- management@IRSWCH[length(management@IRSWCH)]
    KSAT1 <- soil@KSAT1[length(soil@KSAT1)]
    KSAT3 <- soil@KSAT3[length(soil@KSAT3)]
    WCFC1 <- soil@WCFC1[length(soil@WCFC1)]
    WCFC2 <- soil@WCFC2[length(soil@WCFC2)]
    WCFC3 <- soil@WCFC3[length(soil@WCFC3)]
    WCST1 <- soil@WCST1[length(soil@WCST1)]
    WCST2 <- soil@WCST2[length(soil@WCST2)]
    WCST3 <- soil@WCST3[length(soil@WCST3)]
    WCWP1 <- soil@WCWP1[length(soil@WCWP1)]
    WCWP2 <- soil@WCWP2[length(soil@WCWP2)]
    WCWP3 <- soil@WCWP3[length(soil@WCWP3)]
    SLOPE <- soilD@SLOPE
    TKL1 <- soilD@TKL1
    TKL2 <- soilD@TKL2
    PEVAP <- srSUBPET@PEVAP[length(srSUBPET@PEVAP)]
    SWBsv@PONDTP[1] <- INPOND
    SWBsv@WL1T[1] <- WL1I
    SWBsv@WL2T[1] <- WL2I
    SWBsv@WL3T[1] <- WL3I
    SWBsvList <- .dataObjectExtract(SWBsv, "last")
    for (j in 1:length(SWBsvList)) assign(names(SWBsvList)[j], 
        SWBsvList[j])
    IRRTSF <- tabFunction@IRRTSF
    IRRTL1 <- tabFunction@IRRTL1
    IRRTL2 <- tabFunction@IRRTL2
    IRRTL3 <- tabFunction@IRRTL3
    RNSOIL <- tabFunction@RNSOIL
    weatherList <- .dataObjectExtract(weather, DINDEXs + 1)
    for (j in 1:length(weatherList)) assign(names(weatherList)[j], 
        weatherList[j])
    AINTC <- AMIN1(RAINF, 0.25 * LAI)
    IRRADD <- INSW(IRSWCH - 1, 0, 60 * REAAND(DAS - 20, 22 - 
        DAS) + 60 * REAAND(DAS - 45, 47 - DAS) * IRRSEN + 60 * 
        REAAND(DAS - 70, 72 - DAS) + 60 * REAAND(DAS - 90, 92 - 
        DAS) + 60 * REAAND(DAS - 110, 112 - DAS) + 60 * REAAND(DAS - 
        130, 132 - DAS))
    WCL1 <- WL1/TKL1
    WCL2 <- WL2/TKL2
    WCL3 <- WL3/TKL3
    AWF1 <- INSW(SWXWAT - 1, (WCL1 - WCWP1)/(WCFC1 - WCWP1), 
        1)
    AWF2 <- INSW(SWXWAT - 1, (WCL2 - WCWP2)/(WCFC2 - WCWP2), 
        1)
    AWF3 <- INSW(SWXWAT - 1, (WCL3 - WCWP3)/(WCFC3 - WCWP3), 
        1)
    SWBmod <- function(Time, State, Pars) {
        with(as.list(State), {
            POND <- AMAX1(0, PONDTP)
            IRRIG0 <- AFGEN(IRRTSF, DSTART) + IRRADD
            IRRIG1 <- AFGEN(IRRTL1, DSTART)
            IRRIG2 <- AFGEN(IRRTL2, DSTART)
            IRRIG3 <- AFGEN(IRRTL3, DSTART)
            PNDEVP <- AMAX1(0, INSW(POND - PEVAP, POND, PEVAP))
            WLFL1 <- AMAX1(0, AMIN1(KSAT1, POND))
            WLFL2 <- AMAX1(0, WLFL1 + WL1 + IRRIG1 - TKL1 * WCFC1)
            WLFL3 <- AMAX1(0, WLFL2 + WL2 + IRRIG2 - TKL2 * WCFC2)
            WLFL4 <- AMAX1(0, WLFL3 + WL3 + IRRIG3 - TKL3 * WCFC3)
            DRAIN <- AMIN1(KSAT3, WLFL4)
            WLFL5 <- INSW((DRAIN - WLFL4), (WLFL4 - DRAIN), 0)
            WLFL6 <- INSW((DRAIN - WLFL4), AMAX1(0, WLFL5 - (WCST3 - 
                WCFC3) * TKL3), 0)
            WLFL7 <- INSW((DRAIN - WLFL4), AMAX1(0, WLFL6 - (WCST2 - 
                WCFC2) * TKL2), 0)
            WLFL8 <- INSW((DRAIN - WLFL4), AMAX1(0, WLFL7 - (WCST1 - 
                WCFC1) * TKL1), 0)
            RNOFF <- AMAX1(0, INSW(BUNDHT - 2, RUNNAT, 0) + POND - 
                AINTC - PNDEVP - WLFL1 + WLFL8 - BUNDHT)
            RUNNAT <- (RAINF + IRRIG0) * AFGEN(RNSOIL, SLOPE)
            WL1RT <- WLFL1 + IRRIG1 + WLFL7 - WLFL2 - WLFL8 - 
                EVSW1 - TRWL1 * (1 + WEEDCV)
            WL2RT <- WLFL2 + IRRIG2 + WLFL6 - WLFL3 - WLFL7 - 
                EVSW2 - TRWL2 * (1 + WEEDCV)
            WL3RT <- WLFL3 + IRRIG3 + WLFL5 - WLFL4 - WLFL6 - 
                EVSW3 - TRWL3 * (1 + WEEDCV)
            WL1 <- AMAX1(WCWP1 * TKL1, WL1T)
            WL2 <- AMAX1(WCWP2 * TKL2, WL2T)
            WL3 <- AMAX1(WCWP3 * TKL3, WL3T)
            dPONDTP <- RAINF + IRRIG0 - AINTC - PNDEVP - WLFL1 - 
                RNOFF + WLFL8
            dDAPOND <- INSW(POND - 10, -DAPOND, 1)
            dWL1T <- WL1RT
            dWL2T <- WL2RT
            dWL3T <- WL3RT
            return(list(c(dPONDTP, dDAPOND, dWL1T, dWL2T, dWL3T), 
                IRRIG0, IRRIG1, IRRIG2, IRRIG3, POND, WLFL1, 
                WLFL2, WLFL3, WLFL4, WLFL5, WLFL6, WLFL7, WLFL8, 
                PNDEVP, RNOFF, DRAIN, WL1RT, WL2RT, WL3RT))
        })
    }
    yini <- c(PONDTP = PONDTP, DAPOND = DAPOND, WL1T = WL1T, 
        WL2T = WL2T, WL3T = WL3T)
    times <- seq(0, 1, 1)
    out <- ode(yini, times, SWBmod, parms = NULL)
    PONDTP <- out[2, 2]
    DAPOND <- out[2, 3]
    WL1T <- out[2, 4]
    WL2T <- out[2, 5]
    WL3T <- out[2, 6]
    IRRIG0 <- out[2, 7]
    IRRIG1 <- out[2, 8]
    IRRIG2 <- out[2, 9]
    IRRIG3 <- out[2, 10]
    POND <- out[2, 11]
    WLFL1 <- out[2, 12]
    WLFL2 <- out[2, 13]
    WLFL3 <- out[2, 14]
    WLFL4 <- out[2, 15]
    WLFL5 <- out[2, 16]
    WLFL6 <- out[2, 17]
    WLFL7 <- out[2, 18]
    WLFL8 <- out[2, 19]
    PNDEVP <- out[2, 20]
    RNOFF <- out[2, 21]
    DRAIN <- out[2, 22]
    WL1RT <- out[2, 23]
    WL2RT <- out[2, 24]
    WL3RT <- out[2, 25]
    WL1 <- AMAX1(WCWP1 * TKL1, WL1T)
    WL2 <- AMAX1(WCWP2 * TKL2, WL2T)
    WL3 <- AMAX1(WCWP3 * TKL3, WL3T)
    WCUM <- WL1 + WL2 + WL3
    WATREQ <- ETDAY + RNOFF + DRAIN
    WATSUM <- WATREQ
    j <- length(SWBsv@DINDEX) + 1
    SWBsv@DINDEX[j] <- DINDEXs
    SWBsv@AWF1[j] <- AWF1
    SWBsv@AWF2[j] <- AWF2
    SWBsv@AWF3[j] <- AWF3
    SWBsv@DAPOND[j] <- DAPOND
    SWBsv@DRAIN[j] <- DRAIN
    SWBsv@PNDEVP[j] <- PNDEVP
    SWBsv@POND[j] <- POND
    SWBsv@PONDTP[j] <- PONDTP
    SWBsv@RNOFF[j] <- RNOFF
    SWBsv@WL1[j] <- WL1
    SWBsv@WL2[j] <- WL2
    SWBsv@WL3[j] <- WL3
    SWBsv@WL1T[j] <- WL1T
    SWBsv@WL2T[j] <- WL2T
    SWBsv@WL3T[j] <- WL3T
    SWBsv@WLFL1[j] <- WLFL1
    SWBsv@WLFL2[j] <- WLFL2
    SWBsv@WLFL3[j] <- WLFL3
    SWBsv@WLFL4[j] <- WLFL4
    SWBsv@WLFL5[j] <- WLFL5
    SWBsv@WLFL6[j] <- WLFL6
    SWBsv@WLFL7[j] <- WLFL7
    SWBsv@WLFL8[j] <- WLFL8
    SWBsv@IRRIG0[j] <- IRRIG0
    SWBsv@IRRIG1[j] <- IRRIG1
    SWBsv@IRRIG2[j] <- IRRIG2
    SWBsv@IRRIG3[j] <- IRRIG3
    SWBsv@WCL1[j] <- WCL1
    SWBsv@WCL2[j] <- WCL2
    SWBsv@WCL3[j] <- WCL3
    SWBsv@WL1RT[j] <- WL1RT
    SWBsv@WL2RT[j] <- WL2RT
    SWBsv@WL3RT[j] <- WL3RT
    return(SWBsv)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
