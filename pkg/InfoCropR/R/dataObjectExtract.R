setGeneric(name=".dataObjectExtract", 
           def=function(object, DINDEXs) 
             standardGeneric(".dataObjectExtract"))

#---------------------------------------------------------------------------
setMethod(f=".dataObjectExtract", signature(object="WeatherClass", DINDEXs="numeric"),
          function(object, DINDEXs){
            
            LAT  <- object@LAT # *** TEMPORAL ***************************           
            #LAT  <- object@LAT[object@DINDEX == DINDEXs]
            
            YEAR <- object@YEAR[object@DINDEX == DINDEXs]
            DOY  <- object@DOY[object@DINDEX == DINDEXs]
            RDD  <- object@RDD[object@DINDEX == DINDEXs]
            TMMN <- object@TMMN[object@DINDEX == DINDEXs]
            TMMX <- object@TMMX[object@DINDEX == DINDEXs]
            VP   <- object@VP[object@DINDEX == DINDEXs]
            WN   <- object@WN[object@DINDEX == DINDEXs]
            RAIN <- object@RAIN[object@DINDEX == DINDEXs]
            
            name_list <- c(LAT=LAT,YEAR=YEAR,DOY=DOY,RDD=RDD,TMMN=TMMN,TMMX=TMMX,
                                 VP=VP,WN=WN,RAIN=RAIN)
            return(name_list)
          }
          )
# weatherList <- .dataObjectExtract(weather,DINDEXs)

# #---------------------------------------------------------------------------
# setMethod(f=".dataObjectExtract", signature(object="SoilPropertiesClass", DINDEXs="numeric"),
#           function(object, DINDEXs){
#             
#             BDC1   <- object@BDC1[object@DINDEX == DINDEXs]
#             BDC2   <- object@BDC2[object@DINDEX == DINDEXs]
#             BDC3   <- object@BDC3[object@DINDEX == DINDEXs]
#             
#             KSATC1 <- object@KSATC1[object@DINDEX == DINDEXs]
#             KSATC2 <- object@KSATC2[object@DINDEX == DINDEXs]
#             KSATC3 <- object@KSATC3[object@DINDEX == DINDEXs]
#             
#             WCAD1  <- object@WCAD1[object@DINDEX == DINDEXs]
#             WCAD2  <- object@WCAD2[object@DINDEX == DINDEXs]
#             WCAD3  <- object@WCAD3[object@DINDEX == DINDEXs]
#             
#             WCFCC1 <- object@WCFCC1[object@DINDEX == DINDEXs]
#             WCFCC2 <- object@WCFCC2[object@DINDEX == DINDEXs]
#             WCFCC3 <- object@WCFCC3[object@DINDEX == DINDEXs]
#             
#             WCSTC1 <- object@WCSTC1[object@DINDEX == DINDEXs]
#             WCSTC2 <- object@WCSTC2[object@DINDEX == DINDEXs]
#             WCSTC3 <- object@WCSTC3[object@DINDEX == DINDEXs]
#             
#             WCWPC1 <- object@WCWPC1[object@DINDEX == DINDEXs]
#             WCWPC2 <- object@WCWPC2[object@DINDEX == DINDEXs]
#             WCWPC3 <- object@WCWPC3[object@DINDEX == DINDEXs]
#             
#             name_list <- c(BDC1=BDC1, BDC2=BDC2, BDC3=BDC3,
#                            KSATC1=KSATC1, KSATC2=KSATC2, KSATC3=KSATC3,
#                            WCAD1=WCAD1, WCAD2=WCAD2, WCAD3=WCAD3,
#                            WCFCC1=WCFCC1, WCFCC2=WCFCC2, WCFCC3=WCFCC3,
#                            WCSTC1=WCSTC1, wCSTC2=WCSTC2, WCSTC3=WCSTC3,
#                            WCWPC1=WCWPC1, WCWPC2=WCWPC2, WCWPC3=WCWPC3)
#             return(name_list)
#           })
# # soilpropList <- .dataObjectExtract(srSOIL,DINDEXs)

# #---------------------------------------------------------------------------
# setMethod(f=".dataObjectExtract", signature(object="SubPETClass", DINDEXs="numeric"),
#           function(object, DINDEXs){
#             
#             ANGOT  <- object@ANGOT[object@DINDEX == DINDEXs]
#             DAYLP  <- object@DAYLP[object@DINDEX == DINDEXs]
#             ETAE   <- object@ETAE[object@DINDEX == DINDEXs]
#             ETD    <- object@ETD[object@DINDEX == DINDEXs]
#             ETRD   <- object@ETRD[object@DINDEX == DINDEXs]
#             PEVAP  <- object@PEVAP[object@DINDEX == DINDEXs]
#             PTRANS <- object@PTRANS[object@DINDEX == DINDEXs]
#             RDN    <- object@RDN[object@DINDEX == DINDEXs]
#             
#             name_list <- c(ANGOT=ANGOT,DAYLP=DAYLP,ETAE=ETAE,ETD=ETD,
#                              ETRD=ETRD,PEVAP=PEVAP,PTRANS=PTRANS,RDN=RDN)
#             return(name_list)
#           }
# )
# # SUBPETList <- .dataObjectExtract(SUBPET,DINDEXs)

# #---------------------------------------------------------------------------
setMethod(f=".dataObjectExtract", signature(object="SWBStateVarsClass", DINDEXs="numeric"),
          function(object, DINDEXs){
            
            AWF1  <- object@AWF1[object@DINDEX == DINDEXs]
            AWF2  <- object@AWF2[object@DINDEX == DINDEXs]
            AWF3  <- object@AWF3[object@DINDEX == DINDEXs]
            
            DAPOND <- object@DAPOND[object@DINDEX == DINDEXs]
            DRAIN  <- object@DRAIN[object@DINDEX == DINDEXs]
            
            IRRIG0  <- object@IRRIG0[object@DINDEX == DINDEXs]
            IRRIG1  <- object@IRRIG1[object@DINDEX == DINDEXs]
            IRRIG2  <- object@IRRIG2[object@DINDEX == DINDEXs]
            IRRIG3  <- object@IRRIG3[object@DINDEX == DINDEXs]
            
            PNDEVP  <- object@PNDEVP[object@DINDEX == DINDEXs]
            POND    <- object@POND[object@DINDEX == DINDEXs]
            PONDTP  <- object@PONDTP[object@DINDEX == DINDEXs]
            
            RNOFF  <- object@RNOFF[object@DINDEX == DINDEXs]
            
            WCL1  <- object@WCL1[object@DINDEX == DINDEXs]
            WCL2  <- object@WCL2[object@DINDEX == DINDEXs]
            WCL3  <- object@WCL3[object@DINDEX == DINDEXs]
            
            WL1RT  <- object@WL1RT[object@DINDEX == DINDEXs]
            WL2RT  <- object@WL2RT[object@DINDEX == DINDEXs]
            WL3RT  <- object@WL3RT[object@DINDEX == DINDEXs]
            
            WL1    <- object@WL1[object@DINDEX == DINDEXs]
            WL2    <- object@WL2[object@DINDEX == DINDEXs]
            WL3    <- object@WL3[object@DINDEX == DINDEXs]
            
            WL1T  <- object@WL1T[object@DINDEX == DINDEXs]
            WL2T  <- object@WL2T[object@DINDEX == DINDEXs]
            WL3T  <- object@WL3T[object@DINDEX == DINDEXs]
            
            WLFL1  <- object@WLFL1[object@DINDEX == DINDEXs]
            WLFL2  <- object@WLFL2[object@DINDEX == DINDEXs]
            WLFL3  <- object@WLFL3[object@DINDEX == DINDEXs]
            WLFL4  <- object@WLFL4[object@DINDEX == DINDEXs]
            WLFL5  <- object@WLFL5[object@DINDEX == DINDEXs]
            WLFL6  <- object@WLFL6[object@DINDEX == DINDEXs]
            WLFL7  <- object@WLFL7[object@DINDEX == DINDEXs]
            WLFL8  <- object@WLFL8[object@DINDEX == DINDEXs]
            
            name_list <- c(AWF1=AWF1, AWF2=AWF2, AWF3=AWF3,
                           DAPOND=DAPOND, DRAIN=DRAIN, IRRIG0=IRRIG0,
                           IRRIG1=IRRIG1, IRRIG2=IRRIG2, IRRIG3=IRRIG3,
                           PNDEVP=PNDEVP, POND=POND, PONDTP=PONDTP,
                           RNOFF=RNOFF,
                           WCL1=WCL1, WCL2=WCL2, WCL3=WCL3,
                           WL1RT=WL1RT, WL2RT=WL2RT, WL3RT=WL3RT, 
                           WL1=WL1, WL2=WL2, WL3=WL3,
                           WL1T=WL1T, WL2T=WL2T, WL3T=WL3T,
                           WLFL1=WLFL1, WLFL2=WLFL2, WLFL3=WLFL3,
                           WLFL4=WLFL4, WLFL5=WLFL5, WLFL6=WLFL6,
                           WLFL7=WLFL7, WLFL8=WLFL8)
            return(name_list)
          }
)
# SWBsvList <- .dataObjectExtract(SWBsv,DINDEXs)

# #---------------------------------------------------------------------------
setMethod(f=".dataObjectExtract", signature(object="SWBStateVarsClass", DINDEXs="character"),
          function(object, DINDEXs){
            
            AWF1  <- object@AWF1[length(object@AWF1)]
            AWF2  <- object@AWF2[length(object@AWF2)]
            AWF3  <- object@AWF3[length(object@AWF3)]
            
            DAPOND <- object@DAPOND[length(object@DAPOND)]
            DRAIN  <- object@DRAIN[length(object@DRAIN)]
            
            IRRIG0  <- object@IRRIG0[length(object@IRRIG0)]
            IRRIG1  <- object@IRRIG1[length(object@IRRIG1)]
            IRRIG2  <- object@IRRIG2[length(object@IRRIG2)]
            IRRIG3  <- object@IRRIG3[length(object@IRRIG3)]
            
            PNDEVP  <- object@PNDEVP[length(object@PNDEVP)]
            POND    <- object@POND[length(object@POND)]
            PONDTP  <- object@PONDTP[length(object@PONDTP)]
            
            RNOFF  <- object@RNOFF[length(object@RNOFF)]
            
            WCL1  <- object@WCL1[length(object@WCL1)]
            WCL2  <- object@WCL2[length(object@WCL2)]
            WCL3  <- object@WCL3[length(object@WCL3)]
            
            WL1RT  <- object@WL1RT[length(object@WL1RT)]
            WL2RT  <- object@WL2RT[length(object@WL2RT)]
            WL3RT  <- object@WL3RT[length(object@WL3RT)]
            
            WL1  <- object@WL1[length(object@WL1)]
            WL2  <- object@WL2[length(object@WL2)]
            WL3  <- object@WL3[length(object@WL3)]
            
            WL1T  <- object@WL1T[length(object@WL1T)]
            WL2T  <- object@WL2T[length(object@WL2T)]
            WL3T  <- object@WL3T[length(object@WL3T)]
            
            WLFL1  <- object@WLFL1[length(object@WLFL1)]
            WLFL2  <- object@WLFL2[length(object@WLFL2)]
            WLFL3  <- object@WLFL3[length(object@WLFL3)]
            WLFL4  <- object@WLFL4[length(object@WLFL4)]
            WLFL5  <- object@WLFL5[length(object@WLFL5)]
            WLFL6  <- object@WLFL6[length(object@WLFL6)]
            WLFL7  <- object@WLFL7[length(object@WLFL7)]
            WLFL8  <- object@WLFL8[length(object@WLFL8)]
            
            name_list <- c(AWF1=AWF1, AWF2=AWF2, AWF3=AWF3,
                           DAPOND=DAPOND, DRAIN=DRAIN, IRRIG0=IRRIG0,
                           IRRIG1=IRRIG1, IRRIG2=IRRIG2, IRRIG3=IRRIG3,
                           PNDEVP=PNDEVP, POND=POND, PONDTP=PONDTP,
                           RNOFF=RNOFF,
                           WCL1=WCL1, WCL2=WCL2, WCL3=WCL3,
                           WL1RT=WL1RT, WL2RT=WL2RT, WL3RT=WL3RT, 
                           WL1=WL1, WL2=WL2, WL3=WL3,
                           WL1T=WL1T, WL2T=WL2T, WL3T=WL3T,
                           WLFL1=WLFL1, WLFL2=WLFL2, WLFL3=WLFL3,
                           WLFL4=WLFL4, WLFL5=WLFL5, WLFL6=WLFL6,
                           WLFL7=WLFL7, WLFL8=WLFL8)
            return(name_list)
          }
)
# SWBsvList <- .dataObjectExtract(SWBsv,"last")