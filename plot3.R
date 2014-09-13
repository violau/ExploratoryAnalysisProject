# Go to the working directory and load the table

setwd("/Users/vio/Downloads")
Pw <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Create a subset with only Data on 1/2/2007 & 2/2/2007

Pw_set <- Pw[Pw$Date=="1/2/2007" | Pw$Date=="2/2/2007",]


# Convert Date column variables to Date class
dates <- as.Date(Pw_set$Date, "%d/%m/%Y")
x <- paste(dates, Pw_set$Time)
time <- strptime(x, "%Y-%m-%d %H:%M:%S")

# Plot line chart
plot(x = time, y = as.numeric(levels(Pw_set$Sub_metering_1))[Pw_set$Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(x = time, y = as.numeric(levels(Pw_set$Sub_metering_2))[Pw_set$Sub_metering_2], col="red")
lines(x = time, y = Pw_set$Sub_metering_3, col = "blue")

# Add legend to the plot
legend('topright', lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save plot as plot3.png
dev.print(png,file="plot3.png", width=480, height=480)
dev.off()