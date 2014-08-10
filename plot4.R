#Read data
data <- read.csv2("household_power_consumption.txt", sep = ";",header=T, fill=TRUE, na.strings='?')

#convert data columns
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset data
data <- subset(data,Date>="2007-02-01" & Date<="2007-02-02")

# Convert columns to numeric
for(i in c(3:9)) {data[,i] <- as.numeric(as.character(data[,i]))}

# Create Date_Time variable
data$Date_Time <- paste(data$Date, data$Time)

# Convert Date_Time variable to proper format
data$Date_Time <- strptime(data$Date_Time, format="%Y-%m-%d %H:%M:%S")

#Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")

par(mfrow = c(2, 2), cex=.5)

#### Top left
plot(data$Date_Time, data$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power", type="n")

lines(data$Date_Time, data$Global_active_power, type="S")


#### Top right 
plot(data$Date_Time, data$Voltage, xaxt=NULL, xlab = "datetime", ylab = "Voltage", type="n")
lines(data$Date_Time, data$Voltage, type="S")


#### bottom left
plot(data$Date_Time, data$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")
lines(data$Date_Time, data$Sub_metering_1, col = "black", type = "S")

## Plots lines for sub_metering_1
lines(data$Date_Time, data$Sub_metering_2, col = "red", type = "S")
## Plots lines for sub_metering_2
lines(data$Date_Time, data$Sub_metering_3, col = "blue", type = "S")
## Plots lines for sub_metering_3

legend("topright", bty = "n", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#### Bottom right
plot(data$Date_Time, data$Global_reactive_power, xaxt=NULL, xlab = "datetime", ylab = "Global_reactive_power", type="n")

lines(data$Date_Time, data$Global_reactive_power, type="S")

#### Turn off device 
dev.off()