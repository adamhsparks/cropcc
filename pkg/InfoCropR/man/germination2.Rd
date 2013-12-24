\name{germination2}
\alias{germination2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Germination
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
germination2(phenology, DINDEXs, management)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{phenology}{
%%     ~~Describe \code{phenology} here~~
}
  \item{DINDEXs}{
%%     ~~Describe \code{DINDEXs} here~~
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
function (phenology, DINDEXs, management) 
{
    RDSA <- phenology@RDSA[length(phenology@RDSA)]
    STTIME <- management@STTIME[length(management@STTIME)]
    GERMIX <- RDSA
    GERM1 <- REAAND(0.1 - GERMIX, 1)
    GERMI <- GERM1
    EMERG <- INSW(GERMIX - 0.1, 1000, STTIME + GERMI)
    SOWFXD <- STTIME
    TIME <- DINDEXs
    ESW <- REAAND(TIME - EMERG + 0.5, EMERG - TIME + 0.5)
    ESWI <- ESW
    j <- length(management@SOWFXD) + 1
    management@SOWFXD <- SOWFXD
    management@ESW <- ESW
    management@ESWI <- ESWI
    return(management)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
