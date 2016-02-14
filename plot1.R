#reading data
data<-read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#subsetting data
mydata<-subset(data, Date=="2007-02-01" | Date=="2007-02-02")
#my plot
hist(mydata$Global_active_power, xlab= "Global Active Power(kilowatts)", col="red", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
#closing device
dev.off(4)
