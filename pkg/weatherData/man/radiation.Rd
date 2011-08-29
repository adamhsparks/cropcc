\name{radiation}
\alias{radiationSeasonal}
\alias{radiationDaily}
\alias{radiation}

\title{
Seasonal radiation data (sum)
}
\description{
Calculate seasonal total radiation variables from daily weather data.
}
\usage{
radiationSeasonal(dailyWeather, trialData, trialLocs, method="HR2", startEnd = c("START","END"))
radiationDaily(Date, latitude, Tmin, Tmax, method="HR2")
}
\arguments{
  \item{dailyWeather}{ data frame containing daily weather data}
  \item{trialData}{ data frame containing trial data, with start (START) and end (END) dates of the growing season}
  \item{trialLocs}{ trial locations, following a standard format}  
  \item{method}{ which method to use (HR1 or HR2)}
  \item{startEnd}{ character vector of two, indicating which column to select for start and end dates from trialData}
  \item{Date}{ date in format "2011-1-31"}
  \item{latitude}{ latitude of the location in degrees}
  \item{Tmax}{ single number or vector with daily maximum temperature values}
  \item{Tmin}{ single number or vector with daily minimum temperature values}

}

\value{
vector with summary variables on radiation
}
\author{
Jacob van Etten
}
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

}
\keyword{ data }
