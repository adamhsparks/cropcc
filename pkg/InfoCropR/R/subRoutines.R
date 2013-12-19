# ---------------------------------------------------------
# Function FUFR: To compute factors accounting for water stress effect on 
#               water uptake.
#==================
# srFUFR
SUBR_FUFR <- function(DINDEXs, crop, soil, srSUBPET, SWBsv, srFUFR)
{
  #-------------------- crop Data
  CROPFC <- crop@CROPFC
  CROPGR <- crop@CROPGR
  RICE   <- crop@RICE
  
  #-------------------- soil Data
  WCFC1 <- soil@WCFC1[length(soil@WCFC1)]
  WCFC2 <- soil@WCFC2[length(soil@WCFC2)]
  WCFC3 <- soil@WCFC3[length(soil@WCFC3)]
  
  WCST1 <- soil@WCST1[length(soil@WCST1)]
  WCST2 <- soil@WCST2[length(soil@WCST2)]
  WCST3 <- soil@WCST3[length(soil@WCST3)]
  
  WCWP1 <- soil@WCWP1[length(soil@WCWP1)]
  WCWP2 <- soil@WCWP2[length(soil@WCWP2)]
  WCWP3 <- soil@WCWP3[length(soil@WCWP3)]
  
  #-------------------- srSUBPET Data
  PTRANS <- srSUBPET@PTRANS[length(srSUBPET@PTRANS)]    #*********************
  
  #-------------------- SWBsv Data
  WCL1 <- SWBsv@WCL1[length(SWBsv@WCL1)]
  WCL2 <- SWBsv@WCL2[length(SWBsv@WCL2)]
  WCL3 <- SWBsv@WCL3[length(SWBsv@WCL3)]
  
  #================
   P <- AMIN1(0.95, AMAX1(0.1, CROPGR/(CROPGR + PTRANS)))
  
   WCCR1 <- WCWP1 + (1 - P) * (WCFC1 - WCWP1)           #== critical soil moisture factor
   WCCR2 <- WCWP2 + (1 - P) * (WCFC2 - WCWP2)           #== critical soil moisture factor
   WCCR3 <- WCWP3 + (1 - P) * (WCFC3 - WCWP3)           #== critical soil moisture factor
  
   WCWET1 <- CROPFC * WCST1
   WCWET2 <- CROPFC * WCST2
   WCWET3 <- CROPFC * WCST3
  
   if((WCL1 > WCWET1) && (RICE > 0)) FR1 <- 1
   if((WCL2 > WCWET2) && (RICE > 0)) FR2 <- 1
   if((WCL3 > WCWET3) && (RICE > 0)) FR3 <- 1
  
  #----- to 1
   if((WCL1 > WCWET1) && (RICE <= 0)) {
      FR1 <- (WCST1 - WCL1)/(WCST1 - WCWET1 + 0.000001)
   } else {
      if(WCL1 > WCCR1){
         FR1 <- 1
      } else {
         FR1 <- (WCL1 - WCWP1)/(WCCR1 - WCWP1 + 0.000001)
      }
   }
  
  #----- to 2
  if((WCL2 > WCWET2) && (RICE <= 0)) {
    FR2 <- (WCST2 - WCL2)/(WCST2 - WCWET2 + 0.000001)
  } else {
    if(WCL2 > WCCR2){
      FR2 <- 1
    } else {
      FR2 <- (WCL2 - WCWP2)/(WCCR2 - WCWP2 + 0.000001)
    }
  }
  
  #----- to 3
  if((WCL3 > WCWET3) && (RICE <= 0)) {
    FR3 <- (WCST3 - WCL3)/(WCST3 - WCWET3 + 0.000001)
  } else {
    if(WCL3 > WCCR3){
      FR3 <- 1
    } else {
      FR3 <- (WCL3 - WCWP3)/(WCCR3 - WCWP3 + 0.000001)
    }
  }
  
   WSE1 <- AMIN1(1, AMAX1(0, FR1))
   WSE2 <- AMIN1(1, AMAX1(0, FR2))
   WSE3 <- AMIN1(1, AMAX1(0, FR3))
  
  #================
  j <- length(srFUFR@DINDEX) + 1
  srFUFR@DINDEX[j] <- DINDEXs
  
  srFUFR@WSE1[j]   <- WSE1
  srFUFR@WSE2[j]   <- WSE2
  srFUFR@WSE3[j]   <- WSE3
   
  #----------------
   return(srFUFR)   
}
#==================
# srFUFR <- SUBR_FUFR(DINDEXs,crop,soil,srSUBPET,SWBsv,srFUFR)
# ---------------------------------------------------------


# ---------------------------------------------------------
# Function SUBPET: 
#    *! SUBPET (Subroutine Evap. Trans. PenMan Daily)             *
#    *! Authors: ADOPTED FROM SASTRO+SVPL+SETPMN+SETPMD OF van Kraalingen    *
#    *! Date   : 7-March-1997                                                *
#    *! Version: 1.1                                                         *
#    *! Purpose: This subroutine calculates reference evapotranspiration     *
#    *!          in a manner similar to Penman (1948). To obtain crop evapo- *
#    *!          transpiration, multiplication with a Penman crop factor     *
#    *!          should be done. Calculations can be carried out for three   *
#    *!          types of surfaces: water, wet soil, and short grass         *
#    *!          (ISURF=1,2,3 resp.). When the input variable TMDI is set to *
#    *!          zero, a single calculation is done and an estimate is       *
#    *!          provided of temperature difference between the environment  *
#    *!          and the surface (DT). If the absolute value of DT is large  *
#    *!          an iterative Penman can be carried out which continues until*
#    *!          the new surface temperature differs by no more than TMDI    *
#    *!          from the old surface temperature. Two types of long-wave    *
#    *!          radiation calculations are available Swinbank and Brunt.    *
#    *!          The switch between the two is made by choosing the right    *
#    *!          values for ANGA and ANGB. If ANGA and ANGB are zero,        *
#    *!          Swinbank is used, if both are positive, Brunt is used and   *
#    *!          the ANGA and ANGB values are in the calculation of the      *
#    *!          cloud cover.                                                *
#    *! Refs.  : Kraalingen, D.W.G. van, W. Stol, 1997. Evapotranspiration   *
#    *!          modules for crop growth simulation. Quantitative Approaches *
#    *          in Systems Analysis No. 11. DLO Research Institute for      *
#    *!          Agrobiology and Soil Fertility (AB-DLO), The C.T. de Wit    *
#    *!          graduate school for Production Ecology (PE). Wageningen.    *
#    *!          The Netherlands.                                            *
#    *!                                                                      *
#    *! FORMAL PARAMETERS:  (I=input,O=output,C=control,IN=init,T=time)      *
#    *! name   type meaning (units)                                    class *
#    *! ----   ---- ---------------                                    ----- *
#    *! DOY     I4  Day number within year of simulation (d)              I  *
#    *! LAT     R4  Latitude of site (dec.degr.)                          I  *
#    *! RDD     R4  Daily short-wave radiation (J.m-2.d)                  I  *
#    *! LAI         Leaf Area Index                                       I  *
#    *! ALBEDO  R4  Reflection (=albedo) of surface (-)                   I  *
#    *! TPAV    R4  24 hour average temperature (degrees C)               I  *
#    *! TMAX                                                              I  *
#    *! TMIN                                                              I  *
#    *! VPA                                                               I  *
#    *! WIND    R4  Average wind speed (m.s-1)                            I  *
#    *! ETSWCH                                                            C  *
#    *! PTFAC                                                             I  *
#    *! COSTOM                                                            I  *
#    *! ---     --  ---                                                  --- *
#    *! ANGOT                                                             O  *
#    *! RDN                                                               O  *
#    *! DAYLP                                                             O  *
#    *! ETRD    R4  Radiation driven part of potential                    O  *
#    *!             evapotranspiration (mm.d-1)                              *
#    *! ETAE    R4  Dryness driven part of potential evapotranspiration   O  *
#    *!             (mm.d-1)                                                 *
#    *! ETD     R4  Potential evapotranspiration (mm.d-1)                 O  *
#    *! PTRANS      Potential transpiration                               O  *
#    *! PEVAP       Potential evaporation                                 o  *
#==================
# srSUBPET
SUBR_SUBPET <- function(DINDEXs, climate, control, cropsv, EDTSsv, soil,
                        SWBsv, tabFunction, weather, srSUBPET) #--------------------  Inputs, except srSUBPET                
#                   ANGOT,RDN,DAYLP,ETRD,ETAE,ETD,PTRANS,PEVAP) #-  Outputs: inside srSUBPET
{
  # PARAMETERS-------
  LHVAP   = 2454.E3 
  PSCH    = 0.067
  DEGTRAD = 0.017453292
  SIGMA   = 5.668E-8
  
  #---------- climate Data
  CO2    <- climate@CO2
  
  #---------- control Data
  ETSWCH <- control@ETSWCH
  
  #---------- cropsv Data
  LAI    <- cropsv@LAI[length(cropsv@LAI)]
  
  #---------- EDTSsv Data  
  TMAX   <- EDTSsv@TMAX[length(EDTSsv@TMAX)]
  TMIN   <- EDTSsv@TMIN[length(EDTSsv@TMIN)]
  TPAV   <- EDTSsv@TPAV[length(EDTSsv@TPAV)]
  VPA    <- EDTSsv@VPA[length(EDTSsv@VPA)]
  VPSMIN <- EDTSsv@VPSMIN[length(EDTSsv@VPSMIN)]
  WIND   <- EDTSsv@WIND[length(EDTSsv@WIND)]
  
  #---------- soil Data
  WCFC1  <- soil@WCFC1[length(soil@WCFC1)]
  WCST1  <- soil@WCST1[length(soil@WCST1)]
  
  #---------- SWBsv Data
  WCL1   <- SWBsv@WCL1[length(SWBsv@WCL1)]
  
  #---------- tabFunction Data
  COFST  <- tabFunction@COFST
  SOILAB <- tabFunction@SOILAB
  
  #---------- weather Data
  DOY   <- weather@DOY[weather@DINDEX == DINDEXs]
  LAT   <- weather@LAT                              #weather@LAT[weather@DINDEX == DINDEXs]
  RDD   <- weather@RDD[weather@DINDEX == DINDEXs]
  
  #================   
  COSTOM <- AFGEN(COFST, CO2)
  SALBDO <- AFGEN(SOILAB, WCFC1)*(1 - 0.5*WCL1 / WCST1)
  ALBEDO <- INSW(LAI - 0.02, SALBDO, 0.23 - (0.23 - SALBDO)*exp(-0.75*LAI))
  
  #---------- 
  PTFAC  <- INSW(TMIN - 13, 1.25, 0.4)
  
  DEC   <- -asin(sin(23.45 * DEGTRAD) * cos(2*pi*(DOY+10)/365))
  SINLD <- sin(DEGTRAD * LAT) * sin(DEC)
  COSLD <- cos(DEGTRAD * LAT) * cos(DEC)
  AOB   <- SINLD/COSLD
  
  if(AOB < -1) {
  # *     $    WRITE (*,'(2A)') ' WARNING from SASTRO: ',
  # *     $           'latitude above polar circle, daylength=0 hours'
       DAYL  <- 0
       ZZCOS <- 0
       ZZSIN <- 1}
  else if(AOB > 1) {
  # *     $    WRITE (*,'(2A)') ' WARNING from SASTRO: ',
  # *     $          'latitude within polar circle, daylength=24 hours'
            DAYL  <- 24
            ZZCOS <-  0
            ZZSIN <- -1}
        else {
            DAYL  <- 12*(1 + 2*asin(AOB)/pi)
            DAYLP <- 12.0*(1 + 2*asin((-sin(-4*DEGTRAD) + SINLD)/COSLD)/pi)
            ZZA   <- pi*(12 + DAYL)/24
            ZZCOS <- cos(ZZA)
            ZZSIN <- sin(ZZA)
             }
  
  # *!     Daily integral of sine of solar height (DSINB) with a
  # *!     correction for lower atmospheric transmission at lower solar
  # *!     elevations (DSINBE)
  
  DSINB  <- 2*3600 * (DAYL*0.5*SINLD - 12*COSLD*ZZCOS/pi)
  DSINBE <- 2*3600 * (DAYL*(0.5*SINLD + 0.2*SINLD**2 + 0.1*COSLD**2) - 
            (12.*COSLD*ZZCOS + 9.6*SINLD*COSLD*ZZCOS + 2.4*COSLD**2*ZZCOS*ZZSIN)/pi)
  
  # *!     Solar constant and daily extraterrestrial radiation
  SOLCON <- 1370*(1 + 0.033*cos(2*pi*DOY/365))
  ANGOT  <- SOLCON*DSINB
  DATMTR <- LIMIT(0, 1, RDD/ANGOT)
  RDLOI  <- SIGMA*(TPAV + 273.16)**4
  RDLO   <- 86400*RDLOI
  RDLII  <- DATMTR*(5.31E-13*(TPAV + 273.16)**6 - RDLOI)/0.7 + RDLOI
  RDLI   <- 86400*RDLII
  RDN    <- (1 - ALBEDO)*RDD + RDLI - RDLO
 
  VPSMAX <- 0.6108 * exp(17.27*TMAX/(TMAX + 237.3))
  
  VPS    <- (VPSMAX + VPSMIN)/2.
  
  VPSL   <- 238.102*17.32491*VPS/(TPAV + 238.102)**2
  VPD    <- AMAX1(0, VPS - VPA)
  FU2    <- 2.63*(1.0 + 0.54*WIND*COSTOM)
  EA     <- VPD*FU2
  ETRD   <- (RDN*(VPSL/(VPSL + PSCH)))/LHVAP
  
  if (ETSWCH <= 0) {
    ETAE <- (PSCH*EA)/(VPSL+PSCH)
  } else {
    ETAE <- PTFAC*ETRD} # *!     Priestley and Taylor reference evapotranspiration

  ETD    <- ETRD + ETAE                     #FJAV: Defined, Line 1476: ETD = ETRD+ETAE, but NOT-Used anymore in FST
  PTRANS <- ETRD*(1 - exp(-0.5*LAI)) + ETAE*(AMIN1(2.0, LAI))
  # *!    Soil evaporation with soil background
  PEVAP  <- exp(-0.5*LAI)*(ETRD + ETAE)
  
  #================
  j  <- length(srSUBPET@DINDEX) + 1
  
  srSUBPET@DINDEX[j] <- DINDEXs
  
  srSUBPET@ANGOT[j]  <- ANGOT
  srSUBPET@DAYLP[j]  <- DAYLP
  srSUBPET@PEVAP[j]  <- PEVAP
  srSUBPET@PTRANS[j] <- PTRANS
  
  #----------------
  return(srSUBPET)
}
#==================
#  srSUBPET <- SUBR_SUBPET(DINDEXs,climate,control,cropsv,EDTSsv,soil,SWBsv,tabFunction,weather,srSUBPET)
# ---------------------------------------------------------


# ---------------------------------------------------------
# SUBROUTINE SOIL(SAND,   BDC,WCFCC,WCWPC,WCSTC,WCAD,KSATC)
# IMPLICIT REAL(A-Z)
#==================
# srSOIL
SUBR_SOIL <- function(DINDEXs, soilD, srSOIL)
  {
   #---------- soilD Data
   SAND1 <- soilD@SAND1
   SAND2 <- soilD@SAND2
   SAND3 <- soilD@SAND3
   
   #===============
   BDC1   <- 1.1 + .0045 * SAND1
   BDC2   <- 1.1 + .0045 * SAND2
   BDC3   <- 1.1 + .0045 * SAND3
   
   WCSTC1 <- 1 - BDC1/2.65
   WCSTC2 <- 1 - BDC2/2.65
   WCSTC3 <- 1 - BDC3/2.65
   
   WCFCC1 <- ( 0.01875  + 0.00411 * (100 - SAND1)) * BDC1
   WCFCC2 <- ( 0.01875  + 0.00411 * (100 - SAND2)) * BDC2
   WCFCC3 <- ( 0.01875  + 0.00411 * (100 - SAND3)) * BDC3
   
   WCWPC1 <- (-0.001185 + 0.00218 * (100 - SAND1)) * BDC1
   WCWPC2 <- (-0.001185 + 0.00218 * (100 - SAND2)) * BDC2
   WCWPC3 <- (-0.001185 + 0.00218 * (100 - SAND3)) * BDC3
   
   WCAD1  <- AMAX1(0.04, -0.0178 + WCWPC1 * 0.6556)
   WCAD2  <- AMAX1(0.04, -0.0178 + WCWPC2 * 0.6556)
   WCAD3  <- AMAX1(0.04, -0.0178 + WCWPC3 * 0.6556)
   
   KSATC1 <- SAND1 * 3
   KSATC3 <- SAND3 * 3
      
   #===============
   j <- length(srSOIL@DINDEX) + 1
   srSOIL@DINDEX[j] <- DINDEXs
   
   srSOIL@BDC1[j]   <- BDC1
   srSOIL@BDC2[j]   <- BDC2
   srSOIL@BDC3[j]   <- BDC3
   
   srSOIL@WCSTC1[j] <- WCSTC1
   srSOIL@WCSTC2[j] <- WCSTC2
   srSOIL@WCSTC3[j] <- WCSTC3
   
   srSOIL@WCFCC1[j] <- WCFCC1
   srSOIL@WCFCC2[j] <- WCFCC2
   srSOIL@WCFCC3[j] <- WCFCC3
   
   srSOIL@WCWPC1[j] <- WCWPC1
   srSOIL@WCWPC2[j] <- WCWPC2
   srSOIL@WCWPC3[j] <- WCWPC3
   
   srSOIL@WCAD1[j]  <- WCAD1
   srSOIL@WCAD2[j]  <- WCAD2
   srSOIL@WCAD3[j]  <- WCAD3
   
   srSOIL@KSATC1[j] <- KSATC1
   srSOIL@KSATC3[j] <- KSATC3
   
   #---------------
   return(srSOIL)
}
#==================
# srSOIL <- SUBR_SOIL(DINDEXs,soilD,srSOIL)
# ---------------------------------------------------------


# ---------------------------------------------------------
#   *  SUBROUTINE SUBDD                                                    *
#   *  Purpose: This subroutine calculates the daily amount of heat units  *
#   *           for calculation of the phenological development rate and   *
#   *           early leaf area growth.                                    *
#   *                                                                      *
#   *  FORMAL PARAMETERS:(I =input,O =output,C =control,IN =init,T =time)  *
#   *  name   type meaning                                    units  class *
#   *  ----   ---- -------                                    -----  ----- *
#   *  TMAX   R4   Daily maximum temperature                    oC     I   *
#   *  TMIN   R4   Daily minimum temperature                    oC     I   *
#   *  TBD    R4   Base temperature for development             oC     I   *
#   *  TOD    R4   Optimum temperature for development          oC     I   *
#   *  TMD    R4   Maximum temperature for development          oC     I   *
#   *  HU     R4   Heat units                                   oC     O   *
#   *                                                                      *
#   *  FILE usage : none                                                   *
#   *----------------------------------------------------------------------*
#==================
# srSUBDD
SUBR_SUBDD <- function(DINDEXs, crop, EDTSsv, srSUBDD)
{
  #---------- crop Data
  TPMAXD <- crop@TPMAXD
  TPOPT  <- crop@TPOPT
  TVBD   <- crop@TVBD
  
  #---------- EDTSsv Data  
  TMAX   <- EDTSsv@TMAX[length(EDTSsv@TMAX)]
  TMIN   <- EDTSsv@TMIN[length(EDTSsv@TMIN)]
  
  #================  
  TM  <- (TMAX + TMIN) / 2
  TT  <- 0
  
  for (I in 1:24){
    TD  <- TM + 0.5*abs(TMAX - TMIN)*cos(0.2618*(I-14)) 
    if ((TD > TVBD) && (TD < TPMAXD)) {
      if (TD > TPOPT) TD <- TPOPT - (TD - TPOPT)*(TPOPT - TVBD) / (TPMAXD - TPOPT)
      TT <- TT + (TD - TVBD) / 24
    }
  }
  
  #================
  j <- length(srSUBDD@HU) + 1  
  srSUBDD@HU[j]     <- TT
  srSUBDD@DINDEX[j] <- DINDEXs
  
  #----------------
  return(srSUBDD)
}
#==================
# srSUBDD <- SUBR_SUBDD(DINDEXs,crop,EDTSsv,srSUBDD)
# ---------------------------------------------------------


# srGLA
# *----------------------------------------------------------------------*
# *  Purpose: This subroutine computes daily increase of leaf area index *
# *           (ha leaf/ ha ground/ d)                                    *
# * ---------------------------------------------------------------------*
#==================
SUBR_GLA <- function(DINDEXs, control, cropsv, GRsv, management, 
                     phenology, stress, srGLA)
{
  #---------- control Data
  DELT <- control@DELT
  LAII <- control@LAII[length(control@LAII)]
  
  #---------- cropsv Data
  LAI    <- cropsv@LAI[length(cropsv@LAI)]
  RGRL   <- cropsv@RGRL[length(cropsv@RGRL)]
  SLA    <- cropsv@SLA[length(cropsv@SLA)]
  
  #---------- GRsv Data
  RWLVG <- GRsv@RWLVG[length(GRsv@RWLVG)]
  
  #---------- management Data
  ESW  <- management@ESW[length(management@ESW)]
  ESWI <- management@ESWI[length(management@ESWI)]
  
  #---------- phenology Data
  DS    <- phenology@DS[length(phenology@DS)]
  HUVG <- phenology@HUVG[length(phenology@HUVG)]
  
  #---------- stress Data
  WSTRES <- stress@WSTRES[length(stress@WSTRES)]
  
  #================
  #*---- Growth during maturation stage:
    GLAI <- AMAX1(0, SLA*RWLVG)
  
  #*---- Growth during juvenile stage:
    if ((DS < 0.2) && (LAI < 0.75)) GLAI <- AMAX1(0, LAII*( exp(RGRL*HUVG))*WSTRES)
    if (RGRL <= 0) GLAI <- 0
  
  #*---- Growth at day of seedling emergence:
    if (ESW == 1) GLAI <- AMAX1(0, LAII/DELT)
  
  #*---- Growth before seedling emergence:
    if (ESWI == 0) GLAI <- 0
  
  #================
  j <- length(srGLA@DINDEX) + 1
  srGLA@DINDEX[j] <- DINDEXs
  
  srGLA@GLAI[j] <- GLAI
  
  #----------------
  return(srGLA)
}
#==================
# srGLA <- SUBR_GLA(DINDEXs,control,cropsv,GRsv,management,phenology,stress,srGLA)


# *----------------------------------------------------------------------*
# *FUNCTION WSRT                                                         *
# *Purpose: To decide whether root extension growth continues or ceases  *
# *         (value either 0 or 1)                                        *
# *----------------------------------------------------------------------*
# srWSRT
SUBR_WSRT <- function(DINDEXs, control, root, soil, soilD, SWBsv, srWSRT)
{
  #---------- control Data
  TKL3   <- control@TKL3[length(control@TKL3)]
  
  #---------- root Data
  ZRT <- root@ZRT[length(root@ZRT)]
  
  #---------- soil Data
  WCWP1  <- soil@WCWP1[length(soil@WCWP1)]
  WCWP2  <- soil@WCWP2[length(soil@WCWP2)]
  WCWP3  <- soil@WCWP3[length(soil@WCWP3)]
  
  #---------- soilD Data
  TKL1 <- soilD@TKL1
  TKL2 <- soilD@TKL2
  
  #---------- SWBsv Data
  WCL1 <- SWBsv@WCL1[length(SWBsv@WCL1)]
  WCL2 <- SWBsv@WCL2[length(SWBsv@WCL2)]
  WCL3 <- SWBsv@WCL3[length(SWBsv@WCL3)]
  
  #================
  WSERT <- 1
  
  if ((ZRT < TKL1) && (WCL1 < WCWP1)) WSERT <- 0
  if ((ZRT > TKL1) && (ZRT < (TKL1+TKL2)) && (WCL2 < WCWP2)) WSERT <- 0
  if ((ZRT > (TKL1 + TKL2)) && (ZRT < (TKL1+TKL2+TKL3)) && (WCL3 < WCWP3)) WSERT <- 0
  
  #================
  j <- length(srWSRT@DINDEX) + 1
  srWSRT@DINDEX[j] <- DINDEXs
  srWSRT@WSERT[j]  <- WSERT
  
  #----------------
  return(srWSRT)
}
#==================
# srWSRT <- SUBR_WSRT(DINDEXs,control,root,soil,soilD,SWBsv,srWSRT)