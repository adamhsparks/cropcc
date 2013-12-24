\name{growthandRadiation7}
\alias{growthandRadiation7}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Growth and radiation
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
growthandRadiation7(climate, CNsv, control, crop, EDTSsv, GRsv, management, phenology, stress, tabFunction, cropsv)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{climate}{
%%     ~~Describe \code{climate} here~~
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
function (climate, CNsv, control, crop, EDTSsv, GRsv, management, 
    phenology, stress, tabFunction, cropsv) 
{
    CO2 <- climate@CO2
    NFIX <- CNsv@NFIX[length(CNsv@NFIX)]
    SWCPOT <- control@SWCPOT
    COSNFX <- crop@COSNFX
    KDFMAX <- crop@KDFMAX
    RUEMAX <- crop@RUEMAX
    BLIGHT <- cropsv@BLIGHT[length(cropsv@BLIGHT)]
    EFFLAI <- cropsv@EFFLAI[length(cropsv@EFFLAI)]
    LAI <- cropsv@LAI[length(cropsv@LAI)]
    MILDEW <- cropsv@MILDEW[length(cropsv@MILDEW)]
    PSTPAR <- cropsv@PSTPAR[length(cropsv@PSTPAR)]
    RUST <- cropsv@RUST[length(cropsv@RUST)]
    WEEDCV <- cropsv@WEEDCV[length(cropsv@WEEDCV)]
    DTR <- EDTSsv@DTR[length(EDTSsv@DTR)]
    TPAD <- EDTSsv@TPAD[length(EDTSsv@TPAD)]
    LSTR <- GRsv@LSTR[length(GRsv@LSTR)]
    DAS <- management@DAS[length(management@DAS)]
    DS <- phenology@DS[length(phenology@DS)]
    NSTRES <- stress@NSTRES[length(stress@NSTRES)]
    WSTRES <- stress@WSTRES[length(stress@WSTRES)]
    KDFDS <- tabFunction@KDFDS
    EARCUT <- tabFunction@EARCUT
    RCFDS <- tabFunction@RCFDS
    RCFCO2 <- tabFunction@RCFCO2
    RCFLN <- tabFunction@RCFLN
    RCFTP <- tabFunction@RCFTP
    SEVRPT <- tabFunction@SEVRPT
    KDF <- KDFMAX * AFGEN(KDFDS, DS)
    PARCRP <- 0.5 * DTR * (1 - exp(-KDF * (EFFLAI - PSTPAR)))
    WEDLAI <- AMIN1(6, WEEDCV * LAI)
    TOTLAI <- WEDLAI + EFFLAI
    PARINT <- PARCRP - INSW(TOTLAI - 3, 0, PARCRP * AMIN1(0.95, 
        WEEDCV))
    RUEABI <- AFGEN(RCFTP, TPAD) * AFGEN(RCFLN, NSTRES) * AFGEN(RCFCO2, 
        CO2) * INSW(SWCPOT - 1, LIMIT(0, 1, WSTRES + 0.2), 1)
    RUEBIO <- AMAX1(0, 1 - AMAX1(BLIGHT, RUST, AFGEN(SEVRPT, 
        MILDEW), AFGEN(EARCUT, DAS) * 0.3/100))
    RUE <- RUEMAX * AFGEN(RCFDS, DS) * RUEABI * RUEBIO
    GCROP <- RUE * PARINT * 10 + LSTR - NFIX * COSNFX
    j <- length(cropsv@GCROP) + 1
    cropsv@GCROP[j] <- GCROP
    return(cropsv)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
