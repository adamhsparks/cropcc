library(weatherData)
library(maps)
library(geonames)

data(stations)
#setwd("")

# get crop data
trial <- read.csv(system.file("external/trialsCA.csv", package="cropData"))
locs <- read.csv(system.file("external/locationsCA.csv", package="cropData"))

# use geonames server to get altitude data for trial locations
for(i in 1:dim(locs)[1]) {locs$ALT[i] <- GNsrtm3(locs$LAT[i],locs$LON[i])[1]}

# select weather stations
stations <- stations[!is.na(stations$ALT),]
stationsSelected <- stationsExtent(c(-100,-60,0,25), stations)

# visualize
plot(stationsSelected[c("LON","LAT")], pch=3, cex=.5)
points(locs[c("LON","LAT")], pch=15)
map("world",add=TRUE, interior=F)

#weatherCA <- downloadGSOD(2003, 2005, stations = stationsSelected, silent = TRUE, tries = 2, localdir = NULL) #can be omitted second time
#weatherCA <- makeTableGSOD(weatherCA) #can be replaced by following line second time
weatherCA <- makeTableGSOD()
weatherCA <- na.omit(weatherCA)

# interpolate thermal stress by year
ipW2003 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2003-5-15", "2003-9-25", stations = stationsSelected)
ipW2004 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2004-5-15", "2004-9-25", stations = stationsSelected)
ipW2005 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2005-5-15", "2005-9-25", stations = stationsSelected)

START <- paste(trial$Year, "5-15", sep="-")
END <- paste(trial$Year, "9-25", sep="-")
TEMPSTRESS30 <- rep(NA, times=dim(trial)[1])
TEMPSTRESS35 <- rep(NA, times=dim(trial)[1])
TEMPSTRESS40 <- rep(NA, times=dim(trial)[1])

trial <- cbind(trial, START, END, TEMPSTRESS30, TEMPSTRESS35, TEMPSTRESS40)

trial[trial$Year == 2003,"TEMPSTRESS30"] <- thermalStressSeasonal(30, ipW2003, trial[trial$Year == 2003,], locs)
trial[trial$Year == 2004,"TEMPSTRESS30"] <- thermalStressSeasonal(30, ipW2004, trial[trial$Year == 2004,], locs)
trial[trial$Year == 2005,"TEMPSTRESS30"] <- thermalStressSeasonal(30, ipW2005, trial[trial$Year == 2005,], locs)

trial[trial$Year == 2003,"TEMPSTRESS35"] <- thermalStressSeasonal(35, ipW2003, trial[trial$Year == 2003,], locs)
trial[trial$Year == 2004,"TEMPSTRESS35"] <- thermalStressSeasonal(35, ipW2004, trial[trial$Year == 2004,], locs)
trial[trial$Year == 2005,"TEMPSTRESS35"] <- thermalStressSeasonal(35, ipW2005, trial[trial$Year == 2005,], locs)

trial[trial$Year == 2003,"TEMPSTRESS40"] <- thermalStressSeasonal(40, ipW2003, trial[trial$Year == 2003,], locs)
trial[trial$Year == 2004,"TEMPSTRESS40"] <- thermalStressSeasonal(40, ipW2004, trial[trial$Year == 2004,], locs)
trial[trial$Year == 2005,"TEMPSTRESS40"] <- thermalStressSeasonal(40, ipW2005, trial[trial$Year == 2005,], locs)

# precipitation
PrecTotal <- rep(NA, times=dim(trial)[1])
PrecCV <- rep(NA, times=dim(trial)[1])
Prec40 <- rep(NA, times=dim(trial)[1])
Prec40CV <- rep(NA, times=dim(trial)[1])
trial <- data.frame(trial, PrecTotal, PrecCV, Prec40, Prec40CV)
cv <- function(x) sd(x) / mean(x)

trial[trial$Year == 2003,"PrecTotal"] <- tapply(ipW2003$PRCP, ipW2003$ID, FUN = sum)[as.integer(trial$ID[trial$Year == 2003])]
trial[trial$Year == 2004,"PrecTotal"] <- tapply(ipW2004$PRCP, ipW2004$ID, FUN = sum)[as.integer(trial$ID[trial$Year == 2004])]
trial[trial$Year == 2005,"PrecTotal"] <- tapply(ipW2005$PRCP, ipW2005$ID, FUN = sum)[as.integer(trial$ID[trial$Year == 2005])]

trial[trial$Year == 2003,"PrecCV"] <- tapply(ipW2003$PRCP, ipW2003$ID, FUN = cv)[as.integer(trial$ID[trial$Year == 2003])]
trial[trial$Year == 2004,"PrecCV"] <- tapply(ipW2004$PRCP, ipW2004$ID, FUN = cv)[as.integer(trial$ID[trial$Year == 2004])]
trial[trial$Year == 2005,"PrecCV"] <- tapply(ipW2005$PRCP, ipW2005$ID, FUN = cv)[as.integer(trial$ID[trial$Year == 2005])]

index2003 <- as.numeric(as.vector(ipW2003$moda)) < 700
index2004 <- as.numeric(as.vector(ipW2004$moda)) < 700
index2005 <- as.numeric(as.vector(ipW2005$moda)) < 700

trial[trial$Year == 2003,"Prec40"] <- tapply(ipW2003$PRCP[index2003], ipW2003$ID[index2003], FUN = sum)[as.integer(trial$ID[trial$Year == 2003])]
trial[trial$Year == 2004,"Prec40"] <- tapply(ipW2004$PRCP[index2004], ipW2004$ID[index2004], FUN = sum)[as.integer(trial$ID[trial$Year == 2004])]
trial[trial$Year == 2005,"Prec40"] <- tapply(ipW2005$PRCP[index2005], ipW2005$ID[index2005], FUN = sum)[as.integer(trial$ID[trial$Year == 2005])]

trial[trial$Year == 2003,"Prec40CV"] <- tapply(ipW2003$PRCP[index2003], ipW2003$ID[index2003], FUN = cv)[as.integer(trial$ID[trial$Year == 2003])]
trial[trial$Year == 2004,"Prec40CV"] <- tapply(ipW2004$PRCP[index2004], ipW2004$ID[index2004], FUN = cv)[as.integer(trial$ID[trial$Year == 2004])]
trial[trial$Year == 2005,"Prec40CV"] <- tapply(ipW2005$PRCP[index2005], ipW2005$ID[index2005], FUN = cv)[as.integer(trial$ID[trial$Year == 2005])]

model1 <- lm(log1p(Yield) ~ Plant.m2 + TEMPSTRESS30 + TEMPSTRESS35 + TEMPSTRESS40 + PrecTotal + as.factor(Year) + as.factor(Variety) + as.factor(ID) + Variety:TEMPSTRESS30, data=trial)
summary(model1)
step(model1)

model2 <- lm(log(Yield) ~ Plant.m2 + TEMPSTRESS30 + PrecTotal + as.factor(Year) + as.factor(ID) + Variety:TEMPSTRESS30, data=trial)
summary(model1)

model1 <- gam(log1p(Yield) ~ Plant.m2 + s(TEMPSTRESS30) + s(PrecTotal) + as.factor(Year) + as.factor(Variety) + as.factor(ID) + s(TEMPSTRESS30, by=Variety), data=trial)
vis.gam(model1, view=c("Variety", "TEMPSTRESS30"), theta=140, ticktype="detailed", nticks=3)
