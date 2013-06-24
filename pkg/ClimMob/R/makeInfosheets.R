##Function by Achim Zeileis and Jacob van Etten

.predict.bttree <- function(object, newdata = NULL,
                            type = c("worth", "rank", "node"), ...) {
  type <- match.arg(type)
  
  ## get nodes
  nodes <- predict(object$mob, newdata = newdata, type = "node", ...)
  if(type == "node") return(nodes)
  
  ## get worth
  w <- worth(object)
  w <- w[as.character(nodes), , drop = FALSE]

  if(type == "worth") return(w)

  ## get rank
  o <- t(apply(-w, 1, rank))

  return(o)
}

createInfosheets <- function(){
  
  if(!exists("myData", envir=.GlobalEnv)){
    
    gmessage("You should load the data and create a model first.", title="Error", icon="error")
    return()
    
  }
  
  if(!exists("rankingsVars", envir=.GlobalEnv)){
    
    gmessage("You should create a model first.", title="Error", icon="error")
    return()
    
  }
  
  w6 <- gwindow(title="ClimMob - Create info sheets", visible=FALSE, parent=c(1,1)) 
  size(w6) <- c(500,700)
  
  group2 <- ggroup(horizontal=FALSE, spacing=10, container=w6, expand=TRUE, use.scrollwindow = TRUE)
 
  ttitle <- glabel("Create info sheets", container=group2)
  font(ttitle) <- list(size=16)
  
  glabel("The info sheets will be generated from the data and model currently loaded in memory.", container=group2)
  glabel("Select the elements to include and specify any options.", container=group2)
  
  infoSheetTitle <- gexpandgroup("Info sheet title", container=group2, horizontal=FALSE)
  glabel("Type the title:", container=infoSheetTitle)
  infoSheetTitletext <- gtext(text="Thank you for participating!", container=infoSheetTitle, width=2, height=1)
  size(infoSheetTitletext) <- c(250,40)
  visible(infoSheetTitle) <- FALSE
  
  infoSheetIntro <- gexpandgroup("General intro text", container=group2, horizontal=FALSE)
  glabel("Type the text:", container=infoSheetIntro)
  infoSheetIntrotext <- gtext(text="These are the results of the experiment you contributed to.", container=infoSheetIntro, width=2, height=1)
  size(infoSheetIntrotext) <- c(250,40)
  visible(infoSheetIntro) <- FALSE
  
  infoSheetNames <- gexpandgroup("Participant name and place", container=group2, horizontal=FALSE, expand=TRUE)
  
  glabel("Select the column in your data for the first name element (Madam/Sir):", container=infoSheetNames)
  group6 <- ggroup(horizontal=TRUE, container= infoSheetNames)
  infoSheetNames1 <- gcombobox(c("None", colnames(myData)), selected = 1, editable = FALSE, container=group6)
  addSpring(group6)
  
  glabel("Select the column in your data for the second name element (given name):", container=infoSheetNames)
  group4 <- ggroup(horizontal=TRUE, container= infoSheetNames)
  infoSheetNames2 <- gcombobox(c("None", colnames(myData)), selected = 1, editable = FALSE, container=group4)
  addSpring(group4)
  
  glabel("Select the column in your data for the third name element (family name):", container=infoSheetNames)
  group5 <- ggroup(horizontal=TRUE, container= infoSheetNames)
  infoSheetNames3 <- gcombobox(c("None", colnames(myData)), selected = 1, editable = FALSE, container=group5)
  addSpring(group5)
  
  glabel("Select the column in your data for the first place element (village):", container=infoSheetNames)
  group7 <- ggroup(horizontal=TRUE, container= infoSheetNames)
  infoSheetPlace1 <- gcombobox(c("None", colnames(myData)), selected = 1, editable = FALSE, container=group7)
  addSpring(group7)
  
  glabel("Select the column in your data for the second place element (district):", container=infoSheetNames)
  group8 <- ggroup(horizontal=TRUE, container= infoSheetNames)
  infoSheetPlace2 <- gcombobox(c("None", colnames(myData)), selected = 1, editable = FALSE, container=group8)
  addSpring(group8)
  
  visible(infoSheetNames) <- FALSE
  
  infoSheetItemnames <- gexpandgroup("Item names", container=group2, horizontal=FALSE, expand=TRUE)
  glabel("Type the intro text for this element:", container=infoSheetItemnames)
  infoSheetItemnamesIntrotext <- gtext("You received the following items to rank:", container=infoSheetItemnames)
  size(infoSheetItemnamesIntrotext) <- c(250,40)
  visible(infoSheetItemnames) <- FALSE
  
  infoSheetRanking <- gexpandgroup("Ranking", container=group2, horizontal=FALSE, expand=TRUE)
  glabel("Type the intro text for this element:", container=infoSheetRanking)
  infoSheetRankingIntrotext <- gtext("You ranked these items in the following order:", container=infoSheetRanking)
  size(infoSheetRankingIntrotext) <- c(250,40)
  visible(infoSheetRanking) <- FALSE
  
  infoSheetPredictedRanking <- gexpandgroup("Predicted ranking", container=group2, horizontal=FALSE, expand=TRUE)
  glabel("Type the intro text for this element:", container=infoSheetPredictedRanking)
  infoSheetPredictedRankingIntrotext <- gtext("The group of participants similar to you ranked these same items in the following order:", container=infoSheetPredictedRanking)
  size(infoSheetPredictedRankingIntrotext) <- c(250,40)
  visible(infoSheetPredictedRanking) <- FALSE
  
  infoSheetTop <- gexpandgroup("Top items", container=group2, horizontal=FALSE, expand=TRUE)
  glabel("Type the intro text for this element:", container=infoSheetTop)
  infoSheetTopIntrotext <- gtext("The group of participants similar to you ranked as the best out of all items:", container=infoSheetTop)
  size(infoSheetTopIntrotext) <- c(250,40)

  glabel("Number of highest ranking items to be shown:", container=infoSheetTop)
  group3 <- ggroup(horizontal=TRUE, container= infoSheetTop)
  infoSheetTopX <- gcombobox(1:10, selected = 3, editable = FALSE, container=group3)
  addSpring(group3)
  #TODO max n.

  visible(infoSheetTop) <- FALSE
  
  infoSheetConclusion <- gexpandgroup("Concluding message", container=group2, horizontal=FALSE)
  glabel("Type the title:", container=infoSheetConclusion)
  infoSheetConclusiontext <- gtext(text="For more information, contact us at...", container=infoSheetConclusion, width=2, height=1)
  size(infoSheetConclusiontext) <- c(250,40)
  visible(infoSheetConclusion) <- FALSE
    
  glabel("File name:", container=group2)
  setfilenameIS <- gtext(text=".doc", container=group2, width=2, height=1)
  size(setfilenameIS) <- c(250,20)
    
  glabel("Select folder to write to:", container=group2)
  a <- gfilebrowse(text="Select folder to write to:", type="selectdir", container=group2)
  svalue(a) <- getwd()
  group3 <- ggroup(horizontal=TRUE, spacing=10, container=group2, expand=TRUE)
  addSpring(group3)

  b <- gbutton("Create info sheets", handler = function(h, ...){
    
    if(!is.na(questionVar)){myData <- .GlobalEnv$myData[.GlobalEnv$myData[,.GlobalEnv$questionVar] == .GlobalEnv$questionsAnalyzed,]}
    
    setwd(svalue(a))
    
    rtf <- RTF(svalue(setfilenameIS), font.size=14)
    setFontSize(rtf, font.size=14)
    addPng(rtf, system.file("external/ClimMob-logo.png", package="ClimMob"), width=3.9, height=1.9)
    addParagraph(rtf)
    addHeader(rtf, title="ClimMob info sheets")
    addParagraph(rtf, paste("Author:", Sys.info()[["user"]]))
    addParagraph(rtf, format(Sys.time(), "%H:%M:%S %a %b %d %Y "))
    addParagraph(rtf)
    
    addPageBreak(rtf)
    
    IDs <- unique(as.character(myData[,observeridVar]))
    
    j <- 1 
    
    #for(j in 1:length(IDs)){
        
    iall <- which(IDs[j] == myData[,observeridVar])
    i <- iall[1]
        
    if(!is.null(visible(infoSheetTitle))){addHeader(rtf, svalue(infoSheetTitletext), font.size=16)}
    addNewLine(rtf)
    
    if(!is.null(visible(infoSheetNames))){
    
      if(svalue(infoSheetNames1) != "None"){addText(rtf, paste("\\fs28", myData[i, svalue(infoSheetNames1)], sep=""))} 

      if(svalue(infoSheetNames2) != "None"){addText(rtf, paste(" ", myData[i, svalue(infoSheetNames2)], sep=""))} 
      
      if(svalue(infoSheetNames3) != "None"){addText(rtf, paste(" ", myData[i, svalue(infoSheetNames3)], sep=""))}
      
      addNewLine(rtf)
      
      if(svalue(infoSheetPlace1) != "None"){addParagraph(rtf, myData[i, svalue(infoSheetPlace1)])}
      
      if(svalue(infoSheetPlace2) != "None"){addParagraph(rtf, myData[i, svalue(infoSheetPlace2)])}
    
    } 
    addParagraph(rtf)
    
    if(!is.null(visible(infoSheetIntro))){
      
      addParagraph(rtf, svalue(infoSheetIntrotext))
      addParagraph(rtf) 
    
    }
    
    if(!is.null(visible(infoSheetItemnames))){
      
      addParagraph(rtf, svalue(infoSheetItemnamesIntrotext)) 
      addParagraph(rtf)
      itemTable <- cbind(itemsgivenVars, as.matrix(t(myData[i, itemsgivenVars])))
      colnames(itemTable) <- c("Item", "Name")
      addTable(rtf, itemTable)
      addParagraph(rtf) 
    
    }
    
    if(!is.null(visible(infoSheetRanking))){
    
      addParagraph(rtf, svalue(infoSheetRankingIntrotext)) 
      addParagraph(rtf)
      rankingTable <- myData[iall,rankingsVars]
      rankingTable <- t(apply(rankingTable, 1, function(x) return(itemTable[x,2])))
      colnames(rankingTable) <- rankingsVars
      if(length(iall)>1 & !is.na(questionVar)) rankingTable <- cbind(myData[iall,questionVar], rankingTable)
      addTable(rtf, rankingTable)
      addParagraph(rtf)
      
    }
    
    if(!is.null(visible(infoSheetPredictedRanking) | !is.null(visible(infoSheetTop)))){
      
      pred <- NULL
      for(ii in 1:length(iall)){ 
        
        rankii <- .predict.bttree(.GlobalEnv$models[[ii]], newdata = myData[iall[ii],], type = "rank")
        predii <- names(rankii)[order(rankii)]
        pred <- rbind(pred, predii)
        
      }                
      rownames(pred) <- myData[iall,questionVar]
    
    }
    
    if(!is.null(visible(infoSheetPredictedRanking))){
      
      addParagraph(rtf, svalue(infoSheetPredictedRankingIntrotext))
      
      predGiven <- t(apply(pred, 1, function(x) x[x %in% as.character(t(myData[i, itemsgivenVars]))]))
      
      if(is.vector(predGiven)) predGiven <- t(as.matrix(predGiven))
      
      addTable(rtf, predGiven, row.names=TRUE)
      addParagraph(rtf)
    
    }
    
    if(!is.null(visible(infoSheetTop))){
    
      addParagraph(rtf, svalue(infoSheetTopIntrotext)) 
      addParagraph(rtf)
      
      #svalue(infoSheetTopX)
      addParagraph(rtf)
    
    }
    
    addParagraph(rtf, svalue(infoSheetConclusiontext)) 
    
    done(rtf)
    
    gmessage(paste("File ", svalue(setfilenameIS), " written to ", getwd(), sep=""), title="Done", icon="info")
    
  }, container=group3)
  
  visible(w6) <- TRUE
  
}