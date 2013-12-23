\name{rhizodeposition}
\alias{rhizodeposition}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
rhizodeposition(DINDEXs, GRsv, phenology, root)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{DINDEXs}{
%%     ~~Describe \code{DINDEXs} here~~
}
  \item{GRsv}{
%%     ~~Describe \code{GRsv} here~~
}
  \item{phenology}{
%%     ~~Describe \code{phenology} here~~
}
  \item{root}{
%%     ~~Describe \code{root} here~~
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
function (DINDEXs, GRsv, phenology, root) 
{
    WRT <- GRsv@WRT[length(GRsv@WRT)]
    DS <- phenology@DS[length(phenology@DS)]
    RTEXUD <- INSW(DS - 1, WRT * 6e-04, WRT * 0.0016)
    RTDETH <- WRT * 0.02
    j <- length(root@DINDEX) + 1
    root@DINDEX[j] <- DINDEXs
    root@RTDETH[j] <- RTDETH
    root@RTEXUD[j] <- RTEXUD
    return(root)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
