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
interpolateDailyWeather(tableGSOD, locations, startDate, endDate, vars = c("TEMP", "MAX", "MIN", "PRCP"), covars = "ALT", stations, sqrtTr = ("PRCP"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tableGSOD}{
table with daily weather data for stations
}
  \item{locations}{
locations for which values should be interpolated, data frame or matrix with four columns: unique ID ("ID"), longitude ("LON"), latitude ("LAT") and altitude("ALT"), in that order
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
co-variables that should be included in the interpolation (default is "ALT", altitude)
}
  \item{stations}{
table with stations data
}
  \item{sqrtTr}{
variables to undergo square-root transformation (default: "PRCP", precipitation)
}
  \item{silent}{
will show interpolated surfaces if FALSE (default: TRUE)
}
}
\details{

}
\value{
data frame with interpolated values for the selected variables
}
\references{

}
\author{
Jacob van Etten
}
\note{

}



\seealso{

}
\examples{


}
\keyword{ data }
\keyword{ spatial }
