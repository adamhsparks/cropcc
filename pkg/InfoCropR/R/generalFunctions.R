# ---------------------------------------------------------
# Function AFGEN: Performs a linear interpolation between 
#                 the two closest points to a given number.
# vector_data: {x1,y1, x2,y2, x3,y3,..., xn,yn}
AFGEN <- function(vector_data, number)
{
   n <- length(vector_data)
   pair<-seq(2, n, 2)
   odd<-seq(1, n, 2)
   A <- approx(vector_data[odd], vector_data[pair], number)$y
   return(A)   
}
# ---------------------------------------------------------

# ---------------------------------------------------------
# Function INSW: Evaluate the condition of negativity in X
#                and assigns the value y1, or y2 otherwise.
INSW <- function(x, y1, y2)
{
   I <- ifelse(x<0, y1, y2)
   return(I)
}
# ---------------------------------------------------------

# ---------------------------------------------------------
# Function LIMIT: Y equals X, but limited between xl and xh.
LIMIT <- function(xl, xh, x)
{
   L <- ifelse(x<=xl, xl, ifelse(x>=xh, xh, x))
   return(L)
}
# ---------------------------------------------------------

# ---------------------------------------------------------
# Function NOTNUL: Y equals x, if x is not null, or 1 otherwise.
NOTNUL <- function(x)
{
   N <- ifelse(x!=0, x, 1)
   return(N)
}
# ---------------------------------------------------------

# ---------------------------------------------------------
# Function REAAND: Returns 1 if both input values are positive,
#                  or 0 otherwise.
REAAND <- function(x1, x2)
{
   R <- ifelse((x1>0 & x2>0), 1, 0)
   return(R)
}
# ---------------------------------------------------------

# ---------------------------------------------------------
# Function AMAX1: Returns the maximum value between the arguments.
AMAX1 <- function(...)
{
   A <- max(...)
   return(A)
}
# ---------------------------------------------------------

# ---------------------------------------------------------
# Fucntion AMIN1: Returns the minimum value between the arguments.
AMIN1 <- function(...)
{
   A <- min(...)
   return(A)
}
# ---------------------------------------------------------

# ---------------------------------------------------------
# Function PLOT_TABFUN: Plot Tabular Functions 
# vector_data: {x1,y1, x2,y2, x3,y3,..., xn,yn}
PLOT_TABFUN <- function(vector_data, name)
{
  n <- length(vector_data)
  pair<-seq(2, n, 2)
  odd<-seq(1, n, 2)
  plot(vector_data[odd], vector_data[pair], type="b", main=name, xlab="x", ylab="y")
  return(vector_data)
}
# ------ UREAP1 = c(0,60, 1,0, 20,0, 21,60, 22,0, 34,0, 35,0, 36,0, 59,0, 60,0, 61,0, 365,0)
# ------ PLOT_TABFUN(UREAP1,"UREAP1")
# --------------------------------------------------------