# Load preprocessed data
data <- readRDS("processed_data.rds")

# Create plot
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", breaks=30)
dev.off()
print("plot1.png saved!")