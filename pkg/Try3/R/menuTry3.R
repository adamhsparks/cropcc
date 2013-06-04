menuTry3 <- function()
{
  
  w1 <- gwindow(title="Try3 - Main menu", visible=TRUE, do.buttons=FALSE, width=500, height=500) #previous window for size...
  group1 <- ggroup(horizontal=FALSE, spacing= 40, container=w1)
  gimage(system.file("external/Try3-logo.gif", package="Try3"), container=group1)
  addSpace(obj=group1, value=10, horizontal=FALSE)
  b1 <- gbutton("Make randomization", handler = function(h, ...){makeRandomization()}, container=group1)
  addSpace(obj=group1, value=10, horizontal=FALSE)
  b2 <- gbutton("Merge data sets", handler = function(h, ...){}, container=group1)
  addSpace(obj=group1, value=10, horizontal=FALSE)
  b3 <- gbutton("Load ranking data", handler = function(h, ...){readData()}, container=group1)
  addSpace(obj=group1, value=10, horizontal=FALSE)
  b4 <- gbutton("Create model", handler = function(h, ...){createModel()}, container=group1)
  addSpace(obj=group1, value=10, horizontal=FALSE)
  b5 <- gbutton("Create analysis report", handler = function(h, ...){analysisReport()}, container=group1)
  addSpace(obj=group1, value=10, horizontal=FALSE)
  b6 <- gbutton("Create info sheets", handler = function(h, ...){}, container=group1)
  
}
