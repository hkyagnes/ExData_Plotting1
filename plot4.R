library(data.table)

#Download the dataset into the working directory
#fast read the original data
df <- fread("household_power_consumption.txt", na.strings = "?")

#subset the data needed
newdata<- rbind(subset(df, df$Date=="1/2/2007"), subset(df, df$Date=="2/2/2007"))
#change the data type
newdata <- as.data.frame(newdata)
newdata[,3] <- as.numeric(newdata[,3])
newdata[,4] <- as.numeric(newdata[,4])
newdata[,5] <- as.numeric(newdata[,5])
newdata[,6] <- as.numeric(newdata[,6])
newdata[,7] <- as.numeric(newdata[,7])
newdata[,8] <- as.numeric(newdata[,8])
newdata[,9] <- as.numeric(newdata[,9])
DT <- paste(newdata[,1], newdata[,2])
DT <- strptime(DT, "%d/%m/%Y %H:%M:%S")

#set up the png file
png(file="plot4.png",width=480,height=480)
par(mfrow= c(2,2))

#graph1
plot(DT, newdata[,3], type="l", ylab="Global Active Power", xlab="")

#graph2
plot(DT, newdata[,5], type="l", ylab="Voltage", xlab="datetime")

#graph 3
plot(DT,newdata[,7], type='l',xlab='', ylab='Energy sub metering', col="black")
lines(DT, newdata[,8], col="red")
lines(DT, newdata[,9], col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red","blue"), bty="n")

#graph 4
plot(DT, newdata[,4], type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()
