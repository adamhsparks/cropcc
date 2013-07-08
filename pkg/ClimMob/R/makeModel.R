.combn2 <- function(x, m){
  cc <- combn(rev(x), m)
  cc <- cc[c(2,1), ncol(cc):1]
  cc
}


.treeModel <- function(myData, itemsgiven, rankings, explanatory)
{
  
  rankingsD <- myData[,rankings]
  itemsgivenD <- myData[,itemsgiven]
  explanatoryD <- myData[,explanatory]
  
  itemnames <- sort(unique(as.vector(unlist(itemsgivenD))))
  
  cc <- .combn2(1:length(itemnames), 2)
  pc <- matrix(NA, nrow=nrow(itemsgivenD), ncol= ncol(cc))
  
  for(i in 1:dim(itemsgivenD)[1])
  {
    
    aa <- .combn2(match(unlist(itemsgivenD[i,]), itemnames)[unlist(rankingsD[i,])], 2)
    
    for(j in 1:dim(aa)[2]){
      pc[i, aa[1,j] == cc[1,] & aa[2,j] == cc[2,]] <- 1
      pc[i, aa[2,j] == cc[1,] & aa[1,j] == cc[2,]] <- -1
    }
  }
  
  pc <- paircomp(pc, labels=itemnames)
  
  myData$pc <- pc
  
  v_tree <- bttree(formula(paste("pc", "~", paste(explanatory, collapse="+"))), data = myData, minsplit = 15, type="logit")
  return(v_tree)
  
}

.makeModel <- function()
{
  
  la <- get("la")
  tl <- as.matrix(read.delim(system.file("external/MultilanguageMakeModel.txt", package="ClimMob"), header=FALSE))
  colnames(tl) <- NULL
  
  if(!exists("myData", envir=.GlobalEnv)){
    
    gmessage(tl[1,la], title="Error", icon="error")
    return()
    
  }
 
  myData <- get("myData")
  
  w2 <- gwindow(title=tl[2,la], visible=FALSE, parent=c(0,0)) #previous window for size...
  size(w2) <- c(600,720)
  nb2 <- ggroup(horizontal=FALSE, container=w2, spacing=5)
  
  ttitle <- glabel(tl[3,la], container=nb2)
  font(ttitle) <- list(size=16)
  
  cn <- as.data.frame(cbind(1:ncol(myData), colnames(myData)))
  colnames(cn) <- c(tl[4,la], tl[5,la])
  
  g0 <- glabel(tl[6,la],container=nb2)
  font(g0) <- list(size=12)
  a0 <- gcombobox(colnames(myData), container=nb2, selected=-1)
  
  g1 <- glabel(tl[7,la],container=nb2)
  font(g1) <- list(size=12)
  aa <- gtable(cn, chosencol = 1, multiple=TRUE, container=nb2)
  size(aa) <- c(130,80)
    
  g2 <- glabel(tl[8,la],container=nb2)
  font(g2) <- list(size=12)
  bb <- gtable(cn, chosencol = 1, multiple=TRUE, container=nb2)
  size(bb) <- c(130,80)
  
  g3 <- glabel(tl[9,la],container=nb2)
  font(g3) <- list(size=12)
  cc <- gtable(cn, chosencol = 1, multiple=TRUE, container=nb2)
  size(cc) <- c(150,100)
  
  g4 <- glabel(tl[10,la], container=nb2)
  font(g4) <- list(size=12)
  dd <- gcombobox(c(tl[11,la], colnames(myData)), container=nb2)
  addHandlerChanged(dd, function(h, ...) {
    
    if(svalue(h$obj) != tl[11,la])
    {
      qv <- unique(as.character(myData[,svalue(h$obj)]))
      qv <- cbind(1:length(qv), qv)
      colnames(qv) <- c(tl[12,la], tl[13,la])
      blockHandler(ee)
      ee[] <- qv
      svalue(ee, index=TRUE) <- 0
      tcl(ee$widget, "column", 2, minwidth=480, width=480, stretch=TRUE) #workaround suggested by J. Verzani
      unblockHandler(ee)
    } else{ ee[] <- tl[14,la]}
        
    })
  
  group9 <- ggroup(horizontal=FALSE, container=nb2, spacing=0)
  g5 <- glabel(tl[15,la], container=group9)
  font(g5) <- list(size=12)
  ee <- gtable(tl[16,la], multiple=TRUE, container=group9)
  size(ee) <- c(130,80)
  
  nb3 <- ggroup(horizontal=TRUE, container=nb2)
  addSpring(nb3)
  
  b <- gbutton(tl[17,la], container=nb3, handler = function(h, ...){

    #check if complete
    check0 <- length(svalue(a0)) > 0
    check1 <- length(svalue(aa)) > 0
    check2 <- length(svalue(bb)) > 0
    check3 <- length(svalue(cc)) > 0
    checks <- c(check0, check1, check2, check3)
    
    if(!all(checks))
    {
      
      incompleteMessage <- paste(tl[18,la], paste((tl[19:22,la])[!checks], collapse="\n", sep="\n"), collapse="\n", sep="\n")
      gmessage(incompleteMessage, title="Incomplete input", icon="info")
      
    } 
    else{
    
      galert(tl[23,la], parent=c(100,300), delay=4)
      
      observeridVar <- svalue(a0)
      itemsgivenVars <- colnames(myData)[as.integer(svalue(aa))]
      rankingsVars <- colnames(myData)[as.integer(svalue(bb))]
      explanatoryVars <- colnames(myData)[as.integer(svalue(cc))]
      questionVar <- colnames(myData)[as.integer(svalue(dd))]
      questionsAnalyzed <- svalue(ee)                                           
      
      assign("observeridVar", observeridVar, envir=.GlobalEnv)
      assign("itemsgivenVars", itemsgivenVars, envir=.GlobalEnv)
      assign("rankingsVars", rankingsVars, envir=.GlobalEnv)
      assign("explanatoryVars", explanatoryVars, envir=.GlobalEnv)
      assign("questionVar", questionVar, envir=.GlobalEnv)
      assign("questionsAnalyzed", questionsAnalyzed, envir=.GlobalEnv)
      
      nq <- length(svalue(ee))
      if(nq < 1){nq <- 1}
      .GlobalEnv$models <- vector(mode="list", length=nq)
      
      for(i in 1:nq)
      {
        
        if(nq>1){myData_i <- myData[myData[,questionVar] == questionsAnalyzed[i],]}
        else{myData_i <- myData}
        .GlobalEnv$models[[i]] <- .treeModel(myData_i, itemsgivenVars, rankingsVars, explanatoryVars)
        
      }
      
      gmessage(tl[24,la], title="Done", icon="info")
      
      dispose(w2)
     
    }  
      
  })
  font(b) <- list(size=12)
  visible(w2) <- TRUE
  
}
