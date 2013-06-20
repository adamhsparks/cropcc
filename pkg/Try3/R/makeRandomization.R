makeRandomization <- function()
{
  
  w1 <- gwindow(title="Try3 - Create randomization", visible=FALSE, parent=c(0,0)) 
  group1 <- ggroup(horizontal=FALSE, spacing= 10, container=w1)
  
  group7 <- ggroup(horizontal=TRUE, spacing= 20, container=group1)
  glabel("Fill in the form and click on the button.\n A CSV file with the randomization will be written to the selected folder.\n CSV files can be read with Excel or other spreadsheet software.", container=group7)
  
  group6 <- ggroup(horizontal=TRUE, spacing=10, container=group1, expand=TRUE)
  glabel("Identifier (prepended to file name and observer IDs):", container=group6)
  setid <- gtext(container=group6, height=1, width=2)
  size(setid) <- c(30,20)
  addHandlerChanged(setid, handler=function(h,...) .GlobalEnv$identification <- svalue(h$obj))
  
  group3 <- ggroup(horizontal=TRUE, spacing=10, container=group1, expand=TRUE)
  glabel("Number of observers:", container=group3)
  setnobservers <- gtext(container=group3, width=2, height=1)
  size(setnobservers) <- c(50,20)
  addHandlerChanged(setnobservers, handler=function(h,...) .GlobalEnv$nobservers <- as.numeric(svalue(h$obj)))
  
  group4 <- ggroup(horizontal=TRUE, spacing=10, container=group1, expand=TRUE)
  glabel("Number of items each observer compares:", container=group4)
  setnitems <- gtext(container=group4, width=2, height=1)
  size(setnitems) <- c(30,20)
  addHandlerChanged(setnitems, handler=function(h,...) {.GlobalEnv$nitems <- as.numeric(svalue(h$obj))})
  
  group5 <- ggroup(horizontal=TRUE, spacing=10, container=group1)
  glabel("Names of items:", container=group5)
  setitemnames <- gtext(container=group5, width=10, height=20)
  size(setitemnames) <- c(100,200)
  addHandlerChanged(setitemnames, handler=function(h,...) .GlobalEnv$itemnames <- unlist(strsplit(svalue(h$obj), "\n")))
  addHandlerRightclick(setitemnames, handler=function(h, ...) svalue(setitemnames) <- readLines(file("clipboard")))
  
  glabel("Select folder to write to:", container=group1)
  a <- gfilebrowse(text="Select folder to write to:", type="selectdir", container=group1)
  svalue(a) <- getwd()
  group2 <- ggroup(horizontal=TRUE, spacing=10, container=group1)
  #addSpring(group2)
  b <- gbutton("Create randomization", handler = function(h, ...){
      setwd(svalue(a))
      
      nvar <- length(itemnames)
      
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
      
      write.csv(codes, paste(identification, "Try3randomization.csv", sep=""), row.names=F)
      gmessage(paste("File ", identification, "Try3randomization.csv written to ", getwd(), sep=""), title="Done", icon="info")
   
    }, container=group2)

  visible(w1) <- TRUE

  
}
