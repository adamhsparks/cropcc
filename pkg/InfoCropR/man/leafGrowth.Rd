\name{leafGrowth4}
\alias{leafGrowth4}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Leaf growth
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
leafGrowth4(CNsv, control, crop, EDTSsv, GRsv, management, phenology, srGLA, stress, tabFunction, cropsv)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{CNsv}{
%%     ~~Describe \code{CNsv} here~~
}
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
  \item{phenology}{
%%     ~~Describe \code{phenology} here~~
}
  \item{srGLA}{
%%     ~~Describe \code{srGLA} here~~
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
function (CNsv, control, crop, EDTSsv, GRsv, management, phenology, 
    srGLA, stress, tabFunction, cropsv) 
{
    NMOBIL <- CNsv@NMOBIL[length(CNsv@NMOBIL)]
    LAII <- control@LAII[length(control@LAII)]
    NMOBIF <- crop@NMOBIF
    BLIGHT <- cropsv@BLIGHT[length(cropsv@BLIGHT)]
    DMGSTR <- cropsv@DMGSTR[length(cropsv@DMGSTR)]
    DSAI <- cropsv@DSAI[length(cropsv@DSAI)]
    FRDMG <- cropsv@FRDMG[length(cropsv@FRDMG)]
    HONYSM <- cropsv@HONYSM[length(cropsv@HONYSM)]
    LAI <- cropsv@LAI[length(cropsv@LAI)]
    LALOSS <- cropsv@LALOSS[length(cropsv@LALOSS)]
    MILDEW <- cropsv@MILDEW[length(cropsv@MILDEW)]
    NODERT <- cropsv@NODERT[length(cropsv@NODERT)]
    PLTR <- cropsv@PLTR[length(cropsv@PLTR)]
    RUST <- cropsv@RUST[length(cropsv@RUST)]
    SAI <- cropsv@SAI[length(cropsv@SAI)]
    TPSHOK <- cropsv@TPSHOK[length(cropsv@TPSHOK)]
    WSO <- cropsv@WSO[length(cropsv@WSO)]
    TPAV <- EDTSsv@TPAV[length(EDTSsv@TPAV)]
    WLVG <- GRsv@WLVG[length(GRsv@WLVG)]
    WST <- GRsv@WST[length(GRsv@WST)]
    DAS <- management@DAS[length(management@DAS)]
    ESW <- management@ESW[length(management@ESW)]
    DS <- phenology@DS[length(phenology@DS)]
    GLAI <- srGLA@GLAI[length(srGLA@GLAI)]
    NSTRES <- stress@NSTRES[length(stress@NSTRES)]
    WSTRES <- stress@WSTRES[length(stress@WSTRES)]
    LVFOLD <- tabFunction@LVFOLD
    RDRT <- tabFunction@RDRT
    RDRTP <- tabFunction@RDRTP
    SENWAT <- tabFunction@SENWAT
    RDRSH <- LIMIT(0, 0.03, 0.03 * (LAI - 4)/4)
    DLAI <- AMIN1(LAI, LAI * AMAX1(RDRSH, AFGEN(RDRT, DS)) + 
        LAI * FRDMG + NMOBIL * LAI * NMOBIF + LAI * 0.03 * AMAX1(AFGEN(RDRTP, 
        TPAV), AFGEN(SENWAT, WSTRES), INSW(WSO - 1, AFGEN(SENWAT, 
        NSTRES), 0)))
    DLV <- WLVG * AMIN1(0.95, DLAI/NOTNUL(LAI) + AMAX1(DMGSTR, 
        RUST, BLIGHT, MILDEW, HONYSM * 0.5/NOTNUL(HONYSM + WLVG), 
        AFGEN(LVFOLD, DAS) * 0.5/100))
    DST <- AMIN1(WST, WST * DSAI * 0.5/NOTNUL(SAI) + DMGSTR * 
        WST + NODERT * WST/100)
    RLAI <- LAII * ESW + GLAI * TPSHOK - DLAI - LAI * (1 - PLTR) - 
        LALOSS
    LAITMP <- RLAI
    LAI <- AMAX1(0, LAITMP)
    j <- length(cropsv@DLV) + 1
    cropsv@DLV[j] <- DLV
    cropsv@DST[j] <- DST
    cropsv@LAI[j] <- LAI
    cropsv@RLAI[j] <- RLAI
    return(cropsv)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
