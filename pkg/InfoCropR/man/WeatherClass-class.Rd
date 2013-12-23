\name{WeatherClass-class}
\Rdversion{1.1}
\docType{class}
\alias{WeatherClass-class}
\alias{.dataObjectExtract,WeatherClass,numeric-method}

\title{Class \code{"WeatherClass"}}
\description{
%%  ~~ A concise (1-5 lines) description of what the class is. ~~
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("WeatherClass", ...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{DINDEX}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{LAT}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{YEAR}:}{Object of class \code{"integer"} ~~ }
    \item{\code{DOY}:}{Object of class \code{"integer"} ~~ }
    \item{\code{RDD}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{TMMN}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{TMMX}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{VP}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{WN}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{RAIN}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{.dataObjectExtract}{\code{signature(object = "WeatherClass", DINDEXs = "numeric")}: ... }
	 }
}
\references{
%%  ~~put references to the literature/web site here~~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%%  ~~objects to See Also as \code{\link{~~fun~~}}, ~~~
%%  ~~or \code{\linkS4class{CLASSNAME}} for links to other classes ~~~
}
\examples{
showClass("WeatherClass")
}
\keyword{classes}
