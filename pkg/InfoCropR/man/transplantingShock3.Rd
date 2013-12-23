\name{transplantingShock3}
\alias{transplantingShock3}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
transplantingShock3(crop, management, phenology, cropsv)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{crop}{
%%     ~~Describe \code{crop} here~~
}
  \item{management}{
%%     ~~Describe \code{management} here~~
}
  \item{phenology}{
%%     ~~Describe \code{phenology} here~~
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
function (crop, management, phenology, cropsv) 
{
    NPLSB <- crop@NPLSB
    SHCKD <- crop@SHCKD
    DAS <- management@DAS[length(management@DAS)]
    NEWAGE <- management@NEWAGE[length(management@NEWAGE)]
    NH <- management@NH[length(management@NH)]
    NPLH <- management@NPLH[length(management@NPLH)]
    SEEDAG <- management@SEEDAG[length(management@SEEDAG)]
    HUVG <- phenology@HUVG[length(phenology@HUVG)]
    PLTR <- INSW(REAAND(DAS - NEWAGE + 0.5, NEWAGE - DAS + 0.5) - 
        0.9, 1, NPLH * NH/NPLSB)
    SHCKPD <- INSW(DAS - SEEDAG, 1, INSW(DAS - NEWAGE, 1, 0))
    HUVGSK <- HUVG * SHCKPD
    HUSHOK <- HUVGSK
    HUDLAY <- HUSHOK * SHCKD
    HUSUM <- HUVG
    TPSHOK <- INSW(DAS - SEEDAG, 1, INSW(DAS - NEWAGE, 1, INSW(HUSHOK + 
        HUDLAY - HUSUM - 0.5, 1, 0)))
    j <- length(cropsv@PLTR) + 1
    cropsv@PLTR[j] <- PLTR
    cropsv@TPSHOK[j] <- TPSHOK
    return(cropsv)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
