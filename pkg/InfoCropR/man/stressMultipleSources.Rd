\name{stressMultipleSources}
\alias{stressMultipleSources}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Stress
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
stressMultipleSources(CNsv, control, cropsv, EDTSsv, management, soilD, srSUBPET, SWBsv, tabFunction, stress)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{CNsv}{
%%     ~~Describe \code{CNsv} here~~
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
  \item{soilD}{
%%     ~~Describe \code{soilD} here~~
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
  \item{stress}{
%%     ~~Describe \code{stress} here~~
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
function (DINDEXs, CNsv, control, cropsv, EDTSsv, management, 
    soilD, srSUBPET, SWBsv, tabFunction, stress) 
{
    ANCRGR <- CNsv@ANCRGR[length(CNsv@ANCRGR)]
    ANCRPT <- CNsv@ANCRPT[length(CNsv@ANCRPT)]
    SWXNIT <- control@SWXNIT[length(control@SWXNIT)]
    SWXWAT <- control@SWXWAT[length(control@SWXWAT)]
    ATRANS <- cropsv@ATRANS[length(cropsv@ATRANS)]
    TPS <- EDTSsv@TPS[length(EDTSsv@TPS)]
    DAS <- management@DAS[length(management@DAS)]
    ESWI <- management@ESWI[length(management@ESWI)]
    PHSOL <- soilD@PHSOL
    PTRANS <- srSUBPET@PTRANS[length(srSUBPET@PTRANS)]
    AWF1 <- SWBsv@AWF1[length(SWBsv@AWF1)]
    MTAB <- tabFunction@MTAB
    PHTAB <- tabFunction@PHTAB
    PHTABV <- tabFunction@PHTABV
    TMPTAB <- tabFunction@TMPTAB
    TMPTBV <- tabFunction@TMPTBV
    PHFAC <- AFGEN(PHTAB, PHSOL)
    PHFACV <- AFGEN(PHTABV, PHSOL)
    TFAC <- AFGEN(TMPTAB, TPS)
    TFACV <- AFGEN(TMPTBV, TPS)
    WSTRSX <- INSW(ESWI - 1, 1, LIMIT(0, 1, ATRANS/NOTNUL(PTRANS)))
    WSTRES <- INSW(SWXWAT - 1, WSTRSX, 1)
    MFAC <- AFGEN(MTAB, AWF1)
    NSTRX <- INSW(ESWI - 1, 1, LIMIT(0, 1, ANCRGR/NOTNUL(ANCRPT)))
    NSTRES <- INSW(SWXNIT - 1, NSTRX, 1)
    NSTOT <- NSTRES
    NSMEAN <- NSTOT/NOTNUL(DAS)
    j <- length(stress@DINDEX) + 1
    stress@DINDEX[j] <- DINDEXs
    stress@MFAC[j] <- MFAC
    stress@NSTRES[j] <- NSTRES
    stress@TFAC[j] <- TFAC
    stress@TFACV[j] <- TFACV
    stress@PHFAC[j] <- PHFAC
    stress@PHFACV[j] <- PHFACV
    stress@WSTRES[j] <- WSTRES
    return(stress)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
