\name{readWeatherData}
\alias{readWeatherData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
readWeatherData(path)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{path}{
%%     ~~Describe \code{path} here~~
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
function (path) 
{
    variables <- c("Station", "YEAR", "DOY", "RDD", "TMMN", "TMMX", 
        "VP", "WN", "RAIN")
    files <- list.files(path = path, pattern = NULL, all.files = FALSE, 
        full.names = FALSE, recursive = FALSE)
    NumFiles = length(files)
    path_IC <- paste(path, files[1], sep = "")
    data <- read.table(path_IC, header = FALSE, col.names = variables, 
        skip = 20)
    if (NumFiles > 1) {
        for (i in 2:NumFiles) {
            path_IC <- paste(path, files[i], sep = "")
            data_i <- read.table(path_IC, header = FALSE, col.names = variables, 
                skip = 20)
            data <- rbind(data, data_i)
            rm(data_i)
        }
    }
    result <- new("WeatherClass")
    result@YEAR <- data$YEAR
    result@DOY <- data$DOY
    result@RDD <- data$RDD
    result@TMMN <- data$TMMN
    result@TMMX <- data$TMMX
    result@VP <- data$VP
    result@WN <- data$WN
    result@RAIN <- data$RAIN
    dindex1 <- as.numeric(as.Date(ISOdate(result@YEAR[1], 1, 
        1)))
    result@DINDEX <- seq(dindex1, dindex1 + length(result@YEAR) - 
        1, 1)
    return(result)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
