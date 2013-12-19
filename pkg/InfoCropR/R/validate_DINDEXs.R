# val_DINDEXs
validate_DINDEXs <- function(DINDEXs_beg,DINDEXs_end)
{
  Value <- TRUE
  if (DINDEXs_beg < 365) {
      Value <- FALSE
     } else 
       if (DINDEXs_end > 11321) {
         Value <- FALSE
       } else
         if (DINDEXs_beg > DINDEXs_end) {Value <- FALSE}
  #----------------
  return(Value)
}
#==================
# val_DINDEXs <- validate_DINDEXs(DINDEXs_ini,DINDEXs_fin)