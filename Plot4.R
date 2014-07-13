# Coursera - Exploratory Data Analysis
# Assignment 1

#Plot 4


# Read the data from the curent working directory
ExData <- read.table("household_power_consumption.txt", 
                     header=T, sep=";", na.strings=c("?"));

# Cast the time colum to a time class
ExData$Time = strptime(paste(ExData$Date, ExData$Time), "%d/%m/%Y %H:%M:%S");

# Cast the date column to a date class
ExData$Date <- as.Date(ExData$Date, "%d/%m/%Y");

# Subset the data frame keeping observations between 1st and 2nd Feb
ExData2 <- subset(ExData, Date >= as.Date("2007-02-01","%Y-%m-%d")
                  & Date <= as.Date("2007-02-02","%Y-%m-%d"));



# Set the display grid
par(mfrow = c(2, 2), mar = c(2, 2, 2, 2), oma = c(0, 0, 2, 0))


# Create the plots
with(ExData2, {
  plot(Time, Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)")
  plot(ExData2$Time, ExData2$Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(ExData2$Time, ExData2$Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering")
  lines(ExData2$Time, ExData2$Sub_metering_2, type="l", pch=22, lty=1, col="red")
  lines(ExData2$Time, ExData2$Sub_metering_3, type="l", pch=22, lty=1, col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", lty=1 , col=c("black", "red","blue"))
  plot(ExData2$Time, ExData2$Global_reactive_power, type="l" , xlab="datetime", ylab="Global_reactive_power")
})


# Save to png
dev.copy(png, file = "plot_4.png") 
dev.off() 