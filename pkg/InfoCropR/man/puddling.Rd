\name{puddling}
\alias{puddling}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Puddling
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
puddling(management, soilD, tabFunction, soil)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{management}{
%%     ~~Describe \code{management} here~~
}
  \item{soilD}{
%%     ~~Describe \code{soilD} here~~
}
  \item{tabFunction}{
%%     ~~Describe \code{tabFunction} here~~
}
  \item{soil}{
%%     ~~Describe \code{soil} here~~
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
function (management, soilD, tabFunction, soil) 
{
    DAS <- management@DAS[length(management@DAS)]
    NEWAGE <- management@NEWAGE[length(management@NEWAGE)]
    PUDLE <- management@PUDLE[length(management@PUDLE)]
    SEEDAG <- management@SEEDAG[length(management@SEEDAG)]
    SAND2 <- soilD@SAND2
    PDCOEF <- tabFunction@PDCOEF
    DAPUDL <- INSW(DAS - SEEDAG, 0, AMAX1(0, DAS + 1 - NEWAGE))
    PDCF1 <- INSW(PUDLE - 0.98, 1, INSW(DAPUDL - 0.1, 1, LIMIT(1, 
        1.1, 1.1 - 0.002 * DAPUDL)))
    PDCF2 <- INSW(PUDLE - 0.98, 1, INSW(DAPUDL - 0.1, 1, LIMIT(0, 
        1, AFGEN(PDCOEF, SAND2) + INSW(DAPUDL - 40, 0, 0.005 * 
            (DAPUDL - 39)))))
    PDCF3 <- INSW(PUDLE - 0.98, 1, INSW(DAPUDL - 0.1, 1, LIMIT(0, 
        1, 0.9 + 0.002 * DAPUDL)))
    j <- length(soil@PDCF1) + 1
    soil@PDCF1[j] <- PDCF1
    soil@PDCF2[j] <- PDCF2
    soil@PDCF3[j] <- PDCF3
    return(soil)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
