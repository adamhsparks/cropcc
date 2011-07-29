\name{makeTableGOSD}
\alias{makeTableGOSD}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Make a table with Global Summary of Day data
}
\description{
This function creates a table from downloaded GSOD files on disk.

Variables are converted to SI units.
}
\usage{
makeTableGOSD(files = NULL, folder = getwd())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{files}{
vector of paths to the data files
}
  \item{folder}{
path to the folder containing the data files; ignored if argument 'files' is not NULL.
}
}

\value{
data frame
  \item{ID }{Unique station ID, combination of following two columns}
  \item{STN }{Station number (WMO/DATSAV3 number) for the location.}
  \item{WBAN }{WBAN number where applicable; historical "Weather Bureau Air Force Navy" number}
  \item{YEAR }{year in which the observations were made}
  \item{MODA }{month and day the observations were made}
  \item{TEMP }{Mean temperature for the day in degrees Celsius}
  \item{CountTEMP }{Number of observations used in calculating mean temperature}
  \item{DEWP }{Mean dew point for the day in degrees Celsius}
  \item{CountDEWP }{Number of observations used in calculating mean dew point}  
  \item{SLP }{Mean sea level pressure for the day in millibars}
  \item{CountSLP }{Number of observations used in 
                         calculating mean sea level pressure}
  \item{STP }{Mean station pressure for the day
                         in millibars}
  \item{CountSTP }{Number of observations used in 
                         calculating mean station pressure}
  \item{VISIB }{Mean visibility for the day in meters}
  \item{CountVISIB }{Number of observations used in 
                         calculating mean visibility}
  \item{WDSP }{Mean wind speed for the day in meters per second}
  \item{CountWDSP }{Number of observations used in 
                         calculating mean wind speed}
  \item{MXSPD }{Maximum sustained wind speed reported 
                         for the day in meters per second}
  \item{GUST }{Maximum wind gust reported for the day
                         in meters per second}
  \item{MAX }{Maximum temperature reported during the 
                         day in degrees Celsius; time of max 
                         temp report varies by country and        
                         region, so this will sometimes not be    
                         the max for the calendar day.}
  \item{FlagMAX }{Blank indicates max temp was taken from the
                         explicit max temp report and not from the              
                         'hourly' data.  * indicates max temp was 
                         derived from the hourly data (i.e., highest
                         hourly or synoptic-reported temperature).}
  \item{MIN }{Minimum temperature reported during the 
                         day in degrees Celsius; time of min 
                         temp report varies by country and        
                         region, so this will sometimes not be  
                         the min for the calendar day.}
  \item{FlagMIN }{Blank indicates min temp was taken from the
                         explicit min temp report and not from the              
                         'hourly' data.  
						 * indicates min temp was 
                         derived from the hourly data (i.e., lowest
                         hourly or synoptic-reported temperature).}
  \item{PRCP }{Total precipitation (rain and/or melted
                         snow) reported during the day in meters; will usually not end 
                         with the midnight observation--i.e., 
                         may include latter part of previous day.
                         .00 indicates no measurable              
                         precipitation (includes a trace).    }
  \item{FlagPRCP }{A = 1 report of 6-hour precipitation 
                             amount.
                         B = Summation of 2 reports of 6-hour 
                             precipitation amount.
                         C = Summation of 3 reports of 6-hour 
                             precipitation amount.
                         D = Summation of 4 reports of 6-hour 
                             precipitation amount.
                         E = 1 report of 12-hour precipitation
                             amount.
                         F = Summation of 2 reports of 12-hour
                             precipitation amount.
                         G = 1 report of 24-hour precipitation
                             amount.
                         H = Station reported '0' as the amount
                             for the day (eg, from 6-hour reports),
                             but also reported at least one
                             occurrence of precipitation in hourly
                             observations--this could indicate a
                             trace occurred, but should be considered
                             as incomplete data for the day.
                         I = Station did not report any precip data
                             for the day and did not report any
                             occurrences of precipitation in its hourly
                             observations--it's still possible that
                             precip occurred but was not reported.}
  \item{SNDP }{Snow depth in meters;last     
                         report for the day if reported more than
                         once.  
                         Note:  Most stations do not report '0' on
                         days with no snow on the ground--therefore,
                         NA will often appear on these days.}
  \item{FRSHTT }{Indicators (1 = yes, 0 = no/not          
                         reported) for the occurrence during the 
                         day of:
                         Fog ('F' - 1st digit).
                         Rain or Drizzle ('R' - 2nd digit).
                         Snow or Ice Pellets ('S' - 3rd digit).
                         Hail ('H' - 4th digit).
                         Thunder ('T' - 5th digit).
                         Tornado or Funnel Cloud ('T' - 6th       
                         digit).}

}

\author{
Jacob van Etten
}
\seealso{
\code{\link{downloadGOSD}}, ~~~
}
\examples{

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
