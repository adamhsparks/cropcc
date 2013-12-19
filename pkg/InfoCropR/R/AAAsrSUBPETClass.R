#srSUBPET [subRoutines: SUBR_SUBPET]
#-------------
setClass(Class="srSUBPETClass",
         
         representation = representation(
            
            DINDEX = "numeric",
            
            ANGOT  = "numeric",
            DAYLP  = "numeric",
            PEVAP  = "numeric",           #== potential evaporation
            PTRANS = "numeric"            #== potential transpiration
            
         ),
         
         prototype = prototype( 
            
            DINDEX = 10957,
            
            ANGOT  = 0,
            DAYLP  = 0,
            PEVAP  = 0,
            PTRANS = 0           
         ),
         
         validity = function(object)
         {
            TRUE
         }
         
)