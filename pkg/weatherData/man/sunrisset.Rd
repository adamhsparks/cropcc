\name{sunrisset}
\alias{sunset}
\alias{sunrise}

\title{
Time of sunrise and sunset
}
\description{
Calculate time of sunrise/sunset for a given location and time of the year
}
\usage{
sunrise(day, month, year, longitude, latitude, zenith=96)
sunset(day, month, year, longitude, latitude, zenith=96)
}
\arguments{
  \item{day}{integer indicating day of month}
  \item{month}{integer indicating month number}
  \item{year}{integer indicating year}
  \item{longitude}{longitude in "decimal" degrees}
  \item{latitude}{latitude in "decimal" degrees}
  \item{zenith}{zenith in degrees}
}

\value{
number, time in hours
}
\note{
The algorithm was taken from:  

Note, however, that this function calculates the value of the sunrise in local mean time (solar time), not UTC.

See maptools to calculate sunrise/sunset in UTC/GMT ("clock" time).
}
\author{
Jacob van Etten
}

\examples{
# Example provided here: http://williams.best.vwh.net/sunrise_sunset_example.htm
sunrise(25, 6, 1990, -74.3, 40.9, zenith=(90+50/60))
# Earliest sunrise is before the solstice (June 20/21)
plot(1:30,sunrise(1:30,6,1990,-74.3,40.9))
  }

\keyword{ spatial }
