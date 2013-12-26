\name{soilNitrogenBalance}
\alias{soilNitrogenBalance}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Soil nitrogen balance
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
soilNitrogenBalance(DINDEXs, CNsv, control, crop, cropsv, fertilisation, nitrogenD, nitrogenEmi, nitrogenMine, phenology, soilD, stress, SWBsv, tabFunction, SNBsv)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{DINDEXs}{
%%     ~~Describe \code{DINDEXs} here~~
}
  \item{CNsv}{
%%     ~~Describe \code{CNsv} here~~
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
  \item{fertilisation}{
%%     ~~Describe \code{fertilisation} here~~
}
  \item{nitrogenD}{
%%     ~~Describe \code{nitrogenD} here~~
}
  \item{nitrogenEmi}{
%%     ~~Describe \code{nitrogenEmi} here~~
}
  \item{nitrogenMine}{
%%     ~~Describe \code{nitrogenMine} here~~
}
  \item{phenology}{
%%     ~~Describe \code{phenology} here~~
}
  \item{soilD}{
%%     ~~Describe \code{soilD} here~~
}
  \item{stress}{
%%     ~~Describe \code{stress} here~~
}
  \item{SWBsv}{
%%     ~~Describe \code{SWBsv} here~~
}
  \item{tabFunction}{
%%     ~~Describe \code{tabFunction} here~~
}
  \item{SNBsv}{
%%     ~~Describe \code{SNBsv} here~~
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
function (DINDEXs, CNsv, control, crop, cropsv, fertilisation, 
    nitrogenD, nitrogenEmi, nitrogenMine, phenology, soilD, stress, 
    SWBsv, tabFunction, SNBsv) 
{
    ANLV <- CNsv@ANLV[length(CNsv@ANLV)]
    ANST <- CNsv@ANST[length(CNsv@ANST)]
    ANSO <- CNsv@ANSO[length(CNsv@ANSO)]
    NIMMO1 <- CNsv@NIMMO1[length(CNsv@NIMMO1)]
    NIMMO2 <- CNsv@NIMMO2[length(CNsv@NIMMO2)]
    NIMMO3 <- CNsv@NIMMO3[length(CNsv@NIMMO3)]
    NIMMOT <- CNsv@NIMMOT[length(CNsv@NIMMOT)]
    NUPTK1 <- CNsv@NUPTK1[length(CNsv@NUPTK1)]
    NUPTK2 <- CNsv@NUPTK2[length(CNsv@NUPTK2)]
    NUPTK3 <- CNsv@NUPTK3[length(CNsv@NUPTK3)]
    NO31I <- control@NO31I[length(control@NO31I)]
    NO32I <- control@NO32I[length(control@NO32I)]
    NO33I <- control@NO33I[length(control@NO33I)]
    NHRICE <- crop@NHRICE
    RICE <- crop@RICE
    DMGSTR <- cropsv@DMGSTR[length(cropsv@DMGSTR)]
    LRFEED <- cropsv@LRFEED[length(cropsv@LRFEED)]
    SUKNLV <- cropsv@SUKNLV[length(cropsv@SUKNLV)]
    SUKNST <- cropsv@SUKNST[length(cropsv@SUKNST)]
    WEEDCV <- cropsv@WEEDCV[length(cropsv@WEEDCV)]
    NHAPL1 <- fertilisation@NHAPL1[length(fertilisation@NHAPL1)]
    NHAPL2 <- fertilisation@NHAPL2[length(fertilisation@NHAPL2)]
    NHAPL3 <- fertilisation@NHAPL3[length(fertilisation@NHAPL3)]
    NOAPL1 <- fertilisation@NOAPL1[length(fertilisation@NOAPL1)]
    NOAPL2 <- fertilisation@NOAPL2[length(fertilisation@NOAPL2)]
    NOAPL3 <- fertilisation@NOAPL3[length(fertilisation@NOAPL3)]
    ORGNIT <- fertilisation@ORGNIT[length(fertilisation@ORGNIT)]
    RAINN <- fertilisation@RAINN[length(fertilisation@RAINN)]
    UAPPL1 <- fertilisation@UAPPL1[length(fertilisation@UAPPL1)]
    UAPPL2 <- fertilisation@UAPPL2[length(fertilisation@UAPPL2)]
    UAPPL3 <- fertilisation@UAPPL3[length(fertilisation@UAPPL3)]
    DNRATE <- nitrogenD@DNRATE
    LNH4 <- nitrogenD@LNH4
    NBIOL <- nitrogenD@NBIOL
    NIRATE <- nitrogenD@NIRATE
    TCDRN <- nitrogenD@TCDRN
    TCVOL <- nitrogenD@TCVOL
    UHRATE <- nitrogenD@UHRATE
    MBFAC <- nitrogenEmi@MBFAC[length(nitrogenEmi@MBFAC)]
    N2ODEN <- nitrogenEmi@N2ODEN[length(nitrogenEmi@N2ODEN)]
    N2ONIT <- nitrogenEmi@N2ONIT[length(nitrogenEmi@N2ONIT)]
    NMINS1 <- nitrogenMine@NMINS1[length(nitrogenMine@NMINS1)]
    NMINS2 <- nitrogenMine@NMINS2[length(nitrogenMine@NMINS2)]
    NMINS3 <- nitrogenMine@NMINS3[length(nitrogenMine@NMINS3)]
    GNLOSS <- phenology@GNLOSS[length(phenology@GNLOSS)]
    GNO <- phenology@GNO[length(phenology@GNO)]
    NAPOND <- SNBsv@NAPOND[length(SNBsv@NAPOND)]
    NO31 <- SNBsv@NO31[length(SNBsv@NO31)]
    NO32 <- SNBsv@NO32[length(SNBsv@NO32)]
    NO33 <- SNBsv@NO33[length(SNBsv@NO33)]
    T1 <- SNBsv@T1[length(SNBsv@T1)]
    T2 <- SNBsv@T2[length(SNBsv@T2)]
    T3 <- SNBsv@T3[length(SNBsv@T3)]
    U1 <- SNBsv@U1[length(SNBsv@U1)]
    U2 <- SNBsv@U2[length(SNBsv@U2)]
    U3 <- SNBsv@U3[length(SNBsv@U3)]
    NH41I <- soilD@NH41I
    NH42I <- soilD@NH42I
    NH43I <- soilD@NH43I
    MFAC <- stress@MFAC[length(stress@MFAC)]
    PHFAC <- stress@PHFAC[length(stress@PHFAC)]
    PHFACV <- stress@PHFACV[length(stress@PHFACV)]
    TFAC <- stress@TFAC[length(stress@TFAC)]
    TFACV <- stress@TFACV[length(stress@TFACV)]
    AWF1 <- SWBsv@AWF1[length(SWBsv@AWF1)]
    DRAIN <- SWBsv@DRAIN[length(SWBsv@DRAIN)]
    POND <- SWBsv@POND[length(SWBsv@POND)]
    RNOFF <- SWBsv@RNOFF[length(SWBsv@RNOFF)]
    WL1 <- SWBsv@WL1[length(SWBsv@WL1)]
    WL2 <- SWBsv@WL2[length(SWBsv@WL2)]
    WL3 <- SWBsv@WL3[length(SWBsv@WL3)]
    WLFL1 <- SWBsv@WLFL1[length(SWBsv@WLFL1)]
    WLFL2 <- SWBsv@WLFL2[length(SWBsv@WLFL2)]
    WLFL3 <- SWBsv@WLFL3[length(SWBsv@WLFL3)]
    WLFL4 <- SWBsv@WLFL4[length(SWBsv@WLFL4)]
    WLFL5 <- SWBsv@WLFL5[length(SWBsv@WLFL5)]
    WLFL6 <- SWBsv@WLFL6[length(SWBsv@WLFL6)]
    WLFL7 <- SWBsv@WLFL7[length(SWBsv@WLFL7)]
    WLFL8 <- SWBsv@WLFL8[length(SWBsv@WLFL8)]
    MTABD <- tabFunction@MTABD
    UREA1 <- U1
    UREA2 <- U2
    UREA3 <- U3
    UHYDR1 <- (UREA1 * (1 - exp(-UHRATE))) * TFAC * MBFAC * AMIN1(MFAC, 
        PHFAC)
    UHYDR2 <- (UREA2 * (1 - exp(-UHRATE))) * TFAC * MBFAC * AMIN1(MFAC, 
        PHFAC)
    UHYDR3 <- (UREA3 * (1 - exp(-UHRATE))) * TFAC * MBFAC * AMIN1(MFAC, 
        PHFAC)
    U1 <- UAPPL1 - UHYDR1
    U2 <- UAPPL2 - UHYDR2
    U3 <- UAPPL3 - UHYDR3
    NH41T <- NH41I + T1
    NH42T <- NH42I + T2
    NH43T <- NH43I + T3
    NH41 <- AMAX1(0.01, NH41T)
    NH42 <- AMAX1(0.01, NH42T)
    NH43 <- AMAX1(0.01, NH43T)
    NHNO31 <- (NH41 * (1 - exp(-NIRATE))) * TFAC * MBFAC * AMIN1(MFAC, 
        PHFAC)
    NHNO32 <- (NH42 * (1 - exp(-NIRATE))) * TFAC * MBFAC * AMIN1(MFAC, 
        PHFAC)
    NHNO33 <- (NH43 * (1 - exp(-NIRATE))) * TFAC * MBFAC * AMIN1(MFAC, 
        PHFAC)
    NPONDT <- NAPOND
    NPOND <- AMAX1(0, NPONDT)
    NRNOFF <- AMAX1(0, RNOFF * NPOND/NOTNUL(POND))
    NO3FL1 <- AMAX1(0, WLFL1 * NPOND/AMAX1(TCDRN, NOTNUL(POND * 
        TCDRN)))
    NO3FL2 <- AMAX1(0, WLFL2 * NO31/AMAX1(TCDRN, NOTNUL(WL1 * 
        TCDRN)))
    NO3FL3 <- AMAX1(0, WLFL3 * NO32/AMAX1(TCDRN, NOTNUL(WL2 * 
        TCDRN)))
    NO3FL4 <- AMAX1(0, WLFL4 * NO33/AMAX1(TCDRN, NOTNUL(WL3 * 
        TCDRN)))
    NO3FL5 <- AMAX1(0, WLFL5 * NO33/AMAX1(TCDRN, NOTNUL(WL3 * 
        TCDRN)))
    NO3FL6 <- AMAX1(0, WLFL6 * NO33/AMAX1(TCDRN, NOTNUL(WL3 * 
        TCDRN)))
    NO3FL7 <- AMAX1(0, WLFL7 * NO32/AMAX1(TCDRN, NOTNUL(WL2 * 
        TCDRN)))
    NO3FL8 <- AMAX1(0, WLFL8 * NO31/AMAX1(TCDRN, NOTNUL(WL1 * 
        TCDRN)))
    NLEACH <- DRAIN * NO33/AMAX1(TCDRN, NOTNUL(WL3 * TCDRN))
    NAPOND <- RAINN - NRNOFF + NO3FL8 - NO3FL1
    DENIT <- AMAX1(0, (NO31 * (1 - exp(-DNRATE))) * AFGEN(MTABD, 
        AWF1) * AMIN1(TFAC, PHFAC))
    NUPNO1 <- AMIN1(NO31, INSW(RICE - 1, NUPTK1 * (1 - NHRICE) + 
        NUPTK1 * (1 - NHRICE) * WEEDCV, NUPTK1 * NO31/(NO31 + 
        NH41) + NUPTK1 * NO31 * WEEDCV/(NO31 + NH41)))
    NUPNO2 <- AMIN1(NO32, INSW(RICE - 1, NUPTK2 * (1 - NHRICE) + 
        NUPTK2 * (1 - NHRICE) * WEEDCV, NUPTK2 * NO32/(NO32 + 
        NH42) + NUPTK2 * NO32 * WEEDCV/(NO32 + NH42)))
    NUPNO3 <- AMIN1(NO33, INSW(RICE - 1, NUPTK3 * (1 - NHRICE) + 
        NUPTK3 * (1 - NHRICE) * WEEDCV, NUPTK3 * NO33/(NO33 + 
        NH43) + NUPTK3 * NO33 * WEEDCV/(NO33 + NH43)))
    VOLAT <- AMAX1(0, ((((NH41 - NHNO31)/LNH4)/TCVOL) * TFACV * 
        MFAC) * PHFACV)
    NUPNH1 <- AMIN1(NH41, INSW(RICE - 1, NUPTK1 * NHRICE + NUPTK1 * 
        NHRICE * WEEDCV, NUPTK1 * NH41/(NO31 + NH41) + NUPTK1 * 
        NH41 * WEEDCV/(NO31 + NH41)))
    NUPNH2 <- AMIN1(NH42, INSW(RICE - 1, NUPTK2 * NHRICE + NUPTK2 * 
        NHRICE * WEEDCV, NUPTK2 * NH42/(NO32 + NH42) + NUPTK2 * 
        NH42 * WEEDCV/(NO32 + NH42)))
    NUPNH3 <- AMIN1(NH43, INSW(RICE - 1, NUPTK3 * NHRICE + NUPTK3 * 
        NHRICE * WEEDCV, NUPTK3 * NH43/(NO33 + NH43) + NUPTK3 * 
        NH43 * WEEDCV/(NO33 + NH43)))
    T1 <- NHAPL1 + NMINS1 + ORGNIT + NBIOL - NHNO31 - VOLAT + 
        UHYDR1 - NUPNH1 - N2ONIT - INSW(RICE - 1, 0, NIMMO1)
    T2 <- NHAPL2 + NMINS2 - NHNO32 + UHYDR2 - NUPNH2 - INSW(RICE - 
        1, 0, NIMMO2)
    T3 <- NHAPL3 + NMINS3 - NHNO33 + UHYDR3 - NUPNH3 - INSW(RICE - 
        1, 0, NIMMO3)
    T4 <- NHNO31 + NOAPL1 + NO3FL1 + NO3FL7 - NO3FL8 - NO3FL2 - 
        DENIT - N2ODEN - INSW(RICE - 1, NIMMO1, INSW(NH41 - NIMMO1, 
        NIMMO1 - NH41, 0)) - NUPNO1
    T5 <- NHNO32 + NOAPL2 + NO3FL2 + NO3FL6 - NO3FL7 - NO3FL3 - 
        INSW(RICE - 1, NIMMO2, INSW(NH42 - NIMMO2, NIMMO2 - NH42, 
            0)) - NUPNO2
    T6 <- NHNO33 + NOAPL3 + NO3FL3 + NO3FL5 - NO3FL6 - NO3FL4 - 
        INSW(RICE - 1, NIMMO3, INSW(NH43 - NIMMO3, NIMMO3 - NH43, 
            0)) - NUPNO3
    NO31T <- NO31I + T4
    NO32T <- NO32I + T5
    NO33T <- NO33I + T6
    NO31 <- AMAX1(0.001, NO31T)
    NO32 <- AMAX1(0.001, NO32T)
    NO33 <- AMAX1(0.001, NO33T)
    SOILN1 <- NO31 + NH41
    SOILN2 <- NO32 + NH42
    SOILN3 <- NO33 + NH43
    SOILNT <- SOILN1 + SOILN2 + SOILN3
    NLOSSD <- NLEACH + VOLAT + DENIT + NIMMOT + NRNOFF
    NLOSPT <- ANLV * LRFEED + SUKNLV + DMGSTR * ANLV + SUKNST + 
        DMGSTR * ANST + ANSO * GNLOSS/NOTNUL(GNO)
    j <- length(SNBsv@DINDEX) + 1
    SNBsv@DINDEX[j] <- DINDEXs
    SNBsv@NH41[j] <- NH41
    SNBsv@NH42[j] <- NH42
    SNBsv@NH43[j] <- NH43
    SNBsv@T1[j] <- T1
    SNBsv@T2[j] <- T2
    SNBsv@T3[j] <- T3
    SNBsv@NAPOND[j] <- NAPOND
    SNBsv@NO31[j] <- NO31
    SNBsv@NO32[j] <- NO32
    SNBsv@NO33[j] <- NO33
    SNBsv@SOILN1[j] <- SOILN1
    SNBsv@SOILNT[j] <- SOILNT
    SNBsv@U1[j] <- U1
    SNBsv@U2[j] <- U2
    SNBsv@U3[j] <- U3
    return(SNBsv)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line