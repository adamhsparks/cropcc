\name{transplantingDate3}
\alias{transplantingDate3}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
transplantingDate3(control, soil, SWBsv, management)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{soil}{
%%     ~~Describe \code{soil} here~~
}
  \item{SWBsv}{
%%     ~~Describe \code{SWBsv} here~~
}
  \item{management}{
%%     ~~Describe \code{management} here~~
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
function (control, soil, SWBsv, management) 
{
    XTIN <- control@XTIN
    DAS <- management@DAS[length(management@DAS)]
    RAINSW <- management@RAINSW[length(management@RAINSW)]
    SEEDAG <- management@SEEDAG[length(management@SEEDAG)]
    WCFC1 <- soil@WCFC1[length(soil@WCFC1)]
    WCL1 <- SWBsv@WCL1[length(SWBsv@WCL1)]
    WCLTRP <- WCFC1 * 0.85
    DLYTRP <- INSW(RAINSW - 1, 0, INSW(DAS - SEEDAG, 0, INSW(WCL1 - 
        WCLTRP, 0, 1)))
    DLYRAN <- DLYTRP
    XT <- INSW(RAINSW - 1, 0, INSW(DLYRAN - 1, 1, 0))
    XT1 <- XTIN + XT
    NEWAGE <- INSW(RAINSW - 1, SEEDAG, INSW(DAS - SEEDAG, 0, 
        XT1))
    j <- length(management@NEWAGE) + 1
    management@NEWAGE[j] <- NEWAGE
    return(management)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
