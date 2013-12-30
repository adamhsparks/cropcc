\name{SUBR_SOIL}
\alias{SUBR_SOIL}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Soil subroutine
}
\description{
Updates soil conditions
}
\usage{
SUBR_SOIL(soilD, srSOIL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{soilD}{
%%     ~~Describe \code{soilD} here~~
}
  \item{srSOIL}{
%%     ~~Describe \code{srSOIL} here~~
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
function (DINDEXs, soilD, srSOIL) 
{
    SAND1 <- soilD@SAND1
    SAND2 <- soilD@SAND2
    SAND3 <- soilD@SAND3
    BDC1 <- 1.1 + 0.0045 * SAND1
    BDC2 <- 1.1 + 0.0045 * SAND2
    BDC3 <- 1.1 + 0.0045 * SAND3
    WCSTC1 <- 1 - BDC1/2.65
    WCSTC2 <- 1 - BDC2/2.65
    WCSTC3 <- 1 - BDC3/2.65
    WCFCC1 <- (0.01875 + 0.00411 * (100 - SAND1)) * BDC1
    WCFCC2 <- (0.01875 + 0.00411 * (100 - SAND2)) * BDC2
    WCFCC3 <- (0.01875 + 0.00411 * (100 - SAND3)) * BDC3
    WCWPC1 <- (-0.001185 + 0.00218 * (100 - SAND1)) * BDC1
    WCWPC2 <- (-0.001185 + 0.00218 * (100 - SAND2)) * BDC2
    WCWPC3 <- (-0.001185 + 0.00218 * (100 - SAND3)) * BDC3
    WCAD1 <- AMAX1(0.04, -0.0178 + WCWPC1 * 0.6556)
    WCAD2 <- AMAX1(0.04, -0.0178 + WCWPC2 * 0.6556)
    WCAD3 <- AMAX1(0.04, -0.0178 + WCWPC3 * 0.6556)
    KSATC1 <- SAND1 * 3
    KSATC3 <- SAND3 * 3
    j <- length(srSOIL@DINDEX) + 1
    srSOIL@DINDEX[j] <- DINDEXs
    srSOIL@BDC1[j] <- BDC1
    srSOIL@BDC2[j] <- BDC2
    srSOIL@BDC3[j] <- BDC3
    srSOIL@WCSTC1[j] <- WCSTC1
    srSOIL@WCSTC2[j] <- WCSTC2
    srSOIL@WCSTC3[j] <- WCSTC3
    srSOIL@WCFCC1[j] <- WCFCC1
    srSOIL@WCFCC2[j] <- WCFCC2
    srSOIL@WCFCC3[j] <- WCFCC3
    srSOIL@WCWPC1[j] <- WCWPC1
    srSOIL@WCWPC2[j] <- WCWPC2
    srSOIL@WCWPC3[j] <- WCWPC3
    srSOIL@WCAD1[j] <- WCAD1
    srSOIL@WCAD2[j] <- WCAD2
    srSOIL@WCAD3[j] <- WCAD3
    srSOIL@KSATC1[j] <- KSATC1
    srSOIL@KSATC3[j] <- KSATC3
    return(srSOIL)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
