\name{downloadGOSD}
\alias{downloadGOSD}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
downloadGOSD(startYear, endYear, stations = data(stations), silent = TRUE, tries = 2, localdir = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{startYear}{
%%     ~~Describe \code{startYear} here~~
}
  \item{endYear}{
%%     ~~Describe \code{endYear} here~~
}
  \item{stations}{
%%     ~~Describe \code{stations} here~~
}
  \item{silent}{
%%     ~~Describe \code{silent} here~~
}
  \item{tries}{
%%     ~~Describe \code{tries} here~~
}
  \item{localdir}{
%%     ~~Describe \code{localdir} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
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

## The function is currently defined as
function(startYear, endYear, stations=data(stations), silent=TRUE, tries=2, localdir=NULL)
{
startDate <- as.Date(paste(startYear,"-01-01",sep=""))
endDate <- as.Date(paste(endYear,"-12-31",sep=""))

stations <- stationsPeriod(startDate, endDate, stations)

if(!silent) cat("total ", length(stations[,1]), " stations to be dowloaded", "\n")
files <- NULL

#loop by station

for(station in 1:length(stations[,1]))
{

#set up things for the station
startYearStation <- substring(as.Date(stations$BEGIN[station]),1,4)
endYearStation <- substring(as.Date(stations$END[station]),1,4)
START <- max(startYear, startYearStation)
END <- min(endYear, endYearStation)

#loop through years for the station

absent <- TRUE

for (year in START:END)
{
if(!is.null(localdir))
{
tryit <- try(file(paste(localdir, "/", "gosd-", stations[station, 2], "-", stations[station, 3], "-", year, ".op.gz", sep = "")))
if(class(tryit) != "try-error") 
{
absent <- FALSE
files <- c(files, tryit)
  }
  }

if(is.null(localdir) | absent)
{
#set things up -- url and file name, counter for tries

urlYearStation <- paste("ftp://ftp.ncdc.noaa.gov/pub/data/gsod/", year, "/", stations[station, 2], "-", stations[station, 3], "-", year, ".op.gz", sep = "")
fileYearStation <- paste(getwd(), "/", "gosd-", stations[station, 2], "-", stations[station, 3], "-", year, ".op.gz", sep = "")
tried <- tries

#while loop to try more than once

while(tried > 0.5)
{
tryIt <- try(download.file(urlYearStation, fileYearStation, quiet=silent), silent = T)
if(class(tryIt) == "try-error") {tried <- tried - 1} 
else {tried <- 0}
  }

#add file name to final file list

files <- c(files, fileYearStation)


  }

absent <- TRUE

  }
if(!silent) cat("Station no. ", station," done.\n")
  }
cat("\n")
return(files)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
