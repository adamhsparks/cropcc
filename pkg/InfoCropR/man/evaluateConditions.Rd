\name{evaluateConditions}
\alias{evaluateConditions}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Check crop conditions
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
evaluateConditions(control, cropsv, phenology)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{cropsv}{
%%     ~~Describe \code{cropsv} here~~
}
  \item{phenology}{
%%     ~~Describe \code{phenology} here~~
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
function (control, cropsv, phenology) 
{
    FPOTAT <- control@FPOTAT[length(control@FPOTAT)]
    FROST <- cropsv@FROST[length(cropsv@FROST)]
    DS <- phenology@DS[length(phenology@DS)]
    GFD <- phenology@GFD[length(phenology@GFD)]
    SINKLT <- phenology@SINKLT[length(phenology@SINKLT)]
    condition <- FALSE
    if (DS > 2.01) {
        condition <- TRUE
    }
    else if (FPOTAT < 0) {
        condition <- TRUE
    }
    else if (FROST > 7) {
        condition <- TRUE
    }
    else if (GFD > 60) {
        condition <- TRUE
    }
    else if (SINKLT < 0) {
        condition <- TRUE
    }
    return(condition)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
