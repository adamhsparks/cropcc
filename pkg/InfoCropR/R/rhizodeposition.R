rhizodeposition <- function(GRsv, phenology, root)
{
#---------- Root exudates: LINEAR AT ABOUT 0.6 MG C /(G ROOT)/D UPTO FLOWERING
#                          AFTER WHICH 1.6 MG C /(G ROOT)/D
#---------- Root death: constant 2% of existing root dry weight in each soil
#                       layer per day
  
  #---------- GRsv Data
  WRT <- GRsv@WRT[length(GRsv@WRT)]
  
  #---------- phenology Data
  DS <- phenology@DS[length(phenology@DS)]
  
  #================
  RTEXUD <- INSW(DS - 1, WRT*0.0006, WRT*0.0016)
  RTDETH <- WRT*0.02
  
  #================
  j <- length(root@RTDETH) + 1
    
  root@RTDETH[j] <- RTDETH
  root@RTEXUD[j] <- RTEXUD
  
  #----------------
  return(root)
}