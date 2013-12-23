\name{PLOT_TABFUN}
\alias{PLOT_TABFUN}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plot tabular functions
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
PLOT_TABFUN(vector_data, name)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{vector_data}{
%%     ~~Describe \code{vector_data} here~~
}
  \item{name}{
%%     ~~Describe \code{name} here~~
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
function (vector_data, name) 
{
    n <- length(vector_data)
    pair <- seq(2, n, 2)
    odd <- seq(1, n, 2)
    plot(vector_data[odd], vector_data[pair], type = "b", main = name, 
        xlab = "x", ylab = "y")
    return(vector_data)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
