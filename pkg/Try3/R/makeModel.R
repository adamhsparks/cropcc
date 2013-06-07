makeModel <- function()
{
  
  if(!exists("myData", envir=.GlobalEnv)){
    
    gmessage("You should load the data before you can proceed.", title="Error", icon="error")
    return()
    
  }
  
  w2 <- gwindow(title="Try3 - Make model", visible=FALSE, parent=c(0,0)) #previous window for size...
  
  group1 <- ggroup(horizontal=FALSE, spacing= 20, container=w2, use.scrollwindow = TRUE)
  
  nb1 <- gtable(items=myData, container=group1, expand=TRUE)
  addSpace(group1, 20)
  tbl <- glayout(container = group1)
  
  tbl[1,1] <- "Indicate for each category the columns."
  
  nb2 <- ggroup(horizontal=FALSE, container=group1)
  
  cn <- as.data.frame(cbind(1:ncol(myData), colnames(myData)))
  colnames(cn) <- c("Column_number", "Variable_name")
  
  glabel("Ranking variables",container=nb2)
  aa <- gtable(cn, chosencol = 1, multiple=TRUE, container=nb2,
                handler = function(h,...) .GlobalEnv$rankingVars <- svalue(h$obj))
  
  size(aa) <- c(150,100)
  
  glabel("Explanatory variables",container=nb2)
  bb <- gtable(cn, chosencol = 1, multiple=TRUE, container=nb2,
         handler = function(h,...) .GlobalEnv$explVars <- svalue(h$obj))
  
  glabel("Question categories",container=nb2)
  cc <- gtable(cn, chosencol = 1, multiple=TRUE, container=nb2,
         handler = function(h,...) .GlobalEnv$questionVars <- svalue(h$obj))
   
  addSpring(nb2)
  b <- gbutton("Create randomization", container=nb2, handler = function(h, ...){
    
  })
  
  visible(w2) <- TRUE
  
}
