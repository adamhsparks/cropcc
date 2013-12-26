# soil
puddling <- function(management, soilD, tabFunction, soil)
{
  #---------- management Data
  DAS    <- management@DAS[length(management@DAS)]
  NEWAGE <- management@NEWAGE[length(management@NEWAGE)]
  PUDLE  <- management@PUDLE[length(management@PUDLE)]
  SEEDAG <- management@SEEDAG[length(management@SEEDAG)]
  
  #---------- soilD Data
  SAND2 <- soilD@SAND2
  
  #---------- tabFunction Data
  PDCOEF <- tabFunction@PDCOEF
  
  #================
  DAPUDL <- INSW(DAS - SEEDAG, 0, AMAX1(0, DAS + 1 - NEWAGE))                 #== days elapsed since puddling
  
  PDCF1  <- INSW(PUDLE - 0.98, 1, INSW(DAPUDL - 0.1, 1, 
                             LIMIT(1, 1.1, 1.1 - 0.002*DAPUDL)))
  PDCF2  <- INSW(PUDLE - 0.98, 1, INSW(DAPUDL - 0.1, 1, 
                             LIMIT(0, 1, AFGEN(PDCOEF, SAND2)+ INSW(DAPUDL-40, 0, 0.005*(DAPUDL-39)))))
  PDCF3  <- INSW(PUDLE - 0.98, 1, INSW(DAPUDL - 0.1, 1, 
                             LIMIT(0, 1, 0.9 + 0.002*DAPUDL)))
  
  #================
  j <- length(soil@PDCF1) + 1
  
  soil@PDCF1[j]  <- PDCF1
  soil@PDCF2[j]  <- PDCF2
  soil@PDCF3[j]  <- PDCF3
  
  #----------------
  return(soil)
}
#==================
# soil <- puddling2(management,soilD,tabFunction,soil)