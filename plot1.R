library(data.table)

#Download the dataset into the working directory
#fast read the original data
df <- fread("household_power_consumption.txt", na.strings = "?")

#subset the data needed
newdata<- rbind(subset(df, df$Date=="1/2/2007"), subset(df, df$Date=="2/2/2007"))

#Change the data type,so that is can be plotted into graph 
newdata <- as.data.frame(newdata)
newdata[,3] <- as.numeric(newdata[,3])

#plot graph, output as png
png(file="plot1.png",width=480,height=480)
hist(newdata[,3], col ="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")
dev.off()
