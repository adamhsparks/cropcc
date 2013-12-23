\name{methaneEmission}
\alias{methaneEmission}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
methaneEmission(DINDEXs, carbonMine, crop, GRsv, SWBsv, tabFunction, methane)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{DINDEXs}{
%%     ~~Describe \code{DINDEXs} here~~
}
  \item{carbonMine}{
%%     ~~Describe \code{carbonMine} here~~
}
  \item{crop}{
%%     ~~Describe \code{crop} here~~
}
  \item{GRsv}{
%%     ~~Describe \code{GRsv} here~~
}
  \item{SWBsv}{
%%     ~~Describe \code{SWBsv} here~~
}
  \item{tabFunction}{
%%     ~~Describe \code{tabFunction} here~~
}
  \item{methane}{
%%     ~~Describe \code{methane} here~~
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
function (DINDEXs, carbonMine, crop, GRsv, SWBsv, tabFunction, 
    methane) 
{
    CDOC1 <- carbonMine@CDOC1[length(carbonMine@CDOC1)]
    CDOC2 <- carbonMine@CDOC2[length(carbonMine@CDOC2)]
    CDOC3 <- carbonMine@CDOC3[length(carbonMine@CDOC3)]
    RICE <- crop@RICE
    TDM <- GRsv@TDM[length(GRsv@TDM)]
    CHSOIL <- methane@CHSOIL[length(methane@CHSOIL)]
    DAPOND <- SWBsv@DAPOND[length(SWBsv@DAPOND)]
    POND <- SWBsv@POND[length(SWBsv@POND)]
    EBULTN <- tabFunction@EBULTN
    EHFAC <- tabFunction@EHFAC
    MTABEH <- tabFunction@MTABEH
    EH <- AFGEN(MTABEH, DAPOND)
    EHCF <- INSW(RICE - 0.8, 0, AFGEN(EHFAC, EH))
    CH4PR1 <- 0.27 * 0.55 * CDOC1 * EHCF
    CH4PR2 <- 0.27 * 0.55 * CDOC2 * EHCF
    CH4PR3 <- 0.27 * 0.55 * CDOC3 * EHCF
    CH4TOT <- CH4PR1 + CH4PR2 + CH4PR3
    CHVASC <- AMAX1(0, CHSOIL * LIMIT(0, 1, (TDM/15000) + 2))
    CHEBUL <- AMAX1(0, (CHSOIL - CHVASC) * AFGEN(EBULTN, POND))
    CHSOIL <- CH4TOT - CHVASC - CHEBUL
    CHEMIT <- CHVASC + CHEBUL
    CH4SUM <- CHEMIT
    j <- length(methane@DINDEX) + 1
    methane@DINDEX[j] <- DINDEXs
    methane@CH4PR1[j] <- CH4PR1
    methane@CH4PR2[j] <- CH4PR2
    methane@CH4PR3[j] <- CH4PR3
    methane@CH4TOT[j] <- CH4TOT
    methane@CHEMIT[j] <- CHEMIT
    methane@CHSOIL[j] <- CHSOIL
    return(methane)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
