library(data.table)

#Download the dataset into the working directory
#fast read the original data
df <- fread("household_power_consumption.txt", na.strings = "?")

#subset the data needed
newdata<- rbind(subset(df, df$Date=="1/2/2007"), subset(df, df$Date=="2/2/2007"))

#Change the data type
newdata <- as.data.frame(newdata)
newdata[,3] <- as.numeric(newdata[,3])
DT <- paste(newdata[,1], newdata[,2])
DT <- strptime(DT, "%d/%m/%Y %H:%M:%S")

#plot the graph and export to png
png(file="plot2.png",width=480,height=480)
plot(DT, newdata[,3], type="l", ylab="Global Active Power(kilowatts)", xlab="")
dev.off()
