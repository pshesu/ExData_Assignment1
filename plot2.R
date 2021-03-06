setwd("/Users/she/Documents/GitHub/ExData_Plotting1")
data_full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format = "%d/%m/%y")
dateTime <- (paste(as.Date(data$Date), data$Time))
data$dateTime <- as.POSIXct(dateTime)
##png("plot2.png", width = 480, height = 480)
plot(data$dateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
##dev.off()
