.menuClimMob <- function()
{
  
  la <- get("la")
  tl <- as.matrix(read.delim(system.file("external/MultilanguageMainMenu.txt", package="ClimMob"), header=FALSE))
  colnames(tl) <- NULL
  
  w1 <- gwindow(title=tl[1,la], visible=FALSE, width=300, height=500, parent=c(0,0)) 
  group1 <- ggroup(horizontal=FALSE, spacing= 10, container=w1)
  a <- gimage(system.file("external/ClimMob-logo.gif", package="ClimMob"), container=group1)

  group2 <- ggroup(horizontal=TRUE, spacing= 0, container=group1)
  b1 <- gbutton(tl[2,la], handler = function(h, ...){.makeRandomization()}, container=group2)
  font(b1) <- list(size=12)
  addSpring(group2)
  
  group3 <- ggroup(horizontal=TRUE, spacing= 0, container=group1)
  b2 <- gbutton(tl[3,la], handler = function(h, ...){.mergeData()}, container=group3)
  font(b2) <- list(size=12)
  addSpring(group3)
  
  group4 <- ggroup(horizontal=TRUE, spacing= 0, container=group1)
  b3 <- gbutton(tl[4,la], handler = function(h, ...){.readData()}, container=group4)
  font(b3) <- list(size=12)
  addSpring(group4)
  
  group5 <- ggroup(horizontal=TRUE, spacing= 0, container=group1)
  b4 <- gbutton(tl[5,la], handler = function(h, ...){.makeModel()}, container=group5)
  font(b4) <- list(size=12)
  addSpring(group5)
  
  group6 <- ggroup(horizontal=TRUE, spacing= 0, container=group1)
  b5 <- gbutton(tl[6,la], handler = function(h, ...){.analysisReport()}, container=group6)
  font(b5) <- list(size=12)
  addSpring(group6)
  
  group7 <- ggroup(horizontal=TRUE, spacing= 0, container=group1)
  b6 <- gbutton(tl[7,la], handler = function(h, ...){.createInfosheets()}, container=group7)
  font(b6) <- list(size=12)
  addSpring(group7)
  
  group8 <- ggroup(horizontal=TRUE, spacing= 0, container=group1)
  b7 <- gbutton(tl[8,la], handler = function(h, ...){.helpClimMob()}, container=group8)
  font(b7) <- list(size=12)
  addSpring(group8)
  
  #production version: when closing, empty workspace...
  addHandlerDestroy(w1, function(h, ...){rm(list = ls());dispose(w1)})
  visible(w1) <- TRUE
  #focus(w1) <- TRUE
  


}
