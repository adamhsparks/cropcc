#control
setClass(Class="ControlClass",
         
         representation = representation(
 
           DELT   = "numeric",
           ETSWCH = "numeric",
           IRRSEN = "numeric",
           SWCPOT = "numeric",
           SWXWAT = "numeric",
           
           WCLI1  = "numeric",
           WCLI2  = "numeric",
           WCLI3  = "numeric",
           
           ZERO   = "numeric"
         ),
         
         prototype = prototype( 
 
           DELT   = 1,
           ETSWCH = 0,
           IRRSEN = 1,
           SWCPOT = 0, #Line 1072:  PARAM SWCPOT = 0;     Line 1236: PARAM SWCPOT = 1
           SWXWAT = 0, #Line 956:   SWXWAT = INSW(SWCPOT-1.,INSW(SWCWAT-1.,0.,1.),1.)
           
           WCLI1  = 0.216, #Line 51:   WCLI1= WCFCM1* 0.9 
           WCLI2  = 0.192, #Line 52:   WCLI2= WCFCM2* 0.8 
           WCLI3  = 0.18,  #Line 53:   WCLI3= WCFCM3* 0.75 
           
           ZERO   = 0
         ),
         
         validity = function(object)
         {
            TRUE
         }
)