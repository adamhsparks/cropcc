makeModel <- function()
{
  
  if(!exists("myData", envir=.GlobalEnv)){
    
    gmessage("You should load the data before you can proceed.", title="Error", icon="error")
    return()
    
  }
  
  w2 <- gbasicdialog(title="Try3", visible=FALSE, do.buttons=FALSE, width=3000, height=1000) #previous window for size...
  
  .GlobalEnv$VarsSelected1 <- NULL
  .GlobalEnv$VarsSelected2 <- NULL
  .GlobalEnv$VarsSelected3 <- NULL
  
  group1 <- ggroup(horizontal=FALSE, spacing= 20, container=w2)
  
  nb1 <- gtable(items=myData, container=group1, expand=TRUE)
  addSpace(group1, 20)
  tbl <- glayout(container = group1)
  
  tbl[1,1] <- "Indicate for each column what it contains."
  
  nb2 <- ggroup(horizontal=FALSE, container=group1)
  
  cbhandler1 <- function(h, ...){ .GlobalEnv$VarsSelected1 <- svalue(h$obj)}
  cbhandler2 <- function(h, ...){ .GlobalEnv$VarsSelected2 <- svalue(h$obj)}
  cbhandler3 <- function(h, ...){ .GlobalEnv$VarsSelected3 <- svalue(h$obj)}
  
  glabel("Rankings",container=nb2, anchor=c(0,0))
  rb1 <- gcheckboxgroup(colnames(myData), checked=FALSE, handler=cbhandler1, horizontal=FALSE, container=nb2)
  glabel("Explanatory variables",container=nb2, anchor=c(0,0))
  rb2 <- gcheckboxgroup(colnames(myData), checked=FALSE, handler=cbhandler2, horizontal=FALSE, container=nb2)
  glabel("Question categories",container=nb2, anchor=c(0,0))
  rb3 <- gcheckboxgroup(colnames(myData), checked=FALSE, handler=cbhandler3, horizontal=FALSE, container=nb2)
  addSpring(nb2)
  b <- gbutton("Go to next step", handler = function(h, ...){dispose(w2)}, container=nb2)
  
  visible(w2, set=TRUE)
  
}
