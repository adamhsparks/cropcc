# ---------------------------------------------------------
# Function AFGEN: Performs a linear interpolation between 
#                 the two closest points to a given number.
# vector_data: {x1,y1, x2,y2, x3,y3,..., xn,yn}
AFGEN <- function(vector_data, number)
{
   n <- length(vector_data)
   pair<-seq(2,n,2)
   odd<-seq(1,n,2)
   AFGEN <- approx(vector_data[odd],vector_data[pair],number)$y
   return(AFGEN)   
}
# ---------------------------------------------------------

# ---------------------------------------------------------
# Function INSW: Evaluate the condition of negativity in X
#                and assigns the value y1, or y2 otherwise.
INSW <- function(x,y1,y2)
{
   ifelse(x<0,INSW<-y1,INSW<-y2)
   return(INSW)
}
# ---------------------------------------------------------

# ---------------------------------------------------------
# Function LIMIT: Y equals X, but limited between xl and xh.
LIMIT <- function(xl, xh, x)
{
   ifelse(x<=xl,LIMIT<-xl,ifelse(x>=xh,LIMIT<-xh,LIMIT<-x))
   return(LIMIT)
}
# ---------------------------------------------------------

# ---------------------------------------------------------
# Function NOTNUL: Y equals x, if x is not null, or 1 otherwise.
NOTNUL <- function(x)
{
   ifelse(x!=0,NOTNUL<-x,NOTNUL<-1)
   return(NOTNUL)
}
# ---------------------------------------------------------

# ---------------------------------------------------------
# Function REAAND: Returns 1 if both input values are positive,
#                  or 0 otherwise.
REAAND <- function(x1,x2)
{
   ifelse((x1>0 & x2>0),REAAND<-1,REAAND<-0)
   return(REAAND)
}
# ---------------------------------------------------------

# # ---------------------------------------------------------
# # Function INTGRL: Approximation of the integral function, 
# #                  by finite difference in a single step.
# #                  yi: Initial value of the function,
# #                  yr: Rate of change of the function (dy/dx)
# INTGRL <- function(yi,yr)
# {
#    INTGRL <- yi+yr
#    return(INTGRL)
# }
# # ---------------------------------------------------------

# ---------------------------------------------------------
# Function AMAX1: Returns the maximum value between the arguments.
AMAX1 <- function(...)
{
   AMAX1 <- pmax(...)
   return(AMAX1)
}
# ---------------------------------------------------------

# ---------------------------------------------------------
# Fucntion AMIN1: Returns the minimum value between the arguments.
AMIN1 <- function(...)
{
   AMIN1 <- pmin(...)
   return(AMIN1)
}
# ---------------------------------------------------------