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
  
  la <- get("la")
  tl <- as.matrix(read.delim(system.file("external/MultilanguageMakeInfoSheets.txt", package="ClimMob"), header=FALSE))
  colnames(tl) <- NULL
   
  myData <- get("myData")
  observeridVar <- get("observeridVar")
  itemsgivenVars <- get("itemsgivenVars")
  rankingsVars <- get("rankingsVars")
  explanatoryVars <- get("explanatoryVars")
  questionVar <- get("questionVar")
  questionsAnalyzed <- get("questionsAnalyzed")
  models <- get("models")
  
  w6 <- gwindow(title=tl[1,la], visible=FALSE, parent=c(1,1)) 
  size(w6) <- c(500,700)
  
  group2 <- ggroup(horizontal=FALSE, spacing=10, container=w6, expand=TRUE, use.scrollwindow = TRUE)
 
  ttitle <- glabel(tl[2,la], container=group2)
  font(ttitle) <- list(size=16)

  infoSheetTitle <- gexpandgroup(tl[3,la], container=group2, horizontal=FALSE)
  font(infoSheetTitle) <- 16
  glabel(tl[4,la], container=infoSheetTitle)
  infoSheetTitletext <- gtext(text=tl[5,la], container=infoSheetTitle, width=2, height=1)
  size(infoSheetTitletext) <- c(250,40)
  visible(infoSheetTitle) <- FALSE
  
  infoSheetIntro <- gexpandgroup(tl[6,la], container=group2, horizontal=FALSE)
  font(infoSheetIntro) <- 12
  glabel(tl[9,la], container=infoSheetIntro)
  infoSheetIntrotext <- gtext(text=tl[7,la], container=infoSheetIntro, width=2, height=1)
  size(infoSheetIntrotext) <- c(250,40)
  visible(infoSheetIntro) <- FALSE
  
  infoSheetNames <- gexpandgroup(tl[8,la], container=group2, horizontal=FALSE, expand=TRUE)
  
  glabel(tl[10,la], container=infoSheetNames)
  group6 <- ggroup(horizontal=TRUE, container= infoSheetNames)
  infoSheetNames1 <- gcombobox(c(tl[11,la], colnames(myData)), selected = 1, editable = FALSE, container=group6)
  addSpring(group6)
  
  glabel(tl[12,la], container=infoSheetNames)
  group4 <- ggroup(horizontal=TRUE, container= infoSheetNames)
  infoSheetNames2 <- gcombobox(c(tl[11,la], colnames(myData)), selected = 1, editable = FALSE, container=group4)
  addSpring(group4)
  
  glabel(tl[13,la], container=infoSheetNames)
  group5 <- ggroup(horizontal=TRUE, container= infoSheetNames)
  infoSheetNames3 <- gcombobox(c(tl[11,la], colnames(myData)), selected = 1, editable = FALSE, container=group5)
  addSpring(group5)
  
  glabel(tl[14,la], container=infoSheetNames)
  group7 <- ggroup(horizontal=TRUE, container= infoSheetNames)
  infoSheetPlace1 <- gcombobox(c(tl[11,la], colnames(myData)), selected = 1, editable = FALSE, container=group7)
  addSpring(group7)
  
  glabel(tl[15,la], container=infoSheetNames)
  group8 <- ggroup(horizontal=TRUE, container= infoSheetNames)
  infoSheetPlace2 <- gcombobox(c(tl[11,la], colnames(myData)), selected = 1, editable = FALSE, container=group8)
  addSpring(group8)
  
  visible(infoSheetNames) <- FALSE
  
  infoSheetItemnames <- gexpandgroup(tl[16,la], container=group2, horizontal=FALSE, expand=TRUE)
  font(infoSheetItemnames) <- list(size=12)
  glabel(tl[17,la], container=infoSheetItemnames)
  infoSheetItemnamesIntrotext <- gtext(tl[18,la], container=infoSheetItemnames)
  size(infoSheetItemnamesIntrotext) <- c(250,40)
  visible(infoSheetItemnames) <- FALSE
  
  infoSheetRanking <- gexpandgroup(tl[19,la], container=group2, horizontal=FALSE, expand=TRUE)
  font(infoSheetRanking) <- list(size=12)
  glabel(tl[20,la], container=infoSheetRanking)
  infoSheetRankingIntrotext <- gtext(tl[21], container=infoSheetRanking)
  size(infoSheetRankingIntrotext) <- c(250,40)
  visible(infoSheetRanking) <- FALSE
  
  infoSheetPredictedRanking <- gexpandgroup(tl[22,la], container=group2, horizontal=FALSE, expand=TRUE)
  font(infoSheetPredictedRanking) <- list(size=12)
  glabel(tl[23,la], container=infoSheetPredictedRanking)
  infoSheetPredictedRankingIntrotext <- gtext(tl[24,la], container=infoSheetPredictedRanking)
  size(infoSheetPredictedRankingIntrotext) <- c(250,40)
  visible(infoSheetPredictedRanking) <- FALSE
  
  infoSheetTop <- gexpandgroup(tl[25,la], container=group2, horizontal=FALSE, expand=TRUE)
  font(infoSheetTop) <- list(size=12)
  glabel(tl[26,la], container=infoSheetTop)
  infoSheetTopIntrotext <- gtext(tl[27,la], container=infoSheetTop)
  size(infoSheetTopIntrotext) <- c(250,40)

  glabel(tl[28,la], container=infoSheetTop)
  group3 <- ggroup(horizontal=TRUE, container= infoSheetTop)
  infoSheetTopX <- gcombobox(1:10, selected = 3, editable = FALSE, container=group3)
  addSpring(group3)
  #TODO max n.

  visible(infoSheetTop) <- FALSE
  
  infoSheetConclusion <- gexpandgroup(tl[29,la], container=group2, horizontal=FALSE)
  font(infoSheetConclusion) <- list(size=12)
  glabel(tl[30,la], container=infoSheetConclusion)
  infoSheetConclusiontext <- gtext(text=tl[31,la], container=infoSheetConclusion, width=2, height=1)
  size(infoSheetConclusiontext) <- c(250,40)
  visible(infoSheetConclusion) <- FALSE
    
  gl1 <- glabel(tl[32,la], container=group2)
  font(gl1) <- list(size=12)
  setfilenameIS <- gtext(text=".doc", container=group2, width=2, height=1)
  size(setfilenameIS) <- c(250,20)
    
  gl2 <- glabel(tl[33,la], container=group2)
  font(gl2) <- list(size=12)
  a <- gfilebrowse(text=tl[33,la], type="selectdir", container=group2)
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
 
  b <- gbutton(tl[34,la], handler = function(h, ...){
    
    gw7 <- gwindow(tl[35,la])
    pbar <- gprogressbar(value=10, container=gw7)
    size(gw7) <- c(200,20)
    
    if(!is.na(questionVar)){myData <- myData[myData[,questionVar] %in% questionsAnalyzed,]}
    
    setwd(svalue(a))
    
    rtf <- RTF(svalue(setfilenameIS), font.size=14)
    setFontSize(rtf, font.size=14)
    addPng(rtf, system.file("external/ClimMob-logo.png", package="ClimMob"), width=3.9, height=1.9)
    addParagraph(rtf)
    addHeader(rtf, title=tl[36,la])
    addParagraph(rtf, paste(tl[37,la], Sys.info()[["user"]]))
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
      colnames(itemTable) <- c(tl[38,la], tl[39,la])
          
      if(ne$isTitle){addHeader(rtf, svalue(infoSheetTitletext), font.size=16)}
     
      addParagraph(rtf, "\n")
      
      if(ne$isNames){
      
        if(svalue(infoSheetNames1) != tl[11,la]){addText(rtf, paste("\\fs28", myData[i, svalue(infoSheetNames1)], sep=""))} 
  
        if(svalue(infoSheetNames2) != tl[11,la]){addText(rtf, paste(" ", myData[i, svalue(infoSheetNames2)], sep=""))} 
        
        if(svalue(infoSheetNames3) != tl[11,la]){addText(rtf, paste(" ", myData[i, svalue(infoSheetNames3)], sep=""))}
        
        addParagraph(rtf, "\n")
        
        if(svalue(infoSheetPlace1) != tl[11,la]){addParagraph(rtf, myData[i, svalue(infoSheetPlace1)])}
        
        if(svalue(infoSheetPlace2) != tl[11,la]){addParagraph(rtf, myData[i, svalue(infoSheetPlace2)])}
      
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
        if(length(iall)>1 & !is.na(questionVar)) rankingTable <- cbind(as.character(myData[iall,questionVar]), rankingTable)
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
    gmessage(paste(tl[40,la], getwd(), sep=""), title=tl[41,la], icon="info")
    dispose(w6)
    
  }, container=group3)

  visible(w6) <- TRUE
  
}