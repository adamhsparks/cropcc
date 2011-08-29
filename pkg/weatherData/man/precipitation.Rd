\name{precipitation}
\alias{precipitationSeasonal}
\alias{precipitation}

\title{
Seasonal precipitation data (sum and coefficient of variation)
}
\description{
Calculate seasonal precipitation-related variables from daily weather data.
}
\usage{
precipitationSeasonal(dailyWeather, trialData, func=c("sum","cv"), startEnd = c("START","END"))
}
\arguments{
  \item{dailyWeather}{ data frame containing daily weather data}
  \item{trialData}{ data frame containing trial data, with start (START) and end (END) dates of the growing season}
  \item{func}{ which functions to apply, sum, cv or both (default is both)}
  \item{startEnd}{ character vector of two, indicating which column to select for start and end dates from trialData}
}

\value{
vector with summary variables on precipitation
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
