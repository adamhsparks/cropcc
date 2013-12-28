# methane 
methaneEmission <- function(carbonMine, crop, GRsv, SWBsv,
                            tabFunction, methane)
{
  #----------- carbonMine Data
  CDOC1 <- carbonMine@CDOC1[length(carbonMine@CDOC1)]
  CDOC2 <- carbonMine@CDOC2[length(carbonMine@CDOC2)]
  CDOC3 <- carbonMine@CDOC3[length(carbonMine@CDOC3)]
  
  #----------- crop Data
  RICE <- crop@RICE
  
  #----------- GRsv Data
  TDM <- GRsv@TDM[length(GRsv@TDM)]
  
  #----------- methane Data
  CHSOIL <- methane@CHSOIL[length(methane@CHSOIL)]
  
  #----------- SWBsv Data
  DAPOND <- SWBsv@DAPOND[length(SWBsv@DAPOND)]
  POND   <- SWBsv@POND[length(SWBsv@POND)]
  
  #----------- tabFunction Data
  EBULTN <- tabFunction@EBULTN
  EHFAC  <- tabFunction@EHFAC
  MTABEH <- tabFunction@MTABEH
  
  #================
  #---------------- soil Redox potential
  EH   <- AFGEN(MTABEH, DAPOND)
  EHCF <- INSW(RICE - 0.8, 0, AFGEN(EHFAC, EH))
  
  #---------------- Production
  CH4PR1 <- 0.27 * 0.55 * CDOC1 * EHCF
  CH4PR2 <- 0.27 * 0.55 * CDOC2 * EHCF
  CH4PR3 <- 0.27 * 0.55 * CDOC3 * EHCF
  
  CH4TOT <- CH4PR1 + CH4PR2 + CH4PR3
  
  CHVASC <- AMAX1(0, CHSOIL * LIMIT(0, 1, (TDM / 15000) + 2))           #== vascular methane emission from soil
  CHEBUL <- AMAX1(0, (CHSOIL - CHVASC)* AFGEN(EBULTN, POND))            #== ebullition
  CHSOIL <- CH4TOT - CHVASC - CHEBUL # Line 883: CHSOIL = INTGRL(ZERO, CH4BAL)
                                     # Line 882: CH4BAL = CH4TOT - CHVASC - CHEBUL
  CHEMIT <- CHVASC + CHEBUL
  CH4SUM <- CHEMIT                   # Line 885: CH4SUM = INTGRL(ZERO, CHEMIT)
  
  #================
  j <- length(methane@CH4PR1) + 1
  
  methane@CH4PR1[j] <- CH4PR1
  methane@CH4PR2[j] <- CH4PR2
  methane@CH4PR3[j] <- CH4PR3
  
  methane@CH4TOT[j] <- CH4TOT
  methane@CHEMIT[j] <- CHEMIT
  methane@CHSOIL[j] <- CHSOIL
  
  #----------------
  return(methane)
}