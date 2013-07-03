makeRandomization <- function()
{
  
  w1 <- gwindow(title="ClimMob - Create randomization", visible=FALSE, parent=c(0,0)) 
  group1 <- ggroup(horizontal=FALSE, spacing= 5, container=w1)
  
  ttitle <- glabel("Make randomization", container=group1)
  font(ttitle) <- list(size=16)
  
  group7 <- ggroup(horizontal=TRUE, spacing= 5, container=group1)
  gl1 <- glabel("Fill in the form and click on the button.\nA CSV file with the randomization will be written to the selected folder.\nCSV files can be read with Excel or other spreadsheet software.\nIf you experience problems reading the file, try changing the \"decimal\nseparator\" and/or \"format\" settings.", container=group7)
  font(gl1) <- list(size=12)
  
  group6 <- ggroup(horizontal=TRUE, spacing=5, container=group1, expand=TRUE)
  gl2 <- glabel("Identifier (prepended to file name and observer IDs):", container=group6)
  font(gl2) <- list(size=12)
  setid <- gtext(container=group6, height=1, width=2)
  size(setid) <- c(30,20)
  #addHandlerChanged(setid, handler=function(h,...) {assign("identification", svalue(h$obj))} )
  
  group3 <- ggroup(horizontal=TRUE, spacing=5, container=group1, expand=TRUE)
  gl3 <- glabel("Number of observers:", container=group3)
  font(gl3) <- list(size=12)
  setnobservers <- gtext(container=group3, width=2, height=1)
  size(setnobservers) <- c(50,20)
  #addHandlerChanged(setnobservers, handler=function(h,...) {assign("nobservers", as.numeric(svalue(h$obj)))} )
  
  group4 <- ggroup(horizontal=TRUE, spacing=5, container=group1, expand=TRUE)
  gl4 <-glabel("Number of items each observer compares:", container=group4)
  font(gl4) <- list(size=12)
  setnitems <- gtext(container=group4, width=2, height=1)
  size(setnitems) <- c(30,20)
  #addHandlerChanged(setnitems, handler=function(h,...) {assign("nitems", as.numeric(svalue(h$obj)), env=)} )
  
  group5 <- ggroup(horizontal=TRUE, spacing=5, container=group1)
  gl5 <- glabel("Names of items:", container=group5)
  font(gl5) <- list(size=12)
  setitemnames <- gtext(container=group5, width=10, height=20)
  size(setitemnames) <- c(100,200)
  #addHandlerChanged(setitemnames, handler=function(h,...) {assign("itemnames", unlist(strsplit(svalue(h$obj), "\n")))})
  addHandlerRightclick(setitemnames, handler=function(h, ...) svalue(setitemnames) <- readLines(file("clipboard")))
  
  gl6 <- glabel("Select folder to write to:", container=group1)
  font(gl6) <- list(size=12)
  a <- gfilebrowse(text="Select folder to write to:", type="selectdir", container=group1)
  svalue(a) <- getwd()

  group2 <- ggroup(horizontal=TRUE, spacing=5, container=group1)
  gl7 <- glabel("Decimal separator:" , container=group2)
  font(gl7) <- list(size=11)
  decsepI <- ifelse(Sys.localeconv()["decimal_point"] == ".", 1, 2)
  decsep <- gradio(items=c("Dot", "Comma"), selected=decsepI, horizontal=TRUE, container=group2)
  gl8 <- glabel("Format:" , container=group2)
  font(gl8) <- list(size=11)
  MSExcel <- gradio(items=c("Excel", "Standard"), selected=1, horizontal=TRUE, container=group2)
  
  group3 <- ggroup(horizontal=TRUE, spacing=5, container=group1)
  addSpring(group3)
  b <- gbutton("Create randomization", handler = function(h, ...){
      setwd(svalue(a))
      
      nitems <- as.integer(svalue(setnitems))
      itemnames <- unlist(strsplit(svalue(setitemnames), "\n"))
      nobservers <- as.integer(svalue(setnobservers))
      identification <- svalue(setid)
      nvar <- length(itemnames)
      
      if(is.na(nitems)) stop("nitems problem")
      
      #Input
      varieties <- 1:nvar
      codes <- matrix(nrow=sum(nobservers), ncol=nitems+1)
      colnames(codes) <- c("Observer", paste("Item", 1:nitems, sep=""))
      codes[,1] <- paste(identification, 1:sum(nobservers), sep="")
      
      varcombinations <- t((combn(varieties, 3)))
      ncomb <- dim(varcombinations)[1]
      n <- floor(nobservers/ncomb)
      nfixed <- ncomb*n
      
      vars1 <- varcombinations[c(rep(1:(dim(varcombinations)[1]), times=n)),]
      vars2 <- varcombinations[sample(ncomb, nobservers-nfixed),]
      vars <- rbind(vars1, vars2)
      
      vars <- vars[sample(nobservers,nobservers),]
      
      for(i in 1:nobservers) codes[i,2:4] <- itemnames[sample(vars[i,], 3)]
      
      fn <- paste(identification, "ClimMobRandomization.csv", sep="")
      
      if(svalue(decsep) == "Dot" & svalue(MSExcel) == "Standard"){write.csv(codes, fn, row.names=F, fileEncoding = "ASCII")}
      if(svalue(decsep) == "Comma" & svalue(MSExcel) == "Standard"){write.csv2(codes, fn, row.names=F, fileEncoding = "ASCII")}
      if(svalue(decsep) == "Dot" & svalue(MSExcel) == "Excel"){
        
        fl <- file(fn)
        writeLines("sep=,", con=fl)
        close(fl)
        suppressWarnings(write.table(codes, fn, append=TRUE, sep=",", dec=".", row.names=FALSE, col.names=TRUE, fileEncoding="ASCII"))
               
      }
      if(svalue(decsep) == "Comma" & svalue(MSExcel) == "Excel"){
        
        fl <- file(fn)
        writeLines("sep=;", con=fl)
        close(fl)
        suppressWarnings(write.table(codes, fn, append=TRUE, sep=";", dec=",", row.names=FALSE, col.names=TRUE, fileEncoding="ASCII"))
                
      }
            
      gmessage(paste("File ", fn, " written to ", getwd(), sep=""), title="Done", icon="info")
   
    }, container=group3)

  font(b) <- list(size=12)
  
  visible(w1) <- TRUE
  
}
