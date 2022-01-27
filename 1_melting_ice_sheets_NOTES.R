#Melting Ice
#26-01-2022

ant_ice_loss = read.table("data/antarctica_mass_200204_202111.txt", skip=31, sep="", header = FALSE, col.names = c("decimal_date", "mass_Gt", "sigma_Gt"))

head(ant_ice_loss)   #see the first 6 rows of data
tail(ant_ice_loss)   #see the last 6 rows of data

grn_ice_loss = read.table("data/greenland_mass_200204_202111.txt", skip=31, sep="", header = FALSE, col.names = c("decimal_date", "mass_Gt", "sigma_Gt"))

head(grn_ice_loss)
dim(grn_ice_loss)   #gives you row and column numbers
summary(grn_ice_loss)   #outputs min, max, mean, median, quartiles for each column

#Visualise!
plot(mass_Gt~decimal_date, data=ant_ice_loss)   #put y variable first, followed by a ~ then the x variable, then where the data is from
plot(mass_Gt~decimal_date, data=grn_ice_loss, ylab="Greenland Mass Lost (Gt)", xlab="Date")   #ylab is to label the y axis something other than the default

#add two data sets on one graph
min(grn_ice_loss$mass_Gt)   #what is the minimum in that data set, under that column
plot(mass_Gt~decimal_date, data=ant_ice_loss, type="l", ylim=c(-5200, 0))   #type tells it how to display (l is line), ylim tells it the range the y-axis should display, smallest number first
lines(mass_Gt~decimal_date, data=grn_ice_loss, col="red")   #col changes the colour of the plot

#same as above, but allows for changes in the data
grn_min=min(grn_ice_loss)
range(grn_ice_loss$mass_Gt)
plot(mass_Gt~decimal_date, data=ant_ice_loss, type="l", ylim=c(grn_min, 0))
plot(mass_Gt~decimal_date, data=ant_ice_loss, type="l", ylim=range(grn_ice_loss$mass_Gt))

#Add in an NA to account for gap between missions
data_break=data.frame(decimal_date=2018, mass_Gt=NA, sigma_Gt=NA)
data_break

ant_ice_loss_with_NA = rbind(ant_ice_loss, data_break)
tail(ant_ice_loss_with_NA)

ant_ice_loss_with_NA=ant_ice_loss_with_NA[order(ant_ice_loss_with_NA$decimal_date), ]   #orders the data by the row adjusted for with NA (but still reports all the rows), the blank tells it to report all the columns 

plot(mass_Gt~decimal_date, data=ant_ice_loss_with_NA, type="l")
