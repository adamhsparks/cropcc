\name{co2emission_globalWarmingPotential}
\alias{co2emission_globalWarmingPotential}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Greenhouse gas emission
}
\description{
CO2 emission and greenhouse warming potential
}
\usage{
co2emission_globalWarmingPotential(carbonMine, management, methane, nitrogenEmi, co2Emission)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{carbonMine}{
%%     ~~Describe \code{carbonMine} here~~
}
  \item{management}{
%%     ~~Describe \code{management} here~~
}
  \item{methane}{
%%     ~~Describe \code{methane} here~~
}
  \item{nitrogenEmi}{
%%     ~~Describe \code{nitrogenEmi} here~~
}
  \item{co2Emission}{
%%     ~~Describe \code{co2Emission} here~~
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
function (DINDEXs, carbonMine, management, methane, nitrogenEmi, 
    co2Emission) 
{
    CDOC1 <- carbonMine@CDOC1[length(carbonMine@CDOC1)]
    CDOC2 <- carbonMine@CDOC2[length(carbonMine@CDOC2)]
    CDOC3 <- carbonMine@CDOC3[length(carbonMine@CDOC3)]
    CO2BAL <- co2Emission@CO2BAL[length(co2Emission@CO2BAL)]
    TCOEFF <- management@TCOEFF
    CH4PR1 <- methane@CH4PR1[length(methane@CH4PR1)]
    CH4PR2 <- methane@CH4PR2[length(methane@CH4PR2)]
    CH4PR3 <- methane@CH4PR3[length(methane@CH4PR3)]
    CHEMIT <- methane@CHEMIT[length(methane@CHEMIT)]
    N2OTOT <- nitrogenEmi@N2OTOT[length(nitrogenEmi@N2OTOT)]
    CO2L1 <- CDOC1 - CH4PR1
    CO2L2 <- CDOC2 - CH4PR2
    CO2L3 <- CDOC3 - CH4PR3
    CO2TOT <- CO2L1 + CO2L2 + CO2L3
    CO2SOL <- CO2BAL
    CO2EMS <- CO2SOL/TCOEFF
    CO2BAL <- CO2TOT - CO2EMS
    GWP <- CO2EMS + CHEMIT * 21 + N2OTOT * 310
    GLOBWP <- GWP
    j <- length(co2Emission@DINDEX) + 1
    co2Emission@DINDEX[j] <- DINDEXs
    co2Emission@CO2BAL[j] <- CO2BAL
    co2Emission@CO2L1[j] <- CO2L1
    co2Emission@CO2L2[j] <- CO2L2
    co2Emission@CO2L3[j] <- CO2L3
    co2Emission@GWP[j] <- GWP
    return(co2Emission)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
