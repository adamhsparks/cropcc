#SUBPET
setClass(Class="SUBPETClass",
         
         representation = representation(
            
            ANGOT  = "numeric",
            DAYLP  = "numeric",
            ETAE   = "numeric",
            ETD    = "numeric",
            ETRD   = "numeric",
            PEVAP  = "numeric",
            PTRANS = "numeric",
            RDN    = "numeric",
            DINDEX = "numeric"
         ),
         
         prototype = prototype( 
            
            ANGOT  = 0,
            DAYLP  = 0,
            ETAE   = 0,
            ETD    = 0,
            ETRD   = 0,
            PEVAP  = 0,
            PTRANS = 0,
            RDN    = 0,
            DINDEX = 10957
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)