interpolateDailyWeather <-
function(tableGOSD, locations, startDate, endDate, vars=c("TEMP","MAX","MIN","PRCP"), covars="ALT", stations=data(stations), logtr=("PRCP")) #covars should be present in the stations file
{
require(fields)

#checking and formatting of incoming objects
if(is.null(rownames(locations))) rownames(locations) <- 1:(dim(locations)[1])
if(dim(locations)[2] != 3) stop("object locations should have three columns: longitude, latitude and altitude")
if(is.null(colnames(locations))) {warning("object locations has no column names. It is assumed that the order is: longitude, latitude, altitude"); colnames(locations) <- c("LON","LAT","ALT")}
if(!all(colnames(locations) == c("LON","LAT","ALT"))) warning("object locations has non-standard column names (standard is LON,LAT,ALT). It is assumed that the order is: longitude, latitude, altitude")

#log-transform some variables
colnames(tableGOSD)
if(!is.null(logtr)) {} #TO DO

#prepare vectors of the days
days <- as.Date(startDate):as.Date(endDate)
days <- as.Date(days, origin="1970-01-01")
monthDays <- paste(substring(as.character(days),6,7),substring(as.character(days),9,10),sep="")
years <- as.integer(substring(as.character(days),1,4))

#make the final table as a list: station name, year, date and weather vars
inDaWe <- vector(mode="list",length=length(vars)+3)
names(inDaWe) <- c("location", "year", "moda", vars)
inDaWe$location <- rep(rownames(locations),times=length(days))
inDaWe$year <- rep(years,each=dim(locations)[1])
inDaWe$moda <- rep(monthDays,each=dim(locations)[1])

ll <- length(locations[,1])
for(i in 4:length(inDaWe)) inDaWe[[i]] <- rep(NA, times=ll*length(days))

#loop through days and variables
for(i in 1:length(years))
{
ssub <- tableGOSD[tableGOSD["MODA"]==monthDays[i] & tableGOSD["YEAR"]== years[i],]
if(dim(ssub)[1]>5)
{
#add coordinates and altitude
ssub <- cbind(ssub, stations[match(ssub$ID, stations$ID),c("LON","LAT","ALT")])
for(Yvar in vars)
{
ssubV <- ssub[c(Yvar, "LON","LAT","ALT")]
ssubV <- na.omit(ssubV)
if(dim(ssubV)[1]>5)
{
#make daily interpolation and predict for each location
model <- try(Tps(Y=ssubV[Yvar], x=ssubV[c("LON","LAT")], Z=unlist(ssubV["ALT"]))) 
surface(model)
#model <- fastTps(Y=ssub[Yvar], x=ssub[c("LON","LAT")], Z=ssub["ALT"], lon.lat=TRUE, theta=theta)
if(!inherits(model, "try-error")) {inDaWe[[Yvar]][(ll*(i-1)+1):(ll*i)] <- predict(model, x=locations[,c("LAT","LON")], Z=locations[,"ALT"])}
}
}
}
}
return(as.data.frame(inDaWe))
}

