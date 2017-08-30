#plot2.R - Data file should be available in the path ./data/household_power_consumption.txt
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
png(filename = "plot2.png", width = 480, height = 480)
plot(dtblsub$formattedTime, dtblsub$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab="")
lines(dtblsub$formattedTime, dtblsub$Global_active_power)
dev.off()