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
table with daily weather data for stations
}
  \item{locations}{
locations for which values should be interpolated
}
  \item{startDate}{
first date of the period to cover
}
  \item{endDate}{
last data of the period to cover
}
  \item{vars}{
variables that should be interpolated
}
  \item{covars}{
co-variables that should be included in the interpolation (default is ALT, altitude)
}
  \item{stations}{
table with stations data
}
  \item{logtr}{
variables to log-transform
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
data frame with interpolated values for the selected variables
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
