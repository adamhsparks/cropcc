\name{interpolateDailyWeather}
\alias{interpolateDailyWeather}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Interpolate daily weather data
}
\description{
Interpolate daily weather data and predict weather for given locations
}
\usage{
interpolateDailyWeather(tableGOSD, locations, startDate, endDate, vars = c("TEMP", "MAX", "MIN", "PRCP"), covars = "ALT", stations = data(stations), logtr = ("PRCP"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tableGOSD}{
%%     ~~Describe \code{tableGOSD} here~~
}
  \item{locations}{
%%     ~~Describe \code{locations} here~~
}
  \item{startDate}{
%%     ~~Describe \code{startDate} here~~
}
  \item{endDate}{
%%     ~~Describe \code{endDate} here~~
}
  \item{vars}{
%%     ~~Describe \code{vars} here~~
}
  \item{covars}{
%%     ~~Describe \code{covars} here~~
}
  \item{stations}{
%%     ~~Describe \code{stations} here~~
}
  \item{logtr}{
%%     ~~Describe \code{logtr} here~~
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

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
