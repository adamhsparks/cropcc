\name{AFGEN}
\alias{AFGEN}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Arbitrary Function GENerator -- for linear interpolation (basic function)
}
\description{
AFGEN derives from the FST language. It is used for interpolation.
}
\usage{
AFGEN(vector_data, number)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{vector_data}{
%%     ~~Describe \code{vector_data} here~~
}
  \item{number}{
%%     ~~Describe \code{number} here~~
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
D.W.G. van Kraalingen, C. Rappoldt & H.H. van Laar. 1994. "Appendix 5 The Fortran Simulation Translator (FST), a simulation language." In: J. Goudriaan & H.H. van Laar, 1994. Modelling potential crop growth processes. Kluwer Academic Publishers, Dordrecht. pp. 219-236.

D.W.G van Kraalingen, C Rappoldt, H.H van Laar, The Fortran simulation translator, a simulation language, European Journal of Agronomy, Volume 18, Issues 3–4, January 2003, Pages 359-361, ISSN 1161-0301, http://dx.doi.org/10.1016/S1161-0301(02)00131-4.
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
function (vector_data, number) 
{
    n <- length(vector_data)
    pair <- seq(2, n, 2)
    odd <- seq(1, n, 2)
    A <- approx(vector_data[odd], vector_data[pair], number)$y
    return(A)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
