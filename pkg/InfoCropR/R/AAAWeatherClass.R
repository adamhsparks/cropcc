# Weather
setClass(Class="WeatherClass",
         
         representation = representation(
           
           LAT    = "numeric",  
           YEAR   = "integer",
           DOY    = "integer",
           RDD    = "numeric",
           TMMN   = "numeric",
           TMMX   = "numeric",
           VP     = "numeric",
           WN     = "numeric",
           RAIN   = "numeric",
           DINDEX = "numeric"
         ),
         
         prototype = prototype(
           
           LAT    = 30.9,    #*******************     # Latitude *****TEMPORAL, MUST BE READ!!!
           YEAR   = as.integer(rep(2000, times=365)), # Year
           DOY    = as.integer(1:365),                # Day of year
           RDD    = rep(1, times=365),                # Irradiance       [kJ/m2]
           TMMN   = rep(15, times=365),               # Min Temp.        [oC]
           TMMX   = rep(30, times=365),               # Max Temp.        [oC]
           VP     = rep(1, times=365),                # Early Morning VP [kPa] 
           WN     = rep(0, times=365),                # Mean Wind Speed  [m/s]
           RAIN   = rep(10, times=365),               # Precipitation    [mm/dia]
           DINDEX = as.integer(10957:11322)           # Index of day, origin 1970-01-01
         ),
         
         validity = function(object)
         {
            n     <- length(YEAR)
            cond1 <- length(DOY)    == n
            cond2 <- length(RDD)    == n
            cond3 <- length(TMMN)   == n
            cond4 <- length(TMMX)   == n
            cond5 <- length(VP)     == n
            cond6 <- length(WN)     == n
            cond7 <- length(RAIN)   == n
            cond8 <- length(DINDEX) == n
            return(cond1 & cond2 & cond3 & cond4 & cond5 & cond6 & cond7 & cond8)
         }
         
)