library(data.table)

#Download the dataset into the working directory
#fast read the original data
df <- fread("household_power_consumption.txt", na.strings = "?")

#subset the data needed
newdata<- rbind(subset(df, df$Date=="1/2/2007"), subset(df, df$Date=="2/2/2007"))

#Change the data type
newdata <- as.data.frame(newdata)
newdata[,7] <- as.numeric(newdata[,7])
newdata[,8] <- as.numeric(newdata[,8])
newdata[,9] <- as.numeric(newdata[,9])
DT <- paste(newdata[,1], newdata[,2])
DT <- strptime(DT, "%d/%m/%Y %H:%M:%S")

#plot the graph and export to png
png(file="plot3.png",width=480,height=480)
plot(DT,newdata[,7], type='l',xlab='', ylab='Energy sub metering', col="black")
lines(DT, newdata[,8], col="red")
lines(DT, newdata[,9], col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red","blue"))
dev.off()

