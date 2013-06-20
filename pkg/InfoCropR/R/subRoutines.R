# ---------------------------------------------------------
# Function FUFR: To compute factors accounting for water stress effect on 
#               water uptake.
#//////////////////////////////////////////////////////////////
#CAMBIOS: PUEDE RECIBIR VECTORES, Y DEVOLVER UN VECTOR...
#         FUFR(RICE,PTRANS,WCL[i],CROPFC,WCFC[i],CROPGR,WCWP[i],WCST[i],WSE[i])
#//////////////////////////////////////////////////////////////
FUFR <- function(RICE,PTRANS,WCL,CROPFC,WCFC,CROPGR,WCWP,WCST)
{
   P <- AMIN1(0.95, AMAX1(0.1, CROPGR/(CROPGR + PTRANS)))
   WCCR <- WCWP + (1 - P) * (WCFC - WCWP)
   WCWET <- CROPFC * WCST
   if((WCL > WCWET) & (RICE > 0)) FR <- 1
   if((WCL > WCWET) & (RICE <= 0)) {
      FR <- (WCST - WCL)/(WCST - WCWET + 0.000001)
   } else {
      if(WCL > WCCR){
         FR <- 1
      } else {
         FR <- (WCL - WCWP)/(WCCR - WCWP + 0.000001)
      }
   }
   WSE <- AMIN1(1, AMAX1(0, FR))
   
   return(WSE)   
}
# WSE <- FUFR(RICE,PTRANS,WCL,CROPFC,WCFC,CROPGR,WCWP,WCST)
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
SUBR_SUBPET <- function(DINDEXs,climate,control,cropsv,soil,SWBsv,tabFunction,weather, SUBPET) #--------------------  Inputs                
#                   ANGOT,RDN,DAYLP,ETRD,ETAE,ETD,PTRANS,PEVAP) #-  Outputs, inside SUBPET
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
  
  #---------- soil Data
  WCFC1  <- soil@WCFC1[length(soil@WCFC1)]
  WCST1  <- soil@WCST1[length(soil@WCST1)]
  
  #---------- SWBsv Data
  WCL1   <- SWBsv@WCL1[length(SWBsv@WCL1)]
  
  #---------- tabFunction Data
  COFST  <- tabFunction@COFST
  CTMAXP <- tabFunction@CTMAXP
  CTMINP <- tabFunction@CTMINP
  SOILAB <- tabFunction@SOILAB
  
  #---------- weather Data
  DOY   <- weather@DOY[weather@DINDEX == DINDEXs]
  LAT   <- weather@LAT                              #weather@LAT[weather@DINDEX == DINDEXs]
  RDD   <- weather@RDD[weather@DINDEX == DINDEXs]
  TMMN  <- weather@TMMN[weather@DINDEX == DINDEXs]
  TMMX  <- weather@TMMX[weather@DINDEX == DINDEXs]
  VP    <- weather@VP[weather@DINDEX == DINDEXs]
  WN    <- weather@WN[weather@DINDEX == DINDEXs]
  
  #----------
  CCTMIN <- AFGEN(CTMINP, DOY)
  CCTMAX <- AFGEN(CTMAXP, DOY)
  
  TMIN   <- TMMN + CCTMIN
  TMAX   <- TMMX + CCTMAX
  
  WIND   <- INSW(WN - 0.1, 1.5 + REAAND(DOY - 120, 270 - DOY)*1.5, WN)   
  COSTOM <- AFGEN(COFST, CO2)
  SALBDO <- AFGEN(SOILAB, WCFC1)*(1 - 0.5*WCL1 / WCST1)
  ALBEDO <- INSW(LAI - 0.02, SALBDO, 0.23 - (0.23 - SALBDO)*exp(-0.75*LAI))
  
  #---------- 
  TPAV   <- 0.5*(TMAX + TMIN)
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
  VPSMIN <- 0.6108 * exp(17.27*TMIN/(TMIN + 237.3))
  
  VPS    <- (VPSMAX + VPSMIN)/2.
  VPA    <- AMIN1(VPSMIN, INSW(VP - 0.2, VPSMIN, VP))
  
  VPSL   <- 238.102*17.32491*VPS/(TPAV + 238.102)**2
  VPD    <- AMAX1(0, VPS - VPA)
  FU2    <- 2.63*(1.0 + 0.54*WIND*COSTOM)
  EA     <- VPD*FU2
  ETRD   <- (RDN*(VPSL/(VPSL + PSCH)))/LHVAP
  
  if (ETSWCH <= 0) {
    ETAE <- (PSCH*EA)/(VPSL+PSCH)
  } else {
    ETAE <- PTFAC*ETRD} # *!     Priestley and Taylor reference evapotranspiration

  ETD    <- ETRD + ETAE
  PTRANS <- ETRD*(1 - exp(-0.5*LAI)) + ETAE*(AMIN1(2.0, LAI))
  # *!    Soil evaporation with soil background
  PEVAP  <- exp(-0.5*LAI)*(ETRD + ETAE)
  
  #----------
  j  <- length(SUBPET@DINDEX) + 1
  
  SUBPET@DINDEX[j] <- DINDEXs
  
  SUBPET@ANGOT[j]  <- ANGOT
  SUBPET@DAYLP[j]  <- DAYLP
  SUBPET@ETAE[j]   <- ETAE
  SUBPET@ETD[j]    <- ETD
  SUBPET@ETRD[j]   <- ETRD
  SUBPET@PEVAP[j]  <- PEVAP
  SUBPET@PTRANS[j] <- PTRANS
  SUBPET@RDN[j]    <- RDN
  
  return(SUBPET)
}
#  SUBPET <- SUBR_SUBPET(DINDEX,climate,control,cropsv,soil,SWBsv,tabFunction,weather, SUBPET)
# ---------------------------------------------------------


# ---------------------------------------------------------
# SUBROUTINE SOIL(SAND,   BDC,WCFCC,WCWPC,WCSTC,WCAD,KSATC)
# IMPLICIT REAL(A-Z)

# RETURN
# END
SUBR_SOIL <- function(soil, soilprop, DINDEXs){
  #----------
  j <- length(soil@DINDEX)
  SAND1 <- soil@SAND1[j]
  SAND2 <- soil@SAND2[j]
  SAND3 <- soil@SAND3[j]
  #----------
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
   KSATC2 <- SAND2 * 3
   KSATC3 <- SAND3 * 3

   j      <- length(soilprop@DINDEX) + 1
   soilprop@DINDEX[j] <- DINDEXs
   
   soilprop@BDC1[j]   <- BDC1
   soilprop@BDC2[j]   <- BDC2
   soilprop@BDC3[j]   <- BDC3
   
   soilprop@WCSTC1[j] <- WCSTC1
   soilprop@WCSTC2[j] <- WCSTC2
   soilprop@WCSTC3[j] <- WCSTC3
   
   soilprop@WCFCC1[j] <- WCFCC1
   soilprop@WCFCC2[j] <- WCFCC2
   soilprop@WCFCC3[j] <- WCFCC3
   
   soilprop@WCWPC1[j] <- WCWPC1
   soilprop@WCWPC2[j] <- WCWPC2
   soilprop@WCWPC3[j] <- WCWPC3
   
   soilprop@WCAD1[j]  <- WCAD1
   soilprop@WCAD2[j]  <- WCAD2
   soilprop@WCAD3[j]  <- WCAD3
   
   soilprop@KSATC1[j] <- KSATC1
   soilprop@KSATC2[j] <- KSATC2
   soilprop@KSATC3[j] <- KSATC3
   
   return(soilprop)
}
# soilprop <- SUBR_SOIL(soil, soilprop, DINDEXs)
# ---------------------------------------------------------