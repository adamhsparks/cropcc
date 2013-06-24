menuClimMob <- function()
{
  
  w1 <- gwindow(title="ClimMob - Main menu", visible=FALSE, width=300, height=500, parent=c(0,0)) #previous window for size...
  group1 <- ggroup(horizontal=FALSE, spacing= 10, container=w1)
  a <- gimage(system.file("external/ClimMob-logo.gif", package="ClimMob"), container=group1)

  group2 <- ggroup(horizontal=TRUE, spacing= 0, container=group1)
  b1 <- gbutton("Make randomization", handler = function(h, ...){makeRandomization()}, container=group2)
  font(b1) <- list(size=12)
  addSpring(group2)
  
  group3 <- ggroup(horizontal=TRUE, spacing= 0, container=group1)
  b2 <- gbutton("Merge data sets", handler = function(h, ...){}, container=group3)
  font(b2) <- list(size=12)
  addSpring(group3)
  
  group4 <- ggroup(horizontal=TRUE, spacing= 0, container=group1)
  b3 <- gbutton("Load ranking data", handler = function(h, ...){readData()}, container=group4)
  font(b3) <- list(size=12)
  addSpring(group4)
  
  group5 <- ggroup(horizontal=TRUE, spacing= 0, container=group1)
  b4 <- gbutton("Create model", handler = function(h, ...){makeModel()}, container=group5)
  font(b4) <- list(size=12)
  addSpring(group5)
  
  group6 <- ggroup(horizontal=TRUE, spacing= 0, container=group1)
  b5 <- gbutton("Generate analysis report", handler = function(h, ...){analysisReport()}, container=group6)
  font(b5) <- list(size=12)
  addSpring(group6)
  
  group7 <- ggroup(horizontal=TRUE, spacing= 0, container=group1)
  b6 <- gbutton("Generate info sheets", handler = function(h, ...){createInfosheets()}, container=group7)
  font(b6) <- list(size=12)
  addSpring(group7)
  
  group8 <- ggroup(horizontal=TRUE, spacing= 0, container=group1)
  b7 <- gbutton("Get more info and help", handler = function(h, ...){helpClimMob()}, container=group8)
  font(b7) <- list(size=12)
  addSpring(group8)
  
  visible(w1) <- TRUE
  focus(w1) <- TRUE

}
