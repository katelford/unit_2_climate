#Melting Ice
#27-01-2022

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

ant_ice_loss_with_NA=rbind(ant_ice_loss, data_break)
tail(ant_ice_loss_with_NA)

ant_ice_loss_with_NA=ant_ice_loss_with_NA[order(ant_ice_loss_with_NA$decimal_date), ]   #orders the data by the row adjusted for with NA (but still reports all the rows), the blank tells it to report all the columns 

plot(mass_Gt~decimal_date, data=ant_ice_loss_with_NA, type="l")


#adjusting the Greenland data
grn_ice_loss_with_NA=rbind(grn_ice_loss, data_break)
grn_ice_loss_with_NA=grn_ice_loss_with_NA[order(grn_ice_loss_with_NA$decimal_date), ]
plot(mass_Gt~decimal_date, data=grn_ice_loss_with_NA, type="l")


#combining the two plots
plot(mass_Gt~decimal_date, data=grn_ice_loss_with_NA, type="l")
lines(mass_Gt~decimal_date, data=ant_ice_loss_with_NA, col="blue")


#plot uncertainty
pdf("figures/ice_mass_trends.pdf", width=7, height=5)   #to save the plot, have to put the destination if different than current folder, then name, then size parameters if needed

plot(mass_Gt~decimal_date, data=ant_ice_loss_with_NA, type="l", ylim=range(grn_ice_loss_with_NA$mass_Gt, na.rm=T),
     ylab="Ice mass loss (Gt)", xlab="Year")   #the y limits have to be put on the plot line
lines(mass_Gt+2*sigma_Gt~decimal_date, data=ant_ice_loss_with_NA, lty="dashed")   #lty is line type
lines(mass_Gt-2*sigma_Gt~decimal_date, data=ant_ice_loss_with_NA, lty="dashed")
#add Greenland data
lines(mass_Gt~decimal_date, data=grn_ice_loss_with_NA, type="l", col="red")
lines(mass_Gt+2*sigma_Gt~decimal_date, data=grn_ice_loss_with_NA, lty="dashed", col="red") 
lines(mass_Gt-2*sigma_Gt~decimal_date, data=grn_ice_loss_with_NA, lty="dashed", col="red")

dev.off()   #use this to close the plot pdf file 


#bar plot showing rate of ice loss
min(ant_ice_loss_with_NA, na.rm=T)
min(grn_ice_loss_with_NA, na.rm=T)

barplot(height=-1*c(min(ant_ice_loss_with_NA, na.rm=T), min(grn_ice_loss_with_NA, na.rm=T)), names.arg=c("Antarctica", "Greenland"))   #multiply by negative one to flip axis


#bar plot showing annual rate of ice loss
pdf("figures/annual_ice_loss_trends.pdf")



ant_change=min(ant_ice_loss_with_NA, na.rm=T)/
grn_change=min(grn_ice_loss_with_NA, na.rm=T)/

barplot(height=c(ant_change, grn_change), names.arg=c("Antarctica", "Greenland", ylab="Annual rate of change"))

dev.off()
