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
  glabel("Select the ranking (response) variables:",container=nb2)
  aa <- gtable(cn, chosencol = 1, multiple=TRUE, container=nb2)
  
  size(aa) <- c(150,100)
  
  addSpace(nb2,10)
  glabel("Select the explanatory variables:",container=nb2)
  bb <- gtable(cn, chosencol = 1, multiple=TRUE, container=nb2)
  
  size(bb) <- c(150,100)
  
  addSpace(nb2,10)
  glabel("Select variable representing the questions (if different aspects were evaluated):", container=nb2)
  cc <- gtable(cn, chosencol = 1, multiple=TRUE, container=nb2)
  
  size(cc) <- c(150,100)
  
  nb3 <- ggroup(horizontal=TRUE, container=nb2)
  addSpring(nb3)
  b <- gbutton("Create model", container=nb3, handler = function(h, ...){

    .GlobalEnv$rankingVars <- colnames(myData)[as.integer(svalue(aa))]
    .GlobalEnv$explVars <- colnames(myData)[as.integer(svalue(bb))]
    .GlobalEnv$questionVar <- colnames(myData)[as.integer(svalue(cc))]
    
    gmessage(paste("Model created. \nRanking variables:\n", 
                   rankingVars,
                   "\nExplanatory variables:\n",
                   explVars,
                   "\nQuestion (aspect evaluated) variable:\n",
                   questionVar
                   ), title="Done", icon="info")
    
  })
  
  visible(w2) <- TRUE
  
}
