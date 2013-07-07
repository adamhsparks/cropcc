.mergeData <- function(){
    
  la <- get("la")
  tl <- as.matrix(read.delim(system.file("external/MultilanguageMergeData.txt", package="ClimMob"), header=FALSE))
  colnames(tl) <- NULL
  
  w <- gwindow(title=tl[1,la], visible=FALSE)

  g1 <- ggroup(container=w, horizontal=FALSE)
  
  ttitle <- glabel(tl[2,la], container=g1)
  font(ttitle) <- list(size=16)
  
  gl1 <- glabel(tl[3,la], container=g1)
  font(gl1) <- list(size=12)
  
  a <- gfilebrowse(text = tl[4,la],
                   type = "open",
                   container = g1,
                   filter= list("CSV" = list(patterns = c("*.csv"))))

  gl2 <- glabel(tl[5,la], container=g1)
  font(gl2) <- list(size=12)
  
  b <- gfilebrowse(text = tl[4,la],
                   type = "open",
                   container = g1,
                   filter= list("CSV" = list(patterns = c("*.csv"))))
  
  gl6 <- glabel(tl[6,la], container=g1)
  font(gl6) <- list(size=12)
  a <- gfilebrowse(text=tl[13,la], type="selectdir", container=g1)
  svalue(a) <- getwd()
  
  group2 <- ggroup(horizontal=TRUE, spacing=5, container=g1)
  gl7 <- glabel(tl[7,la], container=group2)
  font(gl7) <- list(size=11)
  decsepI <- ifelse(Sys.localeconv()["decimal_point"] == ".", 1, 2)
  decsep <- gradio(items=c(tl[8,la], tl[9,la]), selected=decsepI, horizontal=TRUE, container=group2)
  gl8 <- glabel(tl[10,la], container=group2)
  font(gl8) <- list(size=11)
  MSExcel <- gradio(items=c(tl[11,la], tl[12,la]), selected=1, horizontal=TRUE, container=group2)
    
  b3 <- gbutton(tl[13,la], handler = function(h, ...){
    
    x <- .loadData(a)
    
    y <- .loadData(b)
    
    myDataMerged <- merge(x, y, all = TRUE)
    fn <- paste(a, "_", b, tl[14,la])
    
    
    if(svalue(decsep) == tl[8,la] & svalue(MSExcel) == tl[12,la]){write.csv(myDataMerged, fn, row.names=F, fileEncoding = "ASCII")}
    if(svalue(decsep) == tl[9,la] & svalue(MSExcel) == tl[12,la]){write.csv2(myDataMerged, fn, row.names=F, fileEncoding = "ASCII")}
    if(svalue(decsep) == tl[8,la] & svalue(MSExcel) == tl[13,la]){
      
      fl <- file(fn)
      writeLines("sep=,", con=fl)
      close(fl)
      suppressWarnings(write.table(myDataMerged, fn, append=TRUE, sep=",", dec=".", row.names=FALSE, col.names=TRUE, fileEncoding="ASCII"))
      
    }
    if(svalue(decsep) == tl[9,la] & svalue(MSExcel) == tl[13,la]){
      
      fl <- file(fn)
      writeLines("sep=;", con=fl)
      close(fl)
      suppressWarnings(write.table(myDataMerged, fn, append=TRUE, sep=";", dec=",", row.names=FALSE, col.names=TRUE, fileEncoding="ASCII"))
      
    }
    
    dispose(w)
    
  }, container=g1)
  
  font(b3) <- list(size=12)
  
  visible(w) <- TRUE
  
}