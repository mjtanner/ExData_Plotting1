# Matthew Tanner
# mjtanner@uga.edu
# Plot 4

if(!is.element("data.table", installed.packages()[,1]))
  install.packages("data.table")
library(data.table)
fileName <- "./Data/household_power_consumption.txt"

household_power_consumption <- read.table(fileName, sep = ';', header = TRUE)

sel <- household_power_consumption[which(household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007"),]

# Global Active Power x Time
sel3 <- sel[which(sel$Global_active_power != "?"),]
sel3[,3] <- as.numeric(as.character(sel3$Global_active_power))
dtg3 <- as.POSIXct(paste(sel3[,1],sel3[,2]), format="%d/%m/%Y %H:%M:%S")

# Votage x Time
sel5 <- sel[which(sel$Voltage != "?"),]
sel5[,5] <- as.numeric(as.character(sel5$Voltage))
dtg5 <- as.POSIXct(paste(sel5[,1],sel5[,2]), format="%d/%m/%Y %H:%M:%S")

# Sub Metering x Time
selB <- sel[which(sel$Sub_metering_1 != "?" & sel$Sub_metering_2 != "?" & sel$Sub_metering_3 != "?"),]
dtg <- as.POSIXct(paste(selB[,1],selB[,2]), format="%d/%m/%Y %H:%M:%S")
selB[,7] <- as.numeric(as.character(selB$Sub_metering_1))
selB[,8] <- as.numeric(as.character(selB$Sub_metering_2))
selB[,9] <- as.numeric(as.character(selB$Sub_metering_3))
plot1 = selB$Sub_metering_1;
plot2 = selB$Sub_metering_2;
plot3 = selB$Sub_metering_3;
xRange <- range(dtg)
yRange <- range(plot1)

# Global Reactive Power x Time
sel4 <- sel[which(sel$Global_reactive_power != "?"),]
sel4[,4] <- as.numeric(as.character(sel4$Global_reactive_power))
dtg4 <- as.POSIXct(paste(sel4[,1],sel4[,2]), format="%d/%m/%Y %H:%M:%S")

png("plot4.png",  width = 480, height = 480) 

par(mfrow = c(2,2))

# Global Active Power x Time
plot(dtg3, sel3[,3], type="l", xlab = "", ylab="Global Active Power") 

# Votage x Time
plot(dtg5, sel5[,5], type="l", xlab = "datetime", ylab = "Voltage") 

# Sub Metering x Time
plot(xRange, yRange, type="n", xlab = "", ylab="Energy sub metering") 
lines(dtg, plot1, type="l") 
lines(dtg, plot2, type="l", col = "red") 
lines(dtg, plot3, type="l", col = "blue") 
legend("topright",c("Sub metering 1","Sub metering 2","Sub metering 3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red", "blue"), bty = "n")

# Global Reactive Power x Time
plot(dtg4, sel4[,4], type="l", xlab = "datetime", ylab="Global_reactive_power") 

dev.off()

