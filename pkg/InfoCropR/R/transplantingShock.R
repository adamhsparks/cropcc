# cropsv
transplantingShock <- function(crop, management, phenology, cropsv)
{
  #---------- crop Data
  NPLSB <- crop@NPLSB
  SHCKD <- crop@SHCKD
  
  #---------- management Data
  DAS    <- management@DAS[length(management@DAS)]
  NEWAGE <- management@NEWAGE[length(management@NEWAGE)]
  NH     <- management@NH[length(management@NH)]
  NPLH   <- management@NPLH[length(management@NPLH)]
  SEEDAG <- management@SEEDAG[length(management@SEEDAG)]
  
  #---------- phenology Data
  HUVG <- phenology@HUVG[length(phenology@HUVG)]
  
  #================
  PLTR   <- INSW( REAAND(DAS - NEWAGE + 0.5, NEWAGE - DAS + 0.5) - 0.9, 1, NPLH*NH/NPLSB)
  SHCKPD <- INSW(DAS - SEEDAG, 1, INSW(DAS - NEWAGE, 1, 0) )
  
  HUVGSK <- HUVG*SHCKPD
  HUSHOK <- HUVGSK                     #Line 135: HUSHOK = INTGRL(ZERO,HUVGSK)
  
  HUDLAY <- HUSHOK*SHCKD
  HUSUM  <- HUVG                       #Line 138: HUSUM = INTGRL(ZERO,HUVG)
  
  TPSHOK <- INSW(DAS - SEEDAG, 1, INSW(DAS - NEWAGE, 1, 
                                       INSW(HUSHOK + HUDLAY - HUSUM - 0.5, 1, 0)))
  
  
  #================
  j <- length(cropsv@PLTR) + 1
  cropsv@PLTR[j]   <- PLTR
  cropsv@TPSHOK[j] <- TPSHOK
  
  #----------------
  return(cropsv)
}
#==================
# cropsv <- transplantingShock3(crop,management,phenology,cropsv)