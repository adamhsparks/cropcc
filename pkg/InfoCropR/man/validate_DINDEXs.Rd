\name{validate_DINDEXs}
\alias{validate_DINDEXs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
validate DINDEXs
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
validate_DINDEXs(DINDEXs_beg, DINDEXs_end)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{DINDEXs_beg}{
%%     ~~Describe \code{DINDEXs_beg} here~~
}
  \item{DINDEXs_end}{
%%     ~~Describe \code{DINDEXs_end} here~~
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
function (DINDEXs_beg, DINDEXs_end) 
{
    Value <- TRUE
    if (DINDEXs_beg < 365) {
        Value <- FALSE
    }
    else if (DINDEXs_end > 11321) {
        Value <- FALSE
    }
    else if (DINDEXs_beg > DINDEXs_end) {
        Value <- FALSE
    }
    return(Value)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
