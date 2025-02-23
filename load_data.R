# Load required libraries
library(data.table)

# Read dataset efficiently
file_path <- "household_power_consumption.txt"

# Read only necessary rows (2007-02-01 and 2007-02-02)
data <- fread(file_path, na.strings="?", sep=";", stringsAsFactors=FALSE)

# Convert Date column to Date type
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter dataset for the required dates
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Create a Date-Time column by merging Date and Time
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Convert necessary columns to numeric
num_cols <- c("Global_active_power", "Global_reactive_power", "Voltage",
              "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

data[ , (num_cols) := lapply(.SD, as.numeric), .SDcols=num_cols]

# Save for reuse
saveRDS(data, "processed_data.rds")

# Print confirmation
print("Data successfully loaded and preprocessed!")