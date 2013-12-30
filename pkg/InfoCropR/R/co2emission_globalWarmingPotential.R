# co2Emission 
co2emission_globalWarmingPotential <- function(carbonMine, management, 
                                               methane, nitrogenEmi, co2Emission)
{
  #---------- carbonMine Data
  CDOC1 <- carbonMine@CDOC1[length(carbonMine@CDOC1)]
  CDOC2 <- carbonMine@CDOC2[length(carbonMine@CDOC2)]
  CDOC3 <- carbonMine@CDOC3[length(carbonMine@CDOC3)]
  
  #---------- co2Emission Data
  CO2BAL <- co2Emission@CO2BAL[length(co2Emission@CO2BAL)]
  
  #---------- management Data
  TCOEFF <- management@TCOEFF
  
  #---------------- methane Data
  CH4PR1 <- methane@CH4PR1[length(methane@CH4PR1)]
  CH4PR2 <- methane@CH4PR2[length(methane@CH4PR2)]
  CH4PR3 <- methane@CH4PR3[length(methane@CH4PR3)]
  
  CHEMIT <- methane@CHEMIT[length(methane@CHEMIT)]
  
  #---------------- nitrogenEmi Data
  N2OTOT <- nitrogenEmi@N2OTOT[length(nitrogenEmi@N2OTOT)]
  
  #================
  #***  CO2 Emission
  CO2L1 <- CDOC1 - CH4PR1
  CO2L2 <- CDOC2 - CH4PR2
  CO2L3 <- CDOC3 - CH4PR3
  
  CO2TOT <- CO2L1 + CO2L2 + CO2L3
  CO2SOL <- CO2BAL                     #Line 896: CO2SOL = INTGRL(ZERO, CO2BAL)
  CO2EMS <- CO2SOL/TCOEFF                                  #== CO2 emission
  CO2BAL <- CO2TOT - CO2EMS
  
  #** Global warming potential
  GWP    <- CO2EMS + CHEMIT*21 + N2OTOT*310
  GLOBWP <- GWP                        #Line 902: GLOBWP = INTGRL(ZERO, GWP)
  
  #================
  j <- length(co2Emission@CO2BAL) + 1
  
  co2Emission@CO2BAL[j] <- CO2BAL
  
  co2Emission@CO2L1[j]  <- CO2L1
  co2Emission@CO2L2[j]  <- CO2L2
  co2Emission@CO2L3[j]  <- CO2L3
  
  co2Emission@GWP[j]    <- GWP
  
  #----------------
  return(co2Emission)
}
#==================
# co2Emission <- co2emission_globalWarmingPotential(DINDEXs, carbonMine, management, methane, nitrogenEmi, co2Emission)