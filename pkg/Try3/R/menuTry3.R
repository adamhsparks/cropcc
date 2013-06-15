menuTry3 <- function()
{
  
  w1 <- gwindow(title="Try3 - Main menu", visible=FALSE, width=500, height=500) #previous window for size...
  group1 <- ggroup(horizontal=FALSE, spacing= 15, container=w1)
  gimage(system.file("external/Try3-logo.gif", package="Try3"), container=group1)

  b1 <- gbutton("Make randomization", handler = function(h, ...){makeRandomization()}, container=group1)

  b2 <- gbutton("Merge data sets", handler = function(h, ...){}, container=group1)

  b3 <- gbutton("Load ranking data", handler = function(h, ...){readData()}, container=group1)
  
  b4 <- gbutton("Create model", handler = function(h, ...){makeModel()}, container=group1)
  
  b5 <- gbutton("Create analysis report", handler = function(h, ...){analysisReport()}, container=group1)

  b6 <- gbutton("Create info sheets", handler = function(h, ...){createInfosheets()}, container=group1)
  
  b7 <- gbutton("Set options", handler = function(h, ...){setTry3Options()}, container=group1)
  
  b8 <- gbutton("Get help", handler = function(h, ...){helpTry3()}, container=group1)
  
  visible(w1) <- TRUE
  focus(w1) <- TRUE
}
