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

.createInfosheets <- function(){
  
  if(!exists("myData", envir=.GlobalEnv)){
    
    gmessage("You should load the data and create a model first.", title="Error", icon="error")
    return()
    
  }
  
  if(!exists("rankingsVars", envir=.GlobalEnv)){
    
    gmessage("You should create a model first.", title="Error", icon="error")
    return()
    
  }
  
  myData <- get("myData")
  observeridVar <- get("observeridVar")
  itemsgivenVars <- get("itemsgivenVars")
  rankingsVars <- get("rankingsVars")
  explanatoryVars <- get("explanatoryVars")
  questionVar <- get("questionVar")
  questionsAnalyzed <- get("questionsAnalyzed")
  models <- get("models")
  
  w6 <- gwindow(title="ClimMob - Create info sheets", visible=FALSE, parent=c(1,1)) 
  size(w6) <- c(500,700)
  
  group2 <- ggroup(horizontal=FALSE, spacing=10, container=w6, expand=TRUE, use.scrollwindow = TRUE)
 
  ttitle <- glabel("Create info sheets", container=group2)
  font(ttitle) <- list(size=16)

  infoSheetTitle <- gexpandgroup("Info sheet title", container=group2, horizontal=FALSE)
  font(infoSheetTitle) <- list(size=12)
  glabel("Type the title:", container=infoSheetTitle)
  infoSheetTitletext <- gtext(text="Thank you for participating!", container=infoSheetTitle, width=2, height=1)
  size(infoSheetTitletext) <- c(250,40)
  visible(infoSheetTitle) <- FALSE
  
  infoSheetIntro <- gexpandgroup("General intro text", container=group2, horizontal=FALSE)
  font(infoSheetIntro) <- list(size=12)
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
  font(infoSheetItemnames) <- list(size=12)
  glabel("Type the intro text for this element:", container=infoSheetItemnames)
  infoSheetItemnamesIntrotext <- gtext("You received the following items to rank:", container=infoSheetItemnames)
  size(infoSheetItemnamesIntrotext) <- c(250,40)
  visible(infoSheetItemnames) <- FALSE
  
  infoSheetRanking <- gexpandgroup("Ranking", container=group2, horizontal=FALSE, expand=TRUE)
  font(infoSheetRanking) <- list(size=12)
  glabel("Type the intro text for this element:", container=infoSheetRanking)
  infoSheetRankingIntrotext <- gtext("You ranked these items in the following order:", container=infoSheetRanking)
  size(infoSheetRankingIntrotext) <- c(250,40)
  visible(infoSheetRanking) <- FALSE
  
  infoSheetPredictedRanking <- gexpandgroup("Predicted ranking", container=group2, horizontal=FALSE, expand=TRUE)
  font(infoSheetPredictedRanking) <- list(size=12)
  glabel("Type the intro text for this element:", container=infoSheetPredictedRanking)
  infoSheetPredictedRankingIntrotext <- gtext("The group of participants similar to you ranked these same items in the following order:", container=infoSheetPredictedRanking)
  size(infoSheetPredictedRankingIntrotext) <- c(250,40)
  visible(infoSheetPredictedRanking) <- FALSE
  
  infoSheetTop <- gexpandgroup("Top items", container=group2, horizontal=FALSE, expand=TRUE)
  font(infoSheetTop) <- list(size=12)
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
  font(infoSheetConclusion) <- list(size=12)
  glabel("Type the title:", container=infoSheetConclusion)
  infoSheetConclusiontext <- gtext(text="For more information, contact us at...", container=infoSheetConclusion, width=2, height=1)
  size(infoSheetConclusiontext) <- c(250,40)
  visible(infoSheetConclusion) <- FALSE
    
  gl1 <- glabel("File name:", container=group2)
  font(gl1) <- list(size=12)
  setfilenameIS <- gtext(text=".doc", container=group2, width=2, height=1)
  size(setfilenameIS) <- c(250,20)
    
  gl2 <- glabel("Select folder to write to:", container=group2)
  font(gl2) <- list(size=12)
  a <- gfilebrowse(text="Select folder to write to:", type="selectdir", container=group2)
  svalue(a) <- getwd()
  group3 <- ggroup(horizontal=TRUE, spacing=10, container=group2, expand=TRUE)
  addSpring(group3)
  
  flip <- function(x) as.logical((as.integer(x)-1/2) * -1 + 1/2) #TRUE -> FALSE, FALSE -> TRUE
  ne <- new.env()
  ne$isTitle <- FALSE
  ne$isIntro <- FALSE
  ne$isNames <- FALSE
  ne$isItemnames <- FALSE
  ne$isRanking <- FALSE
  ne$isPredictedRanking <- FALSE
  ne$isTop <- FALSE
  ne$isConclusion <- FALSE
  
  addHandlerChanged(infoSheetTitle, handler=function(h, ...){assign("isTitle", flip(ne$isTitle), envir=ne)})
  addHandlerChanged(infoSheetIntro, handler=function(h, ...){assign("isIntro", flip(ne$isIntro), envir=ne)})
  addHandlerChanged(infoSheetNames, handler=function(h, ...){assign("isNames", flip(ne$isNames), envir=ne)})
  addHandlerChanged(infoSheetItemnames, handler=function(h, ...){assign("isItemnames", flip(ne$isItemnames), envir=ne)})
  addHandlerChanged(infoSheetRanking, handler=function(h, ...){assign("isRanking", flip(ne$isRanking), envir=ne)})
  addHandlerChanged(infoSheetPredictedRanking, handler=function(h, ...){assign("isPredictedRanking", flip(ne$isPredictedRanking), envir=ne)})
  addHandlerChanged(infoSheetTop, handler=function(h, ...){assign("isTop", flip(ne$isTop), envir=ne)})
  addHandlerChanged(infoSheetConclusion, handler=function(h, ...){assign("isConclusion", flip(ne$isConclusion), envir=ne)})
 
  b <- gbutton("Create info sheets", handler = function(h, ...){
    
    pbar <- gprogressbar(value=10, container=gwindow(title="Writing..."))
    
    if(!is.na(questionVar)){myData <- myData[myData[,questionVar] %in% questionsAnalyzed,]}
    
    setwd(svalue(a))
    
    rtf <- RTF(svalue(setfilenameIS), font.size=14)
    setFontSize(rtf, font.size=14)
    addPng(rtf, system.file("external/ClimMob-logo.png", package="ClimMob"), width=3.9, height=1.9)
    addParagraph(rtf)
    addHeader(rtf, title="ClimMob info sheets")
    addParagraph(rtf, paste("Author:", Sys.info()[["user"]]))
    addParagraph(rtf, format(Sys.time(), "%H:%M:%S %a %b %d %Y "))
    addParagraph(rtf)
    
    
    IDs <- unique(as.character(myData[,observeridVar]))
 
    
    for(j in 1:length(IDs))
    {
      
      svalue(pbar) <- 10 + round((j/length(IDs)) * 89.99)
      iall <- which(IDs[j] == myData[,observeridVar])
      i <- iall[1]
      
      addPageBreak(rtf)
      
      itemTable <- cbind(itemsgivenVars, as.matrix(t(myData[i, itemsgivenVars])))
      colnames(itemTable) <- c("Item", "Name")
          
      if(ne$isTitle){addHeader(rtf, svalue(infoSheetTitletext), font.size=16)}
     
      addParagraph(rtf, "\n")
      
      if(ne$isNames){
      
        if(svalue(infoSheetNames1) != "None"){addText(rtf, paste("\\fs28", myData[i, svalue(infoSheetNames1)], sep=""))} 
  
        if(svalue(infoSheetNames2) != "None"){addText(rtf, paste(" ", myData[i, svalue(infoSheetNames2)], sep=""))} 
        
        if(svalue(infoSheetNames3) != "None"){addText(rtf, paste(" ", myData[i, svalue(infoSheetNames3)], sep=""))}
        
        addParagraph(rtf, "\n")
        
        if(svalue(infoSheetPlace1) != "None"){addParagraph(rtf, myData[i, svalue(infoSheetPlace1)])}
        
        if(svalue(infoSheetPlace2) != "None"){addParagraph(rtf, myData[i, svalue(infoSheetPlace2)])}
      
      } 
      addParagraph(rtf)
      
      if(ne$isIntro){
        
        addParagraph(rtf, svalue(infoSheetIntrotext))
        addParagraph(rtf) 
      
      }
      
      if(ne$isItemnames){
        
        addParagraph(rtf, svalue(infoSheetItemnamesIntrotext)) 
        addTable(rtf, itemTable)
        addParagraph(rtf, "\n") 
      
      }
      
      if(ne$isRanking){
      
        addParagraph(rtf, svalue(infoSheetRankingIntrotext)) 
        rankingTable <- myData[iall,rankingsVars]
        rankingTable <- t(apply(rankingTable, 1, function(x) return(itemTable[order(x),2])))
        colnames(rankingTable) <- rankingsVars
        if(length(iall)>1 & !is.na(questionVar)) rankingTable <- cbind(myData[iall,questionVar], rankingTable)
        colnames(rankingTable)[1] <- questionVar
        addTable(rtf, rankingTable)
        addParagraph(rtf, "\n")
        
      }
      
      if(ne$isPredictedRanking || ne$isTop){
        
        pred <- NULL
        for(ii in 1:length(iall)){ 
          
          rankii <- .predict.bttree(models[[ii]], newdata = myData[iall[ii],], type = "rank")
          predii <- colnames(rankii)[order(rankii)]
          pred <- rbind(pred, predii)
          
        }                
            
      }
      
      if(ne$isPredictedRanking){
        
        addParagraph(rtf, svalue(infoSheetPredictedRankingIntrotext))
        
        predGiven <- t(apply(pred, 1, function(x) x[x %in% as.character(t(myData[i, itemsgivenVars]))]))
        colnames(predGiven) <- rankingsVars
        rownames(predGiven) <- NULL
        if(!is.na(questionVar)){
          
          predGiven <- cbind(as.character(myData[iall,questionVar]), predGiven)
          colnames(predGiven)[1] <- questionVar    
        
        }
          
        addTable(rtf, predGiven)
        addParagraph(rtf)
      
      }
      
      if(ne$isTop){
      
        addParagraph(rtf, svalue(infoSheetTopIntrotext)) 
        
        topTable <- pred[,1:svalue(infoSheetTopX),drop=FALSE]
        colnames(topTable) <- paste(1:svalue(infoSheetTopX), ".", sep="")
        rownames(topTable) <- NULL
        if(!is.na(questionVar)){
          
          topTable <- cbind(as.character(myData[iall,questionVar]), topTable)
          colnames(topTable)[1] <- questionVar    
          
        }
        addTable(rtf, topTable)
        addParagraph(rtf)
      
      }
      
      if(ne$isConclusion){
      
        addParagraph(rtf, svalue(infoSheetConclusiontext)) 
      
      } 
      
    }
    

    done(rtf)
    dispose(pbar)
    gmessage(paste("Info sheets written to ", getwd(), sep=""), title="Done", icon="info")
    dispose(w6)
    
  }, container=group3)

  visible(w6) <- TRUE
  
}