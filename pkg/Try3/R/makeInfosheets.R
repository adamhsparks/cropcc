createInfosheets <- function(){
  
  if(!exists("myData", envir=.GlobalEnv)){
    
    gmessage("You should load the data and create a model first.", title="Error", icon="error")
    return()
    
  }
  
  if(!exists("rankingsVars", envir=.GlobalEnv)){
    
    gmessage("You should create a model first.", title="Error", icon="error")
    return()
    
  }
  
  w6 <- gwindow(title="Try3 - Create report", visible=FALSE, parent=c(0,0)) 
  group1 <- ggroup(horizontal=FALSE, spacing= 10, container=w6)
  
  
}