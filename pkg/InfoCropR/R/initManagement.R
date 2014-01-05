initManagement <- function(management)
{
  
  SWCPOT <- management@SWCPOT
  SWCWAT <- management@SWCWAT
  SWCNIT <- management@SWCNIT
  
  SWXWAT <- INSW(SWCPOT - 1, INSW(SWCWAT - 1, 0, 1), 1)
  SWXNIT <- INSW(SWCPOT - 1, INSW(SWCNIT - 1, 0, 1), 1)
  
  management@SWXWAT <- SWXWAT
  management@SWXNIT <- SWXNIT
  
  return(management)
  
}