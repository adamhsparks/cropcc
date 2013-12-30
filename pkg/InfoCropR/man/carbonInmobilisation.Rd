\name{carbonInmobilisation}
\alias{carbonInmobilisation}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Carbon inmobilisation (function)
}
\description{
Updates values related to carbon inmobilisation in the soil
}
\usage{
carbonInmobilisation(DINDEXs, carbonMine, nitrogenD, nitrogenEmi, stress, carbonInmo)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{carbonMine}{
%%     ~~Describe \code{carbonMine} here~~
}
  \item{nitrogenD}{
%%     ~~Describe \code{nitrogenD} here~~
}
  \item{nitrogenEmi}{
%%     ~~Describe \code{nitrogenEmi} here~~
}
  \item{stress}{
%%     ~~Describe \code{stress} here~~
}
  \item{carbonInmo}{
%%     ~~Describe \code{carbonInmo} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
An object of \code{"CarbonInmobilisationClass"}
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
function (DINDEXs, carbonMine, nitrogenD, nitrogenEmi, stress, 
    carbonInmo) 
{
    CDOC1 <- carbonMine@CDOC1[length(carbonMine@CDOC1)]
    CDOC2 <- carbonMine@CDOC2[length(carbonMine@CDOC2)]
    CDOC3 <- carbonMine@CDOC3[length(carbonMine@CDOC3)]
    ASOLC <- nitrogenD@ASOLC
    MBFAC <- nitrogenEmi@MBFAC[length(nitrogenEmi@MBFAC)]
    MFAC <- stress@MFAC[length(stress@MFAC)]
    PHFAC <- stress@PHFAC[length(stress@PHFAC)]
    TFAC <- stress@TFAC[length(stress@TFAC)]
    CIMMO1 <- CDOC1 * ASOLC * TFAC * MBFAC * AMIN1(MFAC, PHFAC)
    CIMMO2 <- CDOC2 * ASOLC * TFAC * MBFAC * AMIN1(MFAC, PHFAC)
    CIMMO3 <- CDOC3 * ASOLC * TFAC * MBFAC * AMIN1(MFAC, PHFAC)
    j <- length(carbonInmo@DINDEX) + 1
    carbonInmo@DINDEX[j] <- DINDEXs
    carbonInmo@CIMMO1[j] <- CIMMO1
    carbonInmo@CIMMO2[j] <- CIMMO2
    carbonInmo@CIMMO3[j] <- CIMMO3
    return(carbonInmo)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
