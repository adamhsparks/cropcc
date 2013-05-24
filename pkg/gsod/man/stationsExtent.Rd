\name{stationsExtent}
\alias{stationsExtent}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Subset stations by extent
}
\description{
Subset the stations table, selecting stations located within a certain extent (bounding box)
}
\usage{
stationsExtent(extent, stations)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{extent}{
vector of length 4: c(xmin,xmax,ymin,ymax)
}
  \item{stations}{
data frame containing the stations data
}
}

\value{
data frame
}
\author{
Jacob van Etten
}


\examples{
data(stations)
Extent <- c(10,20,10,20)
stationsExtent(Extent,stations)
  }

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
