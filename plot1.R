#plot1.R - Data file should be available in the path ./data/household_power_consumption.txt
datafile="./data/household_power_consumption.txt"
if(!file.exists(datafile)) {
  stop("Data file - household_power_consumption.txt not found!!! ")
}
dtbl <- read.table(datafile, header=T, sep=";", na.strings = "?")

#only need data for the dates 1/2/2007 and 2/2/2007
dtblsub <- subset(dtbl, (dtbl$Date == "1/2/2007" | dtbl$Date == "2/2/2007"))

#plot the graph
png(filename = "plot1.png", width = 480, height = 480)
hist(dtblsub$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()