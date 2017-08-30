#plot4.R - Data file should be available in the path ./data/household_power_consumption.txt
datafile="./data/household_power_consumption.txt"
if(!file.exists(datafile)) {
  stop("Data file - household_power_consumption.txt not found!!! ")
}
dtbl <- read.table(datafile, header=T, sep=";", na.strings = "?")
#only need data for the dates 1/2/2007 and 2/2/2007
dtblsub <- subset(dtbl, (dtbl$Date == "1/2/2007" | dtbl$Date == "2/2/2007"))

#combine the date and time values 
dtblsub$formattedTime = strptime(paste(dtblsub$Date, dtblsub$Time), "%d/%m/%Y %H:%M:%S")

#plot the graph
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Graph 1
plot(dtblsub$formattedTime, dtblsub$Global_active_power, type = "n", ylab = "Global Active Power", xlab="")
lines(dtblsub$formattedTime, dtblsub$Global_active_power)

# Graph 2
plot(dtblsub$formattedTime, dtblsub$Voltage, type = "n", ylab = "Voltage", xlab="datetime")
lines(dtblsub$formattedTime, dtblsub$Voltage)

# Graph 3
plot(c(dtblsub$formattedTime,dtblsub$formattedTime,dtblsub$formattedTime), c(dtblsub$Sub_metering_1, dtblsub$Sub_metering_2, dtblsub$Sub_metering_3), type = "n", ylab = "Energy sub metering", xlab="")
lines(dtblsub$formattedTime, dtblsub$Sub_metering_1, col="black")
lines(dtblsub$formattedTime, dtblsub$Sub_metering_2, col="red")
lines(dtblsub$formattedTime, dtblsub$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))

# Graph 4
plot(dtblsub$formattedTime, dtblsub$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab="datetime")
lines(dtblsub$formattedTime, dtblsub$Global_reactive_power)

dev.off()