#reading data
data<-read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#subsetting data
mydata<-subset(data, Date=="2007-02-01" | Date=="2007-02-02")
#converting dates
datetime <- paste(as.Date(mydata$Date), mydata$Time)
mydata$Datetime <- as.POSIXct(datetime)
#my plot
plot(mydata$Datetime, mydata$Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(mydata$Datetime, mydata$Sub_metering_2, type = "l", col="red")
lines(mydata$Datetime, mydata$Sub_metering_3, type = "l", col="blue")
legend("topright",lwd = 1, lty = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
dev.copy(png, file="plot3.png",height=480, width=480 )
dev.off(4)