.makeRandomization <- function()
{
  
  la <- get("la")
  tl <- as.matrix(read.delim(system.file("external/MultilanguageMakeRandomization.txt", package="ClimMob"), header=FALSE))
  colnames(tl) <- NULL
  
  w1 <- gwindow(title=tl[1,la], visible=FALSE, parent=c(0,0)) 
  group1 <- ggroup(horizontal=FALSE, spacing= 5, container=w1)
  
  ttitle <- glabel(tl[2,la], container=group1)
  font(ttitle) <- list(size=16)
  
  group6 <- ggroup(horizontal=TRUE, spacing=5, container=group1, expand=TRUE)
  gl2 <- glabel(tl[3,la], container=group6)
  font(gl2) <- list(size=12)
  setid <- gtext(container=group6, height=1, width=2)
  size(setid) <- c(30,20)
  
  group3 <- ggroup(horizontal=TRUE, spacing=5, container=group1, expand=TRUE)
  gl3 <- glabel(tl[4,la], container=group3)
  font(gl3) <- list(size=12)
  setnobservers <- gtext(container=group3, width=2, height=1)
  size(setnobservers) <- c(50,20)
  
  group4 <- ggroup(horizontal=TRUE, spacing=5, container=group1, expand=TRUE)
  gl4 <-glabel(tl[5,la], container=group4)
  font(gl4) <- list(size=12)
  setnitems <- gtext(container=group4, width=2, height=1)
  size(setnitems) <- c(30,20)
  
  group5 <- ggroup(horizontal=TRUE, spacing=5, container=group1)
  gl5 <- glabel(tl[6,la], container=group5)
  font(gl5) <- list(size=12)
  setitemnames <- gtext(container=group5, width=10, height=20)
  size(setitemnames) <- c(100,200)
  addHandlerRightclick(setitemnames, handler=function(h, ...) svalue(setitemnames) <- readLines(file("clipboard")))
  
  gl6 <- glabel(tl[7,la], container=group1)
  font(gl6) <- list(size=12)
  a <- gfilebrowse(text=tl[7,la], type="selectdir", container=group1)
  svalue(a) <- getwd()

  group2 <- ggroup(horizontal=TRUE, spacing=5, container=group1)
  gl7 <- glabel(tl[8,la], container=group2)
  font(gl7) <- list(size=11)
  decsepI <- ifelse(Sys.localeconv()["decimal_point"] == ".", 1, 2)
  decsep <- gradio(items=c(tl[9,la], tl[10,la]), selected=decsepI, horizontal=TRUE, container=group2)
  gl8 <- glabel(tl[11,la], container=group2)
  font(gl8) <- list(size=11)
  MSExcel <- gradio(items=c(tl[12,la], tl[13,la]), selected=1, horizontal=TRUE, container=group2)
  
  group3 <- ggroup(horizontal=TRUE, spacing=5, container=group1)
  addSpring(group3)
  b <- gbutton(tl[14,la], handler = function(h, ...){

      if(is.null(svalue(setnitems)) | is.null(svalue(setitemnames)) | 
           is.null(svalue(setnobservers)) | is.null(svalue(setid)) | 
           svalue(setnitems) == "" | svalue(setitemnames) == "" | 
           svalue(setnobservers) == "" | svalue(setid) == "" )
      {
        
        gmessage(tl[15,la])
        options(show.error.messages = FALSE)
        stop()
        options(show.error.messages = TRUE)
        
      }
      
      setwd(svalue(a))
      
      nitems <- as.integer(svalue(setnitems))
      itemnames <- unlist(strsplit(svalue(setitemnames), "\n"))
      nobservers <- as.integer(svalue(setnobservers))
      identification <- svalue(setid)
            
      nvar <- length(itemnames)
      
      #Input
      varieties <- 1:nvar
      codes <- matrix(nrow=sum(nobservers), ncol=nitems+1)
      colnames(codes) <- c(tl[18,la], paste(tl[19,la], 1:nitems, sep=""))
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
      
      fn <- paste(identification, tl[16,la], sep="")
      
      if(svalue(decsep) == tl[9,la] & svalue(MSExcel) == tl[13,la]){write.csv(codes, fn, row.names=F, fileEncoding = "ASCII")}
      if(svalue(decsep) == tl[10,la] & svalue(MSExcel) == tl[13,la]){write.csv2(codes, fn, row.names=F, fileEncoding = "ASCII")}
      if(svalue(decsep) == tl[9,la] & svalue(MSExcel) == tl[12,la]){
        
        fl <- file(fn)
        writeLines("sep=,", con=fl)
        close(fl)
        suppressWarnings(write.table(codes, fn, append=TRUE, sep=",", dec=".", row.names=FALSE, col.names=TRUE, fileEncoding="ASCII"))
               
      }
      if(svalue(decsep) == tl[10,la] & svalue(MSExcel) == tl[12,la]){
        
        fl <- file(fn)
        writeLines("sep=;", con=fl)
        close(fl)
        suppressWarnings(write.table(codes, fn, append=TRUE, sep=";", dec=",", row.names=FALSE, col.names=TRUE, fileEncoding="ASCII"))
                
      }
            
      gm1 <- gmessage(paste(tl[17,la], getwd(), "/", fn, sep=""), title=tl[20,la], icon="info")
      font(gm1) <- list(size=12)
      
    }, container=group3)

  font(b) <- list(size=12)
  
  visible(w1) <- TRUE
  
}
