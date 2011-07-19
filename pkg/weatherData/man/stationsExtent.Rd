\name{stationsExtent}
\alias{stationsExtent}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
stationsExtent(extent, stations = data(stations))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{extent}{
%%     ~~Describe \code{extent} here~~
}
  \item{stations}{
%%     ~~Describe \code{stations} here~~
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
function(extent, stations=data(stations))
{
if(length(extent) != 4) stop("extent should be a vector of 4 elements: c(xmin, xmax, ymin, ymax) or an object of class bbox")
if(extent[1] > extent[2] | extent[3] > extent[4]) stop("extent incorrect (xmin > xmax and/or ymin > ymax)")
stations <- stations[stations$LON > extent[1] & stations$LON < extent[2] & stations$LAT > extent[3] & stations$LAT < extent[4],]
return(stations)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
