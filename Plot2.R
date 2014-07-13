# Coursera - Exploratory Data Analysis
# Assignment 1

#Plot 2

# Read the data from the curent working directory
ExData <- read.table("household_power_consumption.txt", 
                     header=T, sep=";", na.strings=c("?"))

# Cast the time colum to a time class
ExData$Time = strptime(paste(ExData$Date, ExData$Time), "%d/%m/%Y %H:%M:%S")

# Cast the date column to a date class
ExData$Date <- as.Date(ExData$Date, "%d/%m/%Y")

# Subset the data frame keeping observations between 1st and 2nd Feb
ExData2 <- subset(ExData, Date >= as.Date("2007-02-01","%Y-%m-%d")
                  & Date <= as.Date("2007-02-02","%Y-%m-%d"))

# Plot the line chart
plot(ExData2$Time, ExData2$Global_active_power, type="l"
     , xlab=NA, ylab="Global Active Power (kilowatts)")

# Save to png
dev.copy(png, file = "plot_2.png") 
dev.off() 