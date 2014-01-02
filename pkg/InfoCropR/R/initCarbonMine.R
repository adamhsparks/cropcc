initCarbonMine <- function(soil, management, carbonMine)
{
  
  BDM1   <- soil@BDM1
  BDM2   <- soil@BDM2
  BDM3   <- soil@BDM3
  
  TKL1   <- soil@TKL1
  TKL2   <- soil@TKL2
  TKL3  <- soil@TKL3
    
  SOC1   <- soil@SOC1
  SOC2   <- soil@SOC2
  SOC3   <- soil@SOC3
  
  PUDLE  <- management@PUDLE[length(management@PUDLE)]
    
  SOC1KG <- SOC1*TKL1/150*22000 * INSW(PUDLE - 0.98, BDM1/1.56, 1)
  SOC2KG <- SOC2*TKL2/150*22000 * INSW(PUDLE - 0.98, BDM2/1.56, 1)
  SOC3KG <- SOC3*TKL3/150*22000 * INSW(PUDLE - 0.98, BDM3/1.56, 1)

  carbonMine@SOCNT1[1] <- SOC1KG
  carbonMine@SOCNT2[1] <- SOC2KG
  carbonMine@SOCNT3[1] <- SOC3KG
  
  return(carbonMine)
  
}