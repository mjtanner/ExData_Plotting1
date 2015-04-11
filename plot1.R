# Matthew Tanner
# mjtanner@uga.edu
# Plot 1

if(!is.element("data.table", installed.packages()[,1]))
  install.packages("data.table")
library(data.table)
fileName <- "./Data/household_power_consumption.txt"
household_power_consumption <- read.table(fileName, sep = ';', header = TRUE)
sel <- household_power_consumption[which(household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007"),]
sel <- sel[which(sel$Global_active_power != "?"),]
sel[,3] <- as.numeric(as.character(sel$Global_active_power))
png("plot1.png",  width = 480, height = 480) 
hist(unclass(sel$Global_active_power), breaks = 12, col = "orangered2", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

