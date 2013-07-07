.loadData <- function(myDat)
{
  
  la <- get("la")
  tl <- as.matrix(read.delim(system.file("external/MultilanguageReadData.txt", package="ClimMob"), header=FALSE))
  colnames(tl) <- NULL
  f1 <- file(myDat)
  rL <- readLines(f1, n=3)
  close(f1)
  ncomma <- 0
  nsemicolon <- 0
  
  if(length(strsplit(rL[2], ",")) == length(strsplit(rL[3], ","))) ncomma <- length(strsplit(rL[1], ",")[[1]])
  if(length(strsplit(rL[2], ";")) == length(strsplit(rL[3], ";"))) nsemicolon <- length(strsplit(rL[2], ";")[[1]])
  
  if(1 > (ncomma+nsemicolon)){
    
    gmessage(tl[8,la], title=tl[9,la], icon="error")
    
  } else {
    
    delim <- ifelse(ncomma<=nsemicolon, ";", ",")
    
    if(length(strsplit(rL[1], delim)) == length(strsplit(rL[2], delim))){s <- 0} else{s <- 1}
    
    if(delim == ","){myData <- read.csv(myDat, skip=s)}
    if(delim == ";"){myData <- read.csv2(myDat, skip=s)}
    
  }
    
  if(exists("myData")) {
        
    gmessage(tl[10,la], title=tl[11,la], icon="info")
        
  } else {
        
    gmessage(tl[8,la], title=tl[9,la], icon="error")
        
  }
    
  return(myData)
      
}

.readData <- function()
{
  
  la <- get("la")
  tl <- as.matrix(read.delim(system.file("external/MultilanguageReadData.txt", package="ClimMob"), header=FALSE))
  colnames(tl) <- NULL
  
  lD1 <- function(h, ...)
  {
    
    
    .GlobalEnv$myData <- .loadData(svalue(gf1))
    dispose(g1)
    
  }
  
  lD2 <- function(h, ...)
  {
    
    
    .GlobalEnv$myData <- .loadData(system.file(paste("external/", tl[7,la], sep=""), package="ClimMob"))
    dispose(g1)
    
  }
  
  g1 <- gwindow(tl[1,la], visible=FALSE)
  gg1 <- ggroup(horizontal=FALSE, container=g1)
  gg2 <- ggroup(horizontal=TRUE, container=gg1)
  glabel(tl[2,la], container=gg2)
  gf1 <- gfilebrowse(text=tl[3,la], filter= list("CSV" = list(patterns = c("*.csv"))), container=gg2)
  gb1 <- gbutton(tl[4,la], container=gg2, handler=lD1)
  glabel(paste("   ",tl[5,la]), container=gg1)
  gg3 <- ggroup(horizontal=TRUE, container=gg1)
  glabel(tl[6,la], container=gg3)
  gt1 <- gtext(tl[7,la], container=gg3)
  size(gt1) <- c(155,10)
  gb2 <- gbutton(tl[4,la], container=gg3, handler=lD2)
  visible(g1) <- TRUE
  
}
