\name{sowingDate}
\alias{sowingDate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Sowing date
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
sowingDate(TIME, control, soil, SWBsv, management)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{TIME}{
%%     ~~Describe \code{DINDEXs} here~~
}
  \item{control}{
%%     ~~Describe \code{soil} here~~
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
function (DINDEXs, soil, SWBsv, management) 
{
    SOWFXD <- management@SOWFXD[length(management@SOWFXD)]
    SWSWCH <- management@SWSWCH[length(management@SWSWCH)]
    WCFC1 <- soil@WCFC1[length(soil@WCFC1)]
    WCL1 <- SWBsv@WCL1[length(SWBsv@WCL1)]
    WCLSOW <- 0.85 * WCFC1
    SOW0 <- INSW(WCL1 - WCLSOW, 0, 1)
    SOW1 <- SOW0
    SOW5 <- INSW(SOW1 - 1, 0, 1)
    TIME <- DINDEXs
    SOW6 <- INSW(SWSWCH - 1, SOW5, INSW(SOWFXD - TIME - 1, 1, 
        0))
    DAS <- SOW6
    j <- length(management@DINDEX) + 1
    management@DINDEX[j] <- DINDEXs
    management@SOW6[j] <- SOW6
    management@DAS[j] <- DAS
    management@WCLSOW[j] <- WCLSOW
    return(management)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
