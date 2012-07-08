setClass(Class="Health",
         representation = representation(
           PPLFBD = "function",
           PPLFGD = "function",
           SBINFD = "function",
           TERIND = "function",
           DAMIND = "function",
           CUTIND = "function",
           SEVLT = "function",
           SEVR = "function", 
           WEED  = "function", 
           SEVRPT = "function",
           SEVRPM = "function",
           PPOSKD = "function",
           LVFOLD  = "function",
           NODEBR = "function",
           EARCUT  = "function"
  ),
  prototype = prototype(
           PPLFBD = approxfun(c(0, 365), c(0, 0)),
           PPLFGD = approxfun(c(0, 365), c(0, 0)),
           SBINFD = approxfun(c(0, 365), c(0, 0)),
           TERIND = approxfun(c(0, 365), c(0, 0)),
           DAMIND = approxfun(c(0, 365), c(0, 0)),
           CUTIND = approxfun(c(0, 365), c(0, 0)),
           SEVLT = approxfun(c(0, 365), c(0, 0)),
           SEVR = approxfun(c(0, 70, 80, 100, 110, 365), 
                            c(0,  0,  0,   0,   0,   0)), 
           WEED  = approxfun(c(0, 365), c(0, 0)),
           SEVRPT = approxfun(c(0, 0.01, 0.05,  0.1, 0.5,    1), 
                              c(0, 0.99, 0.85, 0.75, 0.5, 0.01)),
           SEVRPM = approxfun(c(0, 365), c(0, 0)),
           PPOSKD = approxfun(c(0, 365), c(0, 0)),
           LVFOLD  = approxfun(c(0, 365), c(0, 0)),
           NODEBR = approxfun(c(0, 365), c(0, 0)),
           EARCUT  = approxfun(c(0, 365), c(0, 0))
           ),
         
         validity = function(object)
         {
           TRUE
         }
         
    )
