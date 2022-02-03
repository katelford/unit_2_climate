#Global CO2 trends
#03-02-22


url = 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt'   #this is the way to read in the data directly from the source, which is nice to keep the data updated
co2 = read.table(url, col.names = c("year", "month", "decimal_date", "monthly_average", "deseasonalized", 
                                    "n_days", "st_dev_days", "monthly_mean_uncertainty"))
head(co2)
tail(co2)
summary(co2)

plot(monthly_average~decimal_date, data=co2, type="l")
lines(deseasonalized~decimal_date, data=co2, col="red")


#seasonal trends
co2$seasonal_cycle=co2$monthly_average-co2$deseasonalized
plot(seasonal_cycle~decimal_date, type="l", data=co2)


#subset
co2_2016to2021=co2[co2$decimal_date>2016,]
plot(seasonal_cycle~decimal_date, type="l", data=co2_2016to2021)


#mean seasonal anomaly for a month
jan_anomaly=mean(co2$seasonal_cycle[co2$month==1])   #column is after the $, rather than specifying after the row
jan_anomaly

co2_monthly_cycle=data.frame(month=c(1:12), detrended_monthly_cycle=NA)  

co2_monthly_cycle$detrended_monthly_cycle[1]=mean(co2$seasonal_cycle[co2$month==1])
co2_monthly_cycle$detrended_monthly_cycle[2]=mean(co2$seasonal_cycle[co2$month==2])
co2_monthly_cycle$detrended_monthly_cycle[3]=mean(co2$seasonal_cycle[co2$month==3])
co2_monthly_cycle$detrended_monthly_cycle[4]=mean(co2$seasonal_cycle[co2$month==4])
co2_monthly_cycle$detrended_monthly_cycle[5]=mean(co2$seasonal_cycle[co2$month==5])
co2_monthly_cycle$detrended_monthly_cycle[6]=mean(co2$seasonal_cycle[co2$month==6])
co2_monthly_cycle$detrended_monthly_cycle[7]=mean(co2$seasonal_cycle[co2$month==7])
co2_monthly_cycle$detrended_monthly_cycle[8]=mean(co2$seasonal_cycle[co2$month==8])
co2_monthly_cycle$detrended_monthly_cycle[9]=mean(co2$seasonal_cycle[co2$month==9])
co2_monthly_cycle$detrended_monthly_cycle[10]=mean(co2$seasonal_cycle[co2$month==10])
co2_monthly_cycle$detrended_monthly_cycle[11]=mean(co2$seasonal_cycle[co2$month==11])
co2_monthly_cycle$detrended_monthly_cycle[12]=mean(co2$seasonal_cycle[co2$month==12])

co2_monthly_cycle

plot(detrended_monthly_cycle~month, data=co2_monthly_cycle, type="l")  


#1959 vs 2021
season_1959=data.frame(month=c(1:12), )
  
  









