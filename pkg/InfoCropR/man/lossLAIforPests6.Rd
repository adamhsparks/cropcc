\name{lossLAIforPests6}
\alias{lossLAIforPests6}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
lossLAIforPests6(control, crop, EDTSsv, GRsv, management, pestD, phenology, stress, tabFunction, cropsv)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{crop}{
%%     ~~Describe \code{crop} here~~
}
  \item{EDTSsv}{
%%     ~~Describe \code{EDTSsv} here~~
}
  \item{GRsv}{
%%     ~~Describe \code{GRsv} here~~
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
  \item{stress}{
%%     ~~Describe \code{stress} here~~
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
function (control, crop, EDTSsv, GRsv, management, pestD, phenology, 
    stress, tabFunction, cropsv) 
{
    SEEDRT <- control@SEEDRT
    DSMAXL <- crop@DSMAXL
    RGRPOT <- crop@RGRPOT
    SLAVAR <- crop@SLAVAR
    STDSRT <- crop@STDSRT
    BLIGHT <- cropsv@BLIGHT[length(cropsv@BLIGHT)]
    DLDETH <- cropsv@DLDETH[length(cropsv@DLDETH)]
    DMGSTR <- cropsv@DMGSTR[length(cropsv@DMGSTR)]
    FRDMG <- cropsv@FRDMG[length(cropsv@FRDMG)]
    HONYSM <- cropsv@HONYSM[length(cropsv@HONYSM)]
    LAI <- cropsv@LAI[length(cropsv@LAI)]
    LVFEED <- cropsv@LVFEED[length(cropsv@LVFEED)]
    MILDEW <- cropsv@MILDEW[length(cropsv@MILDEW)]
    RLAI <- cropsv@RLAI[length(cropsv@RLAI)]
    RUST <- cropsv@RUST[length(cropsv@RUST)]
    SAIA <- cropsv@SAIA[length(cropsv@SAIA)]
    TPAV <- EDTSsv@TPAV[length(EDTSsv@TPAV)]
    WLVG <- GRsv@WLVG[length(GRsv@WLVG)]
    DAS <- management@DAS[length(management@DAS)]
    RGRFAC <- pestD@RGRFAC
    DS <- phenology@DS[length(phenology@DS)]
    NSTRES <- stress@NSTRES[length(stress@NSTRES)]
    DSATMP <- tabFunction@DSATMP
    LAIFAC <- tabFunction@LAIFAC
    LVFOLD <- tabFunction@LVFOLD
    SLACF <- tabFunction@SLACF
    SNLVGA <- tabFunction@SNLVGA
    LALOSS <- AMIN1(LAI * 0.95, LAI * LIMIT(0, 1, AMAX1(BLIGHT, 
        RUST, MILDEW, DMGSTR, AFGEN(LVFOLD, DAS) * 0.5/100)) + 
        LVFEED)
    SAI <- AMAX1(0, SAIA * AFGEN(LAIFAC, DS))
    EFFLAI <- AMAX1(0, LAI + SAI)
    LALDAY <- INSW(DS - 0.15, 0, INSW(EFFLAI - LALOSS - 0.001, 
        1, -DLDETH))
    DLDETH <- LALDAY
    RGRL <- RGRPOT * RGRFAC * AMAX1(0.5, NSTRES) * LIMIT(0, 1.2, 
        SEEDRT/STDSRT)
    SLA <- SLAVAR * AFGEN(SLACF, DS)
    DSAI <- SAI * AFGEN(SNLVGA, DS) * AFGEN(DSATMP, TPAV)
    RLAIA <- INSW(DS - DSMAXL, RLAI, 0)
    SAIRT <- RLAIA - AMIN1(SAI, SAI * (DMGSTR + FRDMG + HONYSM * 
        0.5/NOTNUL(HONYSM + WLVG)) + DSAI)
    SAIA <- SAIRT
    j <- length(cropsv@LALOSS) + 1
    cropsv@DLDETH[j] <- DLDETH
    cropsv@DSAI[j] <- DSAI
    cropsv@EFFLAI[j] <- EFFLAI
    cropsv@LALOSS[j] <- LALOSS
    cropsv@RGRL[j] <- RGRL
    cropsv@SAI[j] <- SAI
    cropsv@SAIA[j] <- SAIA
    cropsv@SLA[j] <- SLA
    return(cropsv)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
