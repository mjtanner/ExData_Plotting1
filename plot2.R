# Matthew Tanner
# mjtanner@uga.edu
# Plot 2

if(!is.element("data.table", installed.packages()[,1]))
  install.packages("data.table")
library(data.table)
fileName <- "./Data/household_power_consumption.txt"
household_power_consumption <- read.table(fileName, sep = ';', header = TRUE)
sel <- household_power_consumption[which(household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007"),]
sel <- sel[which(sel$Global_active_power != "?"),]
sel[,3] <- as.numeric(as.character(sel$Global_active_power))
dtg <- as.POSIXct(paste(sel[,1],sel[,2]), format="%d/%m/%Y %H:%M:%S")
xRange <- range(dtg)
yRange <- range(sel[,3])
png("plot2.png",  width = 480, height = 480) 
plot(dtg, sel[,3], type="l", xlab = "", ylab="Global Active Power (kilowatts)") 
dev.off()