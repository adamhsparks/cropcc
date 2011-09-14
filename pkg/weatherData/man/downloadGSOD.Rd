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
downloadGSOD(startYear, endYear, stations, silent = TRUE, tries = 2, overwrite= TRUE, folder = getwd())
listFilesGSOD(startYear, endYear, stations, folder = getwd(), clipboard = FALSE)
}
\arguments{
  \item{startYear}{ first year to download}
  \item{endYear}{ last year to download}
  \item{stations}{ (subsetted) table with stations to download}
  \item{silent}{ report progress or not (default is FALSE)}
  \item{tries}{ number of times to retry when download of a particular station-year file fails (default is 2)}
  \item{overwrite}{ whether files in the folder should be overwritten with files having the same name}  
  \item{folder}{ local directory to which the downloaded data should be written (default is the working directory) }
  \item{clipboard}{ should the file names be written to the clipboard? can fail due to memory limitations of clipboard}  
}
\details{
The function downloadGSOD downloads the data by station-year file for the specified time period and stations.

listFilesGSOD provides a vector of file names, which could be used with a downloading programme or plug-in.
listFilesGSOD creates a batch file that can be loaded into a download manager. 
For instance, use Free Download Manager. http://www.freedownloadmanager.org/
Click [File] - [Import] - [Import list of downloads] to upload the text file created with listFilesGSOD().
You will need to fiddle a bit with the settings to make.
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

