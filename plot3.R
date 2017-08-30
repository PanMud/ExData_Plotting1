#plot3.R - Data file should be available in the path ./data/household_power_consumption.txt
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
png(filename = "plot3.png", width = 480, height = 480)

plot(c(dtblsub$formattedTime,dtblsub$formattedTime,dtblsub$formattedTime), c(dtblsub$Sub_metering_1, dtblsub$Sub_metering_2, dtblsub$Sub_metering_3), type = "n", ylab = "Energy sub metering", xlab="")
lines(dtblsub$formattedTime, dtblsub$Sub_metering_1, col="black")
lines(dtblsub$formattedTime, dtblsub$Sub_metering_2, col="red")
lines(dtblsub$formattedTime, dtblsub$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))

dev.off()