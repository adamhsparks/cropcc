\name{SUBR_SUBPET}
\alias{SUBR_SUBPET}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Potential evapotranspiration subroutine
}
\description{
Calculates potential evapotranspiration
}
\usage{
SUBR_SUBPET(TIME, climate, control, cropsv, EDTSsv, soil, SWBsv, tabFunction, weather, srSUBPET)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{TIME}{
%%     ~~Describe \code{TIME} here~~
}
  \item{climate}{
%%     ~~Describe \code{climate} here~~
}
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{cropsv}{
%%     ~~Describe \code{cropsv} here~~
}
  \item{EDTSsv}{
%%     ~~Describe \code{EDTSsv} here~~
}
  \item{soil}{
%%     ~~Describe \code{soil} here~~
}
  \item{SWBsv}{
%%     ~~Describe \code{SWBsv} here~~
}
  \item{tabFunction}{
%%     ~~Describe \code{tabFunction} here~~
}
  \item{weather}{
%%     ~~Describe \code{weather} here~~
}
  \item{srSUBPET}{
%%     ~~Describe \code{srSUBPET} here~~
}
}
\details{
This subroutine calculates reference evapotranspiration in a manner similar to Penman (1948). To obtain crop evapo-transpiration, multiplication with a Penman crop factor should be done. Calculations can be carried out for three types of surfaces: water, wet soil, and short grass (ISURF=1,2,3 resp.). When the input variable TMDI is set to zero, a single calculation is done and an estimate is provided of temperature difference between the environment and the surface (DT). If the absolute value of DT is large an iterative Penman can be carried out which continues until the new surface temperature differs by no more than TMDI from the old surface temperature. Two types of long-wave radiation calculations are available Swinbank and Brunt. The switch between the two is made by choosing the right values for ANGA and ANGB. If ANGA and ANGB are zero, Swinbank is used, if both are positive, Brunt is used and the ANGA and ANGB values are in the calculation of the cloud cover.          }
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
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
