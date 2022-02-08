#Arctic sea ice
#08-02-22

# arctic_ice = read.csv("data/N_seaice_extent_daily_v3.0.csv", skip=2, header = FALSE, col.names = c("Year", "Month", "Day", "Extent", "Missing", "Source_Data"))
url = 'ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/daily/data/N_seaice_extent_daily_v3.0.csv'
arctic_ice = read.delim(url, skip=2, sep=",", header=FALSE, col.names = c("Year", "Month", "Day", "Extent", "Missing", "Source_Data"))
head(arctic_ice)


#use a package to combine year, month, and day into one date
library(lubridate)
arctic_ice$date=make_date(year=arctic_ice$Year, arctic_ice$Month, arctic_ice$Day)


plot(Extent~date, data=arctic_ice, type="l")


#look at interannual trends, calculate average for each year
arctic_ice_averages=data.frame(year=seq(min(arctic_ice$Year)+1, max(arctic_ice$Year)-1), extent_annual_avg=NA, extent_5yr_avg=NA)

mean(arctic_ice$Extent[arctic_ice$Year==arctic_ice_averages$year[1]])   #how to calculate the annual average, copy and paste it into the for loop

for(i in seq(dim(arctic_ice_averages)[1])){
  arctic_ice_averages$extent_annual_avg[i]=mean(arctic_ice$Extent[arctic_ice$Year==arctic_ice_averages$year[i]])
}

#calculate the 5yr avg
for(i in seq(dim(arctic_ice_averages)[1])){
  years=seq(arctic_ice_averages$year[i]-2,arctic_ice_averages$year[i]+2)
  arctic_ice_averages$extent_5yr_avg[i]=mean(arctic_ice$Extent[arctic_ice$Year%in%years])
}


#plot the averages
plot(extent_annual_avg~year, data=arctic_ice_averages, type="l")
lines(extent_5yr_avg~year, data=arctic_ice_averages, type="l", col="red")


#plot the averages with seasonal data as well
arctic_ice_averages$date=make_date(year=arctic_ice_averages$year)   #to set the dates as the same from the arctic_ice data sheet so it all plots on one graph

pdf(file="figures/arctic_sea_ice_avgs.pdf", width=7, height=5.5)
plot(Extent~date, data=arctic_ice, type="l")
lines(extent_annual_avg~date, data=arctic_ice_averages, type="l", col="blue")
lines(extent_5yr_avg~date, data=arctic_ice_averages, type="l", col="red")
dev.off()









