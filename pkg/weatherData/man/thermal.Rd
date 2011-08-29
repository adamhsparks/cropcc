\name{thermal}
\alias{thermalStressSeasonal}
\alias{thermalStressDaily}
\alias{temperature}

\title{
Temperature and thermal stress
}
\description{
Calculate temperatures and thermal stress from weather data (daily minimum and maximum temperatures).
}
\usage{
thermalStressSeasonal(criticalTemp, dailyWeather, trialData, trialLocs, startEnd = c("START","END"), zenith=96)
thermalStressDaily(criticalTemp, Tmax, Tmin, sunr, TminNext)
temperature(Time, Tmax, Tmin, sunr, TminNext)
}
\arguments{
  \item{criticalTemp}{ temperature above which thermal stress is experienced}
  \item{dailyWeather}{ data frame containing daily weather data}
  \item{trialData}{ data frame containing trial data, with start (START) and end (END) dates of the growing season}
  \item{trialLocs}{ data frame containing trial locations}  
  \item{startEnd}{ character vector of two, indicating which column to select for start and end dates from trialData}
  \item{zenith}{ zenith angle, see ?sunrise}
  \item{Tmax}{ single number or vector with daily maximum temperature values}
  \item{Tmin}{ single number or vector with daily minimum temperature values}
  \item{sunr}{ single number or vector with daily time of sunrise}
  \item{TminNext}{ single number or vector with minimum temperature values for the next day}
  \item{Time}{ single number or vector with (local mean) time of day in hours}
}

\value{
single number or vector with thermal stress duration (in hours) or temperature values
}
\author{
Jacob van Etten
}
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# Illustration of the thermal stress concept
s <- sunrise(25, 6, 1990, -74.3, 40.9, zenith=(90+50/60))
temp <- temperature(0:24, 31, 15, s, 15)
plot(ts(temp,0,24)) # Modelled course of temperature during the day
abline(30,0) # Line with critical temperature of 30 degrees Celsius

# Now let's calculate for how long the temperature exceeded 30 degrees this day
thermalStressDaily(criticalTemp=30, Tmax=31, Tmin=15, sunr=s, TminNext=15)

# Example with thermalStressSeasonal()

  }

\keyword{ data }
