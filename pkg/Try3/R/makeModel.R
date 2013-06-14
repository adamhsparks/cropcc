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
  pc <- matrix(NA, nrow=nrow(items), ncol= ncol(cc))
  
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

makeModel <- function()
{
  
  if(!exists("myData", envir=.GlobalEnv)){
    
    gmessage("You should load the data before you can proceed.", title="Error", icon="error")
    return()
    
  }
  
  
  
  w2 <- gwindow(title="Try3 - Make model", visible=FALSE, parent=c(0,0)) #previous window for size...
  size(w2) <- c(600,600)
  group1 <- ggroup(horizontal=FALSE, spacing= 10, container=w2, use.scrollwindow = TRUE)
  
  nb1 <- gtable(items=myData, container=group1, expand=TRUE)

  nb2 <- ggroup(horizontal=FALSE, container=group1)
  
  cn <- as.data.frame(cbind(1:ncol(myData), colnames(myData)))
  colnames(cn) <- c("Column_number", "Variable_name")
  
  addSpace(nb2,10)
  glabel("Select the columns with the items given to each observer (original randomization):",container=nb2)
  aa <- gtable(cn, chosencol = 1, multiple=TRUE, container=nb2)
  size(aa) <- c(150,100)
    
  addSpace(nb2,10)
  glabel("Select the ranking (response) variables:",container=nb2)
  bb <- gtable(cn, chosencol = 1, multiple=TRUE, container=nb2)
  size(bb) <- c(150,100)
  
  addSpace(nb2,10)
  glabel("Select the explanatory variables:",container=nb2)
  cc <- gtable(cn, chosencol = 1, multiple=TRUE, container=nb2)
  size(cc) <- c(150,100)
  
  addSpace(nb2,10)
  glabel("Select variable representing the questions (if different aspects were evaluated):", container=nb2)
  dd <- gtable(cn, chosencol = 1, multiple=TRUE, container=nb2)
  size(dd) <- c(150,100)
  
  nb3 <- ggroup(horizontal=TRUE, container=nb2)
  addSpring(nb3)
  
  b <- gbutton("Create model", container=nb3, handler = function(h, ...){

    galert("Creating model... This can take some time.", parent=c(1,1), delay=4)
        
    .GlobalEnv$itemsgivenVars <- colnames(myData)[as.integer(svalue(aa))]
    .GlobalEnv$rankingsVars <- colnames(myData)[as.integer(svalue(bb))]
    .GlobalEnv$explanatoryVars <- colnames(myData)[as.integer(svalue(cc))]
    .GlobalEnv$questionVar <- colnames(myData)[as.integer(svalue(dd))]

    nq <- 1
    if(length(questionVar>0)){
      
      questions <- sort(as.character(unique(myData[,questionVar])))
      nq <- length(questions)
      
    }
    
    models <- vector(mode="list", length=nq)
    
    for(i in 1:nq)
    {
      
      if(nq>1){myData_i <- myData[myData[,questionVar] == questions[i],]}
      else{myData_i <- myData}
      models[[i]] <- .treeModel(myData_i, itemsgivenVars, rankingsVars, explanatoryVars)
      
    }
    
    dispose(w2)
    
    gmessage(paste("Model created. \nItems given:\n", 
                   paste(itemsgivenVars, collapse=", "),"\nRanking variables:\n", 
                   paste(rankingsVars, collapse=", "),
                   "\nExplanatory variables:\n",
                   paste(explanatoryVars, collapse=", "),
                   "\nQuestion (aspect evaluated) variable:\n",
                   paste(questionVar, collapse=", ")
                   ), title="Done", icon="info")
        
  })
  
  visible(w2) <- TRUE
  
}
