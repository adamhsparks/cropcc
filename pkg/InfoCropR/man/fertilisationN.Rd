\name{fertilisationN}
\alias{fertilisationN}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Update fertilisation
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
fertilisationN(DINDEXs, carbonMine, CNsv, crop, EDTSsv, management, phenology, stress, tabFunction, fertilisation)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{DINDEXs}{
%%     ~~Describe \code{DINDEXs} here~~
}
  \item{carbonMine}{
%%     ~~Describe \code{carbonMine} here~~
}
  \item{CNsv}{
%%     ~~Describe \code{CNsv} here~~
}
  \item{crop}{
%%     ~~Describe \code{crop} here~~
}
  \item{EDTSsv}{
%%     ~~Describe \code{EDTSsv} here~~
}
  \item{management}{
%%     ~~Describe \code{management} here~~
}
  \item{phenology}{
%%     ~~Describe \code{phenology} here~~
}
  \item{stress}{
%%     ~~Describe \code{stress} here~~
}
  \item{tabFunction}{
%%     ~~Describe \code{tabFunction} here~~
}
  \item{fertilisation}{
%%     ~~Describe \code{fertilisation} here~~
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
function (DINDEXs, carbonMine, CNsv, crop, EDTSsv, management, 
    phenology, stress, tabFunction, fertilisation) 
{
    CA1DEC <- carbonMine@CA1DEC[length(carbonMine@CA1DEC)]
    CA2DEC <- carbonMine@CA2DEC[length(carbonMine@CA2DEC)]
    CA3DEC <- carbonMine@CA3DEC[length(carbonMine@CA3DEC)]
    CL1DEC <- carbonMine@CL1DEC[length(carbonMine@CL1DEC)]
    CL2DEC <- carbonMine@CL2DEC[length(carbonMine@CL2DEC)]
    CL3DEC <- carbonMine@CL3DEC[length(carbonMine@CL3DEC)]
    LI1DEC <- carbonMine@LI1DEC[length(carbonMine@LI1DEC)]
    LI2DEC <- carbonMine@LI2DEC[length(carbonMine@LI2DEC)]
    LI3DEC <- carbonMine@LI3DEC[length(carbonMine@LI3DEC)]
    ANCRGR <- CNsv@ANCRGR[length(CNsv@ANCRGR)]
    ANCRPT <- CNsv@ANCRPT[length(CNsv@ANCRPT)]
    NUPTDS <- crop@NUPTDS
    RICE <- crop@RICE
    DSTART <- EDTSsv@DSTART[length(EDTSsv@DSTART)]
    IRRIGS <- EDTSsv@IRRIGS[length(EDTSsv@IRRIGS)]
    RAINF <- EDTSsv@RAINF[length(EDTSsv@RAINF)]
    CNOM1 <- management@CNOM1[length(management@CNOM1)]
    CNOM2 <- management@CNOM2[length(management@CNOM2)]
    CNOM3 <- management@CNOM3[length(management@CNOM3)]
    NTSWCH <- management@NTSWCH[length(management@NTSWCH)]
    DS <- phenology@DS[length(phenology@DS)]
    NSTRES <- stress@NSTRES[length(stress@NSTRES)]
    NH4AP1 <- tabFunction@NH4AP1
    NH4AP2 <- tabFunction@NH4AP2
    NH4AP3 <- tabFunction@NH4AP3
    NOAP1 <- tabFunction@NOAP1
    NOAP2 <- tabFunction@NOAP2
    NOAP3 <- tabFunction@NOAP3
    OM1DAT <- tabFunction@OM1DAT
    OM2DAT <- tabFunction@OM2DAT
    OM3DAT <- tabFunction@OM3DAT
    UREAP1 <- tabFunction@UREAP1
    UREAP2 <- tabFunction@UREAP2
    UREAP3 <- tabFunction@UREAP3
    OM1APP <- AFGEN(OM1DAT, DSTART)
    OM2APP <- AFGEN(OM2DAT, DSTART)
    OM3APP <- AFGEN(OM3DAT, DSTART)
    UAPPL1 <- AFGEN(UREAP1, DSTART)
    UAPPL2 <- AFGEN(UREAP2, DSTART)
    UAPPL3 <- AFGEN(UREAP3, DSTART)
    NITAMT <- INSW(DS - NUPTDS, AMAX1(20, ANCRPT - ANCRGR), 0)
    NITADD <- INSW(NTSWCH - 1, 0, INSW(NSTRES - 0.9, NITAMT, 
        0))
    NH4ADD <- INSW(RICE - 1, 0, NITADD)
    NHAPL1 <- AFGEN(NH4AP1, DSTART) + NH4ADD
    NHAPL2 <- AFGEN(NH4AP2, DSTART)
    NHAPL3 <- AFGEN(NH4AP3, DSTART)
    NO3ADD <- INSW(RICE - 1, NITADD, 0)
    NOAPL1 <- AFGEN(NOAP1, DSTART) + NO3ADD
    NOAPL2 <- AFGEN(NOAP2, DSTART)
    NOAPL3 <- AFGEN(NOAP3, DSTART)
    RAINN <- RAINF * 0.001 + IRRIGS * 0.003
    ORGNIT <- (CA1DEC + CL1DEC + LI1DEC) * 1/CNOM1 + (CA2DEC + 
        CL2DEC + LI2DEC) * 1/CNOM2 + (CA3DEC + CL3DEC + LI3DEC) * 
        1/CNOM3
    j <- length(fertilisation@DINDEX) + 1
    fertilisation@DINDEX[j] <- DINDEXs
    fertilisation@NHAPL1[j] <- NHAPL1
    fertilisation@NHAPL2[j] <- NHAPL2
    fertilisation@NHAPL3[j] <- NHAPL3
    fertilisation@NOAPL1[j] <- NOAPL1
    fertilisation@NOAPL2[j] <- NOAPL2
    fertilisation@NOAPL3[j] <- NOAPL3
    fertilisation@OM1APP[j] <- OM1APP
    fertilisation@OM2APP[j] <- OM2APP
    fertilisation@OM3APP[j] <- OM3APP
    fertilisation@ORGNIT[j] <- ORGNIT
    fertilisation@RAINN[j] <- RAINN
    fertilisation@UAPPL1[j] <- UAPPL1
    fertilisation@UAPPL2[j] <- UAPPL2
    fertilisation@UAPPL3[j] <- UAPPL3
    return(fertilisation)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
