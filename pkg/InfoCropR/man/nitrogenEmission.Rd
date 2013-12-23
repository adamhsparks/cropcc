\name{nitrogenEmission}
\alias{nitrogenEmission}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
nitrogenEmission(DINDEXs, carbonMine, SNBsv, soil, stress, SWBsv, tabFunction, nitrogenEmi)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{DINDEXs}{
%%     ~~Describe \code{DINDEXs} here~~
}
  \item{carbonMine}{
%%     ~~Describe \code{carbonMine} here~~
}
  \item{SNBsv}{
%%     ~~Describe \code{SNBsv} here~~
}
  \item{soil}{
%%     ~~Describe \code{soil} here~~
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
  \item{nitrogenEmi}{
%%     ~~Describe \code{nitrogenEmi} here~~
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
function (DINDEXs, carbonMine, SNBsv, soil, stress, SWBsv, tabFunction, 
    nitrogenEmi) 
{
    MBSOL <- carbonMine@MBSOL[length(carbonMine@MBSOL)]
    NH41 <- SNBsv@NH41[length(SNBsv@NH41)]
    NO31 <- SNBsv@NO31[length(SNBsv@NO31)]
    N2DRAT <- soil@N2DRAT[length(soil@N2DRAT)]
    N2NRAT <- soil@N2NRAT[length(soil@N2NRAT)]
    MFAC <- stress@MFAC[length(stress@MFAC)]
    PHFAC <- stress@PHFAC[length(stress@PHFAC)]
    TFAC <- stress@TFAC[length(stress@TFAC)]
    AWF1 <- SWBsv@AWF1[length(SWBsv@AWF1)]
    MBTAB <- tabFunction@MBTAB
    MTABD <- tabFunction@MTABD
    MBFAC <- AFGEN(MBTAB, MBSOL)
    N2ONIT <- AMAX1(0, (NH41 * (1 - exp(-N2NRAT))) * TFAC * MBFAC * 
        AMIN1(MFAC, PHFAC))
    N2ODEN <- AMAX1(0, (NO31 * (1 - exp(-N2DRAT))) * AFGEN(MTABD, 
        AWF1) * MBFAC * AMIN1(TFAC, PHFAC))
    N2OTOT <- (N2ONIT + N2ODEN)
    N2OTOS <- N2OTOT
    j <- length(nitrogenEmi@DINDEX) + 1
    nitrogenEmi@DINDEX[j] <- DINDEXs
    nitrogenEmi@MBFAC[j] <- MBFAC
    nitrogenEmi@N2ODEN[j] <- N2ODEN
    nitrogenEmi@N2ONIT[j] <- N2ONIT
    nitrogenEmi@N2OTOT[j] <- N2OTOT
    return(nitrogenEmi)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
