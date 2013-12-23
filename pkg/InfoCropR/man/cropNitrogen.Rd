\name{cropNitrogen}
\alias{cropNitrogen}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Update nitrogen
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
cropNitrogen(DINDEXs, carbonInmo, control, crop, cropsv, GRsv, management, phenology, SNBsv, soil, soilD, srDELAY, stress, SWBsv, tabFunction, CNsv)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{DINDEXs}{
%%     ~~Describe \code{DINDEXs} here~~
}
  \item{carbonInmo}{
%%     ~~Describe \code{carbonInmo} here~~
}
  \item{control}{
%%     ~~Describe \code{control} here~~
}
  \item{crop}{
%%     ~~Describe \code{crop} here~~
}
  \item{cropsv}{
%%     ~~Describe \code{cropsv} here~~
}
  \item{GRsv}{
%%     ~~Describe \code{GRsv} here~~
}
  \item{management}{
%%     ~~Describe \code{management} here~~
}
  \item{phenology}{
%%     ~~Describe \code{phenology} here~~
}
  \item{SNBsv}{
%%     ~~Describe \code{SNBsv} here~~
}
  \item{soil}{
%%     ~~Describe \code{soil} here~~
}
  \item{soilD}{
%%     ~~Describe \code{soilD} here~~
}
  \item{srDELAY}{
%%     ~~Describe \code{srDELAY} here~~
}
  \item{stress}{
%%     ~~Describe \code{stress} here~~
}
  \item{SWBsv}{
%%     ~~Describe \code{SWBsv} here~~
}
  \item{tabFunction}{
%%     ~~Describe \code{tabFunction} here~~
}
  \item{CNsv}{
%%     ~~Describe \code{CNsv} here~~
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
function (DINDEXs, carbonInmo, control, crop, cropsv, GRsv, management, 
    phenology, SNBsv, soil, soilD, srDELAY, stress, SWBsv, tabFunction, 
    CNsv) 
{
    CIMMO1 <- carbonInmo@CIMMO1[length(carbonInmo@CIMMO1)]
    CIMMO2 <- carbonInmo@CIMMO2[length(carbonInmo@CIMMO2)]
    CIMMO3 <- carbonInmo@CIMMO3[length(carbonInmo@CIMMO3)]
    ANCRGR <- CNsv@ANCRGR[length(CNsv@ANCRGR)]
    ANLD <- CNsv@ANLD[length(CNsv@ANLD)]
    ANSD <- CNsv@ANSD[length(CNsv@ANSD)]
    ANLV <- CNsv@ANLV[length(CNsv@ANLV)]
    ANRT <- CNsv@ANRT[length(CNsv@ANRT)]
    ANSO <- CNsv@ANSO[length(CNsv@ANSO)]
    ANST <- CNsv@ANST[length(CNsv@ANST)]
    NLVI <- control@NLVI[length(control@NLVI)]
    NRTI <- control@NRTI[length(control@NRTI)]
    SWXNIT <- control@SWXNIT[length(control@SWXNIT)]
    TKL3 <- control@TKL3[length(control@TKL3)]
    CRPNFX <- crop@CRPNFX
    GREENF <- crop@GREENF
    LEGUME <- crop@LEGUME
    MAXNUP <- crop@MAXNUP
    NHRICE <- crop@NHRICE
    NMAXGR <- crop@NMAXGR
    NUPTDS <- crop@NUPTDS
    RFNLV <- crop@RFNLV
    RFNRT <- crop@RFNRT
    RFNST <- crop@RFNST
    VARNFX <- crop@VARNFX
    AGFR <- cropsv@AGFR[length(cropsv@AGFR)]
    ATRANS <- cropsv@ATRANS[length(cropsv@ATRANS)]
    DLV <- cropsv@DLV[length(cropsv@DLV)]
    DMGSTR <- cropsv@DMGSTR[length(cropsv@DMGSTR)]
    DST <- cropsv@DST[length(cropsv@DST)]
    LRFEED <- cropsv@LRFEED[length(cropsv@LRFEED)]
    PLTR <- cropsv@PLTR[length(cropsv@PLTR)]
    POTYLD <- cropsv@POTYLD[length(cropsv@POTYLD)]
    SUKNLV <- cropsv@SUKNLV[length(cropsv@SUKNLV)]
    SUKNSO <- cropsv@SUKNSO[length(cropsv@SUKNSO)]
    SUKNST <- cropsv@SUKNST[length(cropsv@SUKNST)]
    TRWL1 <- cropsv@TRWL1[length(cropsv@TRWL1)]
    TRWL2 <- cropsv@TRWL2[length(cropsv@TRWL2)]
    TRWL3 <- cropsv@TRWL3[length(cropsv@TRWL3)]
    WSO <- cropsv@WSO[length(cropsv@WSO)]
    RWLVG <- GRsv@RWLVG[length(GRsv@RWLVG)]
    RWRT <- GRsv@RWRT[length(GRsv@RWRT)]
    RWST <- GRsv@RWST[length(GRsv@RWST)]
    WLVG <- GRsv@WLVG[length(GRsv@WLVG)]
    WRT <- GRsv@WRT[length(GRsv@WRT)]
    WST <- GRsv@WST[length(GRsv@WST)]
    WSTEM <- GRsv@WSTEM[length(GRsv@WSTEM)]
    CNBACT <- management@CNBACT[length(management@CNBACT)]
    ESW <- management@ESW[length(management@ESW)]
    DS <- phenology@DS[length(phenology@DS)]
    GNLOSS <- phenology@GNLOSS[length(phenology@GNLOSS)]
    GNO <- phenology@GNO[length(phenology@GNO)]
    NH41 <- SNBsv@NH41[length(SNBsv@NH41)]
    NH42 <- SNBsv@NH42[length(SNBsv@NH42)]
    NH43 <- SNBsv@NH43[length(SNBsv@NH43)]
    NO31 <- SNBsv@NO31[length(SNBsv@NO31)]
    NO32 <- SNBsv@NO32[length(SNBsv@NO32)]
    NO33 <- SNBsv@NO33[length(SNBsv@NO33)]
    TKLT <- soil@TKLT[length(soil@TKLT)]
    TKL1 <- soilD@TKL1
    TKL2 <- soilD@TKL2
    NLEAFP <- srDELAY@NLEAFP[length(srDELAY@NLEAFP)]
    TFAC <- stress@TFAC[length(stress@TFAC)]
    AWF1 <- SWBsv@AWF1[length(SWBsv@AWF1)]
    NFXWAT <- tabFunction@NFXWAT
    NMAXLT <- tabFunction@NMAXLT
    NDEMLV <- AMAX1(0, AFGEN(NMAXLT, DS) * GREENF * (WLVG + RWLVG) - 
        ANLV)
    NDEMST <- AMAX1(0, AFGEN(NMAXLT, DS) * GREENF * 0.5 * (WSTEM + 
        RWST) - ANST)
    NDEMRT <- AMAX1(0, AFGEN(NMAXLT, DS) * GREENF * 0.5 * (WRT + 
        RWRT) - ANRT)
    NDEMSO <- AMAX1(0, (WSO + AGFR) * NMAXGR - ANSO)
    NDEMCP <- NDEMLV + NDEMST + NDEMRT
    ANCRPT <- WLVG * AFGEN(NMAXLT, DS) * GREENF + WST * AFGEN(NMAXLT, 
        DS) * GREENF * 0.5 + WSO * NMAXGR
    NFIX <- INSW(LEGUME - 0.5, 0, INSW(DS - 0.35, 0, AMAX1(0, 
        (ANCRPT - ANCRGR)) * CRPNFX * VARNFX * AFGEN(NFXWAT, 
        AWF1) * TFAC) * LIMIT(0, 1, 1 - WSO/NOTNUL(POTYLD)))
    NIMMO1 <- CIMMO1 * CNBACT
    NIMMO2 <- CIMMO2 * CNBACT
    NIMMO3 <- CIMMO3 * CNBACT
    NIMMOT <- NIMMO1 + NIMMO2 + NIMMO3
    NUPTK1 <- INSW(DS - NUPTDS, AMIN1(MAXNUP * TKL1/TKLT, NDEMCP * 
        TRWL1/(ATRANS + 1e-10), NO31 + NH41 * NHRICE), 0)
    NUPTK2 <- INSW(DS - NUPTDS, AMIN1(MAXNUP * TKL2/TKLT, NDEMCP * 
        TRWL2/(ATRANS + 1e-10), NO32 + NH42 * NHRICE), 0)
    NUPTK3 <- INSW(DS - NUPTDS, AMIN1(MAXNUP * TKL3/TKLT, NDEMCP * 
        TRWL3/(ATRANS + 1e-10), NO33 + NH43 * NHRICE), 0)
    NUPTKT <- NUPTK1 + NUPTK2 + NUPTK3 + NFIX
    NUPTKS <- NUPTKT
    NALV <- INSW(SWXNIT - 1, AMAX1(0, AMIN1(NDEMLV, NUPTKT * 
        (NDEMLV/NOTNUL(NDEMCP)))), NDEMLV)
    NAST <- INSW(SWXNIT - 1, AMAX1(0, AMIN1(NDEMST, NUPTKT * 
        (NDEMST/NOTNUL(NDEMCP)))), NDEMST)
    NART <- INSW(SWXNIT - 1, AMAX1(0, AMIN1(NDEMRT, NUPTKT * 
        (NDEMRT/NOTNUL(NDEMCP)))), NDEMRT)
    NDLV <- DLV * RFNLV - AMIN1(ANLD, ANLD * (1 - PLTR))
    NDST <- DST * RFNST - AMIN1(ANSD, ANSD * (1 - PLTR))
    ATNLV <- AMAX1(0, INSW(WSO - 1, 0, ANLV + NALV - WLVG * RFNLV))
    ATNST <- AMAX1(0, INSW(WSO - 1, 0, ANST + NAST - WSTEM * 
        RFNST))
    ATNRT <- AMAX1(0, INSW(WSO - 1, 0, ANRT + NART - WRT * RFNRT))
    ATN <- ATNLV + ATNST + ATNRT
    NSO <- AMIN1(NDEMSO, ATN) - AMIN1(ANSO, SUKNSO + ANSO * GNLOSS/NOTNUL(GNO))
    NTLV <- LIMIT(0, ANLV, NSO * ATNLV/NOTNUL(ATN))
    NTST <- LIMIT(0, ANST, NSO * ATNST/NOTNUL(ATN))
    NTRT <- LIMIT(0, ANRT, NSO * ATNRT/NOTNUL(ATN))
    NMOBIL <- INSW(WSO - 100, 0, AMAX1(0, (NLEAFP - ANLV)/(ANLV + 
        1e-10)))
    NLV <- NLVI * ESW + NALV - AMIN1(ANLV, NTLV + NDLV + ANLV * 
        (1 - PLTR) + ANLV * LRFEED + SUKNLV + DMGSTR * ANLV)
    NST <- NAST - AMIN1(ANST, NTST + NDST + ANST * (1 - PLTR) + 
        SUKNST + DMGSTR * ANST)
    NRT <- NRTI * ESW + NART - AMIN1(ANRT, NTRT + ANRT * (1 - 
        PLTR))
    ANRT <- NRT
    ANST <- NST
    ANSD <- NDST
    ANLV <- NLV
    ANSO <- NSO
    ANLD <- NDLV
    ANCR <- ANSO + ANLV + ANLD + ANST + ANSD
    ANCRGR <- ANSO + ANLV + ANST
    j <- length(CNsv@DINDEX) + 1
    CNsv@DINDEX[j] <- DINDEXs
    CNsv@ANCRGR[j] <- ANCRGR
    CNsv@ANLD[j] <- ANLD
    CNsv@ANLV[j] <- ANLV
    CNsv@ANRT[j] <- ANRT
    CNsv@ANSD[j] <- ANSD
    CNsv@ANSO[j] <- ANSO
    CNsv@ANST[j] <- ANST
    CNsv@ANCRPT[j] <- ANCRPT
    CNsv@NIMMO1[j] <- NIMMO1
    CNsv@NIMMO2[j] <- NIMMO2
    CNsv@NIMMO3[j] <- NIMMO3
    CNsv@NIMMOT[j] <- NIMMOT
    CNsv@NMOBIL[j] <- NMOBIL
    CNsv@NFIX[j] <- NFIX
    CNsv@NUPTK1[j] <- NUPTK1
    CNsv@NUPTK2[j] <- NUPTK2
    CNsv@NUPTK3[j] <- NUPTK3
    return(CNsv)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
