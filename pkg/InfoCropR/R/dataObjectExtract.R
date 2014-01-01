setGeneric(name=".dataObjectExtract", 
           def=function(object, TIME) 
             standardGeneric(".dataObjectExtract"))

#---------------------------------------------------------------------------
setMethod(f=".dataObjectExtract", signature(object="WeatherClass", TIME="numeric"),
          function(object, TIME){
            
            LAT  <- object@LAT # *** TEMPORAL ***************************           
            #LAT  <- object@LAT[TIME]
            
            YEAR <- object@YEAR[TIME]
            DOY  <- object@DOY[TIME]
            RDD  <- object@RDD[TIME]
            TMMN <- object@TMMN[TIME]
            TMMX <- object@TMMX[TIME]
            VP   <- object@VP[TIME]
            WN   <- object@WN[TIME]
            RAIN <- object@RAIN[TIME]
            
            name_list <- c(LAT=LAT,YEAR=YEAR,DOY=DOY,RDD=RDD,TMMN=TMMN,TMMX=TMMX,
                                 VP=VP,WN=WN,RAIN=RAIN)
            return(name_list)
          }
          )

# #---------------------------------------------------------------------------
setMethod(f=".dataObjectExtract", signature(object="SWBStateVarsClass", TIME="numeric"),
          function(object, TIME){
            
            AWF1  <- object@AWF1[TIME]
            AWF2  <- object@AWF2[TIME]
            AWF3  <- object@AWF3[TIME]
            
            DAPOND <- object@DAPOND[TIME]
            DRAIN  <- object@DRAIN[TIME]
            
            IRRIG0  <- object@IRRIG0[TIME]
            IRRIG1  <- object@IRRIG1[TIME]
            IRRIG2  <- object@IRRIG2[TIME]
            IRRIG3  <- object@IRRIG3[TIME]
            
            PNDEVP  <- object@PNDEVP[TIME]
            POND    <- object@POND[TIME]
            PONDTP  <- object@PONDTP[TIME]
            
            RNOFF  <- object@RNOFF[TIME]
            
            WCL1  <- object@WCL1[TIME]
            WCL2  <- object@WCL2[TIME]
            WCL3  <- object@WCL3[TIME]
            
            WL1RT  <- object@WL1RT[TIME]
            WL2RT  <- object@WL2RT[TIME]
            WL3RT  <- object@WL3RT[TIME]
            
            WL1    <- object@WL1[TIME]
            WL2    <- object@WL2[TIME]
            WL3    <- object@WL3[TIME]
            
            WL1T  <- object@WL1T[TIME]
            WL2T  <- object@WL2T[TIME]
            WL3T  <- object@WL3T[TIME]
            
            WLFL1  <- object@WLFL1[TIME]
            WLFL2  <- object@WLFL2[TIME]
            WLFL3  <- object@WLFL3[TIME]
            WLFL4  <- object@WLFL4[TIME]
            WLFL5  <- object@WLFL5[TIME]
            WLFL6  <- object@WLFL6[TIME]
            WLFL7  <- object@WLFL7[TIME]
            WLFL8  <- object@WLFL8[TIME]
            
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

# #---------------------------------------------------------------------------
setMethod(f=".dataObjectExtract", signature(object="SWBStateVarsClass", TIME="character"),
          function(object, TIME){
            
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