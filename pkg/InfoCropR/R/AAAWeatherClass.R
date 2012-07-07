#Weather
setClass(Class="Weather",
         representation = representation(
           Year = "integer",
           Day = "integer",
           Irradiance = "numeric",
           Tmin = "numeric",
           Tmax = "numeric",
           VapourPressure = "numeric",
           WindSpeed = "numeric",
           Precipitation = "numeric"
         ),
         prototype = prototype(
           Year = as.integer(rep(2000, times=365)),
           Day = as.integer(1:365),
           Irradiance = rep(1, times=365),
           Tmin = rep(15, times=365),
           Tmax = rep(30, times=365),
           VapourPressure = rep(1, times=365),
           WindSpeed = rep(0, times=365),
           Precipitation = rep(10, times=365)
         ),
         validity = function(object)
         {
            n <- length(Year)
            cond1 <- length(Day) == n
            cond2 <-length(Irradiance) == n
            cond3 <-length(Tmin) == n
            cond4 <-length(Tmax) == n
            cond5 <-length(VapourPressure) == n
            cond6 <-length(WindSpeed) == n
            cond7 <-length(Precipitation) == n
            return(cond1 & cond2 & cond3 & cond4 & cond5 & cond6 & cond7)
         }
         
)