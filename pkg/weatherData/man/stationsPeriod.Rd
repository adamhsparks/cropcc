\name{stationsPeriod}
\alias{stationsPeriod}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Subset stations by period
}
\description{
Subset the stations table, selecting stations with weather data in a given period of time
}
\usage{
stationsPeriod(startDate, endDate, stations, wholePeriod = FALSE)
}
\arguments{
  \item{startDate}{first date for which to include weather data}
  \item{endDate}{last date for which to include weather data}
  \item{stations}{stations data table (data frame)}
  \item{wholePeriod}{select only stations that cover the entire period}
}
\details{

}
\value{
data frame
}
\author{
Jacob van Etten
}

\examples{
data(stations)
stationsSubset <- stationsPeriod("2010-01-01","2010-12-31", stations=stations)
  }

\keyword{ data }

