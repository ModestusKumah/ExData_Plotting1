# Load preprocessed data
data <- readRDS("processed_data.rds")

# Create plot
png("plot4.png", width=480, height=480)

# Set layout for 2x2 plots
par(mfrow=c(2,2))

# Top-left: Global Active Power
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Top-right: Voltage
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Bottom-left: Energy Sub Metering
plot(data$DateTime, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, cex=0.8, bty="n")

# Bottom-right: Global Reactive Power
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()
print("plot4.png saved!")