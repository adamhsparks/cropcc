library(cropData)
library(weatherData)
library(maps)
library(vegan)
library(reshape)

# library(geonames)
data(stations)
setwd(paste(system.file(package="cropData"), "/external", sep=""))

# get crop data
trial <- read.csv(system.file("external/trialsCA.csv", package="cropData"))
locs <- read.csv(system.file("external/locationsCA.csv", package="cropData"))

# use geonames server to get altitude data for trial locations
# just for demonstration, the values are already in the table
# for(i in 1:dim(locs)[1]) {locs$ALT[i] <- GNsrtm3(locs$LAT[i],locs$LON[i])[1]}
# locs$ALT <- as.numeric(locs$ALT)

# select weather stations
stations <- stations[!is.na(stations$ALT),]
stationsSelected <- stationsExtent(c(-110,-60,5,25), stations)
stationsSelected <- stationsSelected[stationsSelected$CTRY != "CU",]
stationsSelected <- stationsSelected[stationsSelected$CTRY != "US",]
stationsSelected <- stationsSelected[stationsSelected$CTRY != "PU",]
stationsSelected <- stationsSelected[stationsSelected$CTRY != "",]

# visualize
plot(stationsSelected[c("LON","LAT")], pch=3, cex=.5)
points(locs[c("LON","LAT")], pch=15)
map("world",add=TRUE, interior=F)

# weatherCA <- downloadGSOD(2003, 2005, stations = stationsSelected, silent = TRUE, tries = 2, overwrite = FALSE) 
weatherCA <- makeTableGSOD() 

# if this doesn't work, try to download the files with a download manager, see ?listFilesGSOD
# for this you can use the list of files created thusly
# listFilesGSOD(2003, 2005, stations=stationsSelected)

weatherCA <- na.omit(weatherCA)

# interpolate data
# to speed things up we select only the growing season to interpolate
ipW2003 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2003-5-15", "2003-9-25", stations = stationsSelected, silent=FALSE) #ignore the warnings
ipW2004 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2004-5-15", "2004-9-25", stations = stationsSelected)
ipW2005 <- interpolateDailyWeather(weatherCA, locs[c("ID", "LON", "LAT", "ALT")], "2005-5-15", "2005-9-25", stations = stationsSelected)
ipW <- rbind(ipW2003,ipW2004,ipW2005)

# add ecophysiological variables
TEMPSTRESS30 <- thermalStressSeasonal(30, ipW, trial, locs)
PREC <- precipitationSeasonal(ipW, trial)
RADIATION <- radiationSeasonal(ipW, trial, locs)
trial <- cbind(trial, TEMPSTRESS30, PREC, RADIATION)

# trial <- read.csv(system.file("external/trialsEnvCA.csv", package="cropData"))

# now let's analyze GxE interactions
tr2005 <- trial[trial$Year == 2005, c("Variety","Location","Yield", "Plant.m2")]

m <-  lm(Yield ~ Location + Plant.m2, data=tr2005) # G + GxE are left over, the rest is filtered out
tr2005$Yield <- residuals(m)
tr2005 <- tr2005[,c("Variety","Location","Yield")]

tr2005 <- melt(tr2005)
tr2005 <- cast(tr2005, Location ~ Variety)
rownames(tr2005) <- tr2005$Location
pca2005 <- princomp(tr2005[,-1])
biplot(pca2005)
loadings(pca2005)

# now let's incorporate the environmental variables in this analysis by doing an RDA
env2005 <- trial[trial$Year == 2005, c("Location", "TEMPSTRESS30", "PRECSUM", "PRECCV", "RADIATION")]
env2005 <- unique(env2005)
rownames(env2005) <- env2005$Location
env2005 <- env2005[,-1]
rda2005 <- rda(tr2005, env2005)
summary(rda2005)
plot(rda2005)

# Lobell (2011) type strategy, but with polynomials

model <- lm(log(Yield) ~ Variety + Plant.m2 + poly(TEMPSTRESS30,2) + poly(PRECSUM,2) + poly(RADIATION,2) + as.factor(Year) + as.factor(ID) + poly(TEMPSTRESS30):Variety, data = trial)
summary(model)
step(model)