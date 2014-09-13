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
plot(x=time, y=as.numeric(levels(Pw_set$Global_active_power))[Pw_set$Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Save plot as plot2.png

dev.print(png,file="plot2.png", width=480, height=480)
dev.off()