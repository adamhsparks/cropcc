\name{cropDamage2}
\alias{cropDamage2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Determine crop damage
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
cropDamage2(CNsv, crop, GRsv, management, pestD, tabFunction, cropsv)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{CNsv}{
%%     ~~Describe \code{CNsv} here~~
}
  \item{crop}{
%%     ~~Describe \code{crop} here~~
}
  \item{GRsv}{
%%     ~~Describe \code{GRsv} here~~
}
  \item{management}{
%%     ~~Describe \code{management} here~~
}
  \item{pestD}{
%%     ~~Describe \code{pestD} here~~
}
  \item{tabFunction}{
%%     ~~Describe \code{tabFunction} here~~
}
  \item{cropsv}{
%%     ~~Describe \code{cropsv} here~~
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
function (CNsv, crop, GRsv, management, pestD, tabFunction, cropsv) 
{
    ANLV <- CNsv@ANLV[length(CNsv@ANLV)]
    ANSO <- CNsv@ANSO[length(CNsv@ANSO)]
    ANST <- CNsv@ANST[length(CNsv@ANST)]
    RUSTST <- crop@RUSTST
    DLV <- cropsv@DLV[length(cropsv@DLV)]
    EFFLAI <- cropsv@EFFLAI[length(cropsv@EFFLAI)]
    HONYLS <- cropsv@HONYLS[length(cropsv@HONYLS)]
    LAI <- cropsv@LAI[length(cropsv@LAI)]
    WSO <- cropsv@WSO[length(cropsv@WSO)]
    WIR <- GRsv@WIR[length(GRsv@WIR)]
    WLVG <- GRsv@WLVG[length(GRsv@WLVG)]
    DAS <- management@DAS[length(management@DAS)]
    ESWI <- management@ESWI[length(management@ESWI)]
    CONSR <- pestD@CONSR
    FEEDRT <- pestD@FEEDRT
    FRPSTL <- pestD@FRPSTL
    FRPSTS <- pestD@FRPSTS
    SKINWT <- pestD@SKINWT
    SUCKRT <- pestD@SUCKRT
    SUKNRT <- pestD@SUKNRT
    CUTIND <- tabFunction@CUTIND
    DAMIND <- tabFunction@DAMIND
    NODEBR <- tabFunction@NODEBR
    PPLFBD <- tabFunction@PPLFBD
    PPOSKD <- tabFunction@PPOSKD
    PPLFGD <- tabFunction@PPLFGD
    SBINFD <- tabFunction@SBINFD
    SEVLT <- tabFunction@SEVLT
    SEVR <- tabFunction@SEVR
    SEVRPM <- tabFunction@SEVRPM
    TERIND <- tabFunction@TERIND
    WEED <- tabFunction@WEED
    SBINRT <- AFGEN(SBINFD, DAS)
    TERMRT <- AFGEN(TERIND, DAS)
    DAMPRT <- AFGEN(DAMIND, DAS)
    CUTWRT <- AFGEN(CUTIND, DAS)
    DMGSTR <- AMAX1(SBINRT, TERMRT, DAMPRT, CUTWRT)/100
    NODERT <- AFGEN(NODEBR, DAS)
    LVFEED <- AMIN1(LAI, AMAX1(CONSR * AFGEN(PPLFBD, DAS), FEEDRT * 
        AFGEN(PPLFGD, DAS)))
    LRFEED <- LIMIT(5e-05, 1, LVFEED/NOTNUL(LAI))
    PPOSK <- AFGEN(PPOSKD, DAS)
    HONYWT <- SUCKRT * 0.404 * PPOSK * SKINWT - HONYLS
    HONYSM <- HONYWT
    HONYLS <- AMIN1(HONYSM, HONYSM * DLV/NOTNUL(WLVG + DLV))
    FRPSTP <- 1 - (FRPSTS + FRPSTL)
    SUCKLV <- AMIN1(WLVG, SUCKRT * PPOSK * SKINWT * FRPSTL * 
        ESWI)
    SUCKSO <- AMIN1(WSO, SUCKRT * PPOSK * SKINWT * FRPSTP * ESWI)
    SUCKST <- AMIN1(WIR, SUCKRT * PPOSK * SKINWT * FRPSTS * ESWI)
    SUKNLV <- AMIN1(ANLV, SUKNRT * PPOSK * SKINWT * FRPSTL * 
        ESWI)
    SUKNSO <- AMIN1(ANSO, SUKNRT * PPOSK * SKINWT * FRPSTP * 
        ESWI)
    SUKNST <- AMIN1(ANST, SUKNRT * PPOSK * SKINWT * FRPSTS * 
        ESWI)
    RUST <- AFGEN(SEVR, DAS) * RUSTST/100
    MILDEW <- AFGEN(SEVRPM, DAS)/100
    BLIGHT <- AFGEN(SEVLT, DAS)/100
    WEEDCV <- AFGEN(WEED, DAS)
    PSTPAR <- LIMIT(0, EFFLAI, EFFLAI * AMAX1(HONYSM * 0.5/NOTNUL(HONYSM + 
        WLVG), RUST, MILDEW, BLIGHT))
    j <- length(cropsv@BLIGHT) + 1
    cropsv@BLIGHT[j] <- BLIGHT
    cropsv@DMGSTR[j] <- DMGSTR
    cropsv@HONYLS[j] <- HONYLS
    cropsv@HONYSM[j] <- HONYSM
    cropsv@LRFEED[j] <- LRFEED
    cropsv@LVFEED[j] <- LVFEED
    cropsv@MILDEW[j] <- MILDEW
    cropsv@NODERT[j] <- NODERT
    cropsv@PSTPAR[j] <- PSTPAR
    cropsv@RUST[j] <- RUST
    cropsv@SUCKLV[j] <- SUCKLV
    cropsv@SUCKSO[j] <- SUCKSO
    cropsv@SUCKST[j] <- SUCKST
    cropsv@SUKNLV[j] <- SUKNLV
    cropsv@SUKNSO[j] <- SUKNSO
    cropsv@SUKNST[j] <- SUKNST
    cropsv@WEEDCV[j] <- WEEDCV
    return(cropsv)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
