\name{downloadGSOD}
\alias{downloadGSOD}
\alias{listFilesGSOD}

\title{
Download Global Summary of Day data 
}
\description{
Download GSOD data, created by the NCDC.

Users of these data should take into account the following (from the NCDC website):

"The following data and products may have conditions placed on their international commercial use. 
They can be used within the U.S. or for non-commercial international activities without restriction. 
The non-U.S. data cannot be redistributed for commercial purposes.
Re-distribution of these data by others must provide this same notification."
}
\usage{
downloadGSOD(startYear, endYear, stations, silent = TRUE, tries = 2, localdir = NULL)
listFilesGSOD(startYear, endYear, stations, localdir=NULL)
}
\arguments{
  \item{startYear}{
first year to download
}
  \item{endYear}{
last year to download
}
  \item{stations}{
(subsetted) table with stations to download
}
  \item{silent}{
report progress or not (default is FALSE)
}
  \item{tries}{
number of times to retry when download of a particular station-year file fails (default is 2)
}
  \item{localdir}{
local directory to which the data should be written (default is NULL)
}
}
\details{
The function downloadGSOD downloads the data by station-year file for the specified time period and stations.
listFilesGSOD provides a vector of file names, which could be used with a downloading programme or plug-in.
Both functions first look in localdir to see if the file already exists if localdir is given.
}
\value{
A list of file names
}
\references{
\url{ftp://ftp.ncdc.noaa.gov/pub/data/gsod/readme.txt}
}
\author{
Jacob van Etten
}

\seealso{
\code{\link{makeTableGSOD}}
}
\examples{

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ data }

