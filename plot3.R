# Matthew Tanner
# mjtanner@uga.edu
# Plot 3

if(!is.element("data.table", installed.packages()[,1]))
  install.packages("data.table")
library(data.table)
fileName <- "./Data/household_power_consumption.txt"
household_power_consumption <- read.table(fileName, sep = ';', header = TRUE)
sel <- household_power_consumption[which(household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007"),]
sel <- sel[which(sel$Global_active_power != "?"),]
dtg <- as.POSIXct(paste(sel[,1],sel[,2]), format="%d/%m/%Y %H:%M:%S")
sel[,7] <- as.numeric(as.character(sel$Sub_metering_1))
sel[,8] <- as.numeric(as.character(sel$Sub_metering_2))
sel[,9] <- as.numeric(as.character(sel$Sub_metering_3))
plot1 = sel$Sub_metering_1;
plot2 = sel$Sub_metering_2;
plot3 = sel$Sub_metering_3;
xRange <- range(dtg)
yRange <- range(plot1)
png("plot3.png",  width = 480, height = 480) 
plot(xRange, yRange, type="n", xlab = "", ylab="Energy sub metering") 
lines(dtg, plot1, type="l") 
lines(dtg, plot2, type="l", col = "red") 
lines(dtg, plot3, type="l", col = "blue") 
legend("topright",c("Sub metering 1","Sub metering 2","Sub metering 3"), lty=c(1,1,1),lwd=c(2.5,2.5),col=c("black","red", "blue"))
dev.off() 
