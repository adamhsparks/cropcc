\name{nitrogenMineralisation}
\alias{nitrogenMineralisation}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Nitrogen mineralisation
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
nitrogenMineralisation(control, EDTSsv, nitrogenD, nitrogenEmi, soilD, stress, nitrogenMine)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{EDTSsv}{
%%     ~~Describe \code{EDTSsv} here~~
}
  \item{nitrogenD}{
%%     ~~Describe \code{nitrogenD} here~~
}
  \item{nitrogenEmi}{
%%     ~~Describe \code{nitrogenEmi} here~~
}
  \item{soilD}{
%%     ~~Describe \code{soilD} here~~
}
  \item{stress}{
%%     ~~Describe \code{stress} here~~
}
  \item{nitrogenMine}{
%%     ~~Describe \code{nitrogenMine} here~~
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
function (DINDEXs, control, EDTSsv, nitrogenD, nitrogenEmi, soilD, 
    stress, nitrogenMine) 
{
    TKL3 <- control@TKL3[length(control@TKL3)]
    DSTART <- EDTSsv@DSTART[length(EDTSsv@DSTART)]
    DESOLN <- nitrogenD@DESOLN
    MBFAC <- nitrogenEmi@MBFAC[length(nitrogenEmi@MBFAC)]
    MRATE1 <- nitrogenMine@MRATE1[length(nitrogenMine@MRATE1)]
    MRATE2 <- nitrogenMine@MRATE2[length(nitrogenMine@MRATE2)]
    MRATE3 <- nitrogenMine@MRATE3[length(nitrogenMine@MRATE3)]
    SOC1 <- soilD@SOC1
    SOC2 <- soilD@SOC2
    SOC3 <- soilD@SOC3
    TKL1 <- soilD@TKL1
    TKL2 <- soilD@TKL2
    MFAC <- stress@MFAC[length(stress@MFAC)]
    PHFAC <- stress@PHFAC[length(stress@PHFAC)]
    TFAC <- stress@TFAC[length(stress@TFAC)]
    POMIN1 <- INSW(DSTART - 1, 0.97 * (43 + 970 * 0.1 * SOC1 * 
        TKL1/150), 0)
    POMIN2 <- INSW(DSTART - 1, 0.97 * (43 + 970 * 0.1 * SOC2 * 
        TKL2/150), 0)
    POMIN3 <- INSW(DSTART - 1, 0.97 * (43 + 970 * 0.1 * SOC3 * 
        TKL3/150), 0)
    NPMIN1 <- MRATE1
    NPMIN2 <- MRATE2
    NPMIN3 <- MRATE3
    NMINS1 <- (NPMIN1 * (1 - exp(-DESOLN))) * TFAC * MBFAC * 
        AMIN1(MFAC, PHFAC)
    NMINS2 = (NPMIN2 * (1 - exp(-DESOLN))) * TFAC * MBFAC * AMIN1(MFAC, 
        PHFAC)
    NMINS3 = (NPMIN3 * (1 - exp(-DESOLN))) * TFAC * MBFAC * AMIN1(MFAC, 
        PHFAC)
    MRATE1 <- POMIN1 - NMINS1
    MRATE2 <- POMIN2 - NMINS2
    MRATE3 <- POMIN3 - NMINS3
    j <- length(nitrogenMine@DINDEX) + 1
    nitrogenMine@DINDEX[j] <- DINDEXs
    nitrogenMine@MRATE1[j] <- MRATE1
    nitrogenMine@MRATE2[j] <- MRATE2
    nitrogenMine@MRATE3[j] <- MRATE3
    nitrogenMine@NMINS1[j] <- NMINS1
    nitrogenMine@NMINS2[j] <- NMINS2
    nitrogenMine@NMINS3[j] <- NMINS3
    return(nitrogenMine)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
