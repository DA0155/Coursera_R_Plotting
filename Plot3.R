# Coursera - Exploratory Data Analysis
# Assignment 1

#Plot 3


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


# Create line plot with the values for Sub_metering_1
plot(ExData2$Time, ExData2$Sub_metering_1, type="l"
     , xlab=NA, ylab="Energy sub metering");


# Add the values for Sub_metering_2
lines(ExData2$Time, ExData2$Sub_metering_2, type="l", pch=22
      , lty=1, col="red");


# Add the values for Sub_metering_3
lines(ExData2$Time, ExData2$Sub_metering_3, type="l", pch=22
      , lty=1, col="blue");


# Create the legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
      , lty=1 , col=c("black", "red","blue"));


# Save to png
dev.copy(png, file = "plot_3.png") 
dev.off() 

