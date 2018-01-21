setwd("/Users/she/Documents/GitHub/ExData_Plotting1")
data_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format = "%d/%m/%y")
dateTime <- (paste(as.Date(data$Date), data$Time))
data$dateTime <- as.POSIXct(dateTime)
par(mfrow = c(2, 2))
##plot1
plot(data$dateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
##plot2
plot(data$dateTime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
##plot3
plot(data$Sub_metering_1~data$dateTime, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Sub_metering_2~data$dateTime, col = "red")
lines(data$Sub_metering_3~data$dateTime, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
##plot4
plot(data$dateTime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
