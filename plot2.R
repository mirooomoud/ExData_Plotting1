#reading data
data<-read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#subsetting data
mydata<-subset(data, Date=="2007-02-01" | Date=="2007-02-02")
#converting dates
datetime <- paste(as.Date(mydata$Date), mydata$Time)
mydata$Datetime <- as.POSIXct(datetime)
#plotting
plot(mydata$Global_active_power~mydata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off(4)