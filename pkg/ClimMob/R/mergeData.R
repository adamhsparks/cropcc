mergeData <- function(){
    
  w <- gwindow(visible=FALSE)

  g1 <- ggroup(container=w, horizontal=FALSE)
  
  ttitle <- glabel("Create info sheets", container=g1)
  font(ttitle) <- list(size=16)
  
  glabel("Select first file:", container=g1)
  
  a <- gfilebrowse(text = "Select a file...",
                   type = "open",
                   container = g1,
                   filter= list("All files" = list(patterns = c("*")), "CSV files" = list(patterns = c("*.csv"))))

  glabel("Select second file:", container=g1)
  
  b <- gfilebrowse(text = "Select a file...",
                   type = "open",
                   container = g1,
                   filter= list("All files" = list(patterns = c("*")), "CSV files" = list(patterns = c("*.csv"))))
  
  b3 <- gbutton("Merge", handler = function(h, ...){
    
    x <- .loadData(a)
    
    y <- .loadData(b)
    
    myDataMerged <- merge(x, y, all = TRUE)
    
    dispose(w)
    
  }, container=g1)
  
  visible(w) <- TRUE
  
}