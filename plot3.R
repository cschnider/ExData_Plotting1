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

#Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")

plot(data$Date_Time, data$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")

lines(data$Date_Time, data$Sub_metering_1, col = "black", type = "S")

lines(data$Date_Time, data$Sub_metering_2, col = "red", type = "S")

lines(data$Date_Time, data$Sub_metering_3, col = "blue", type = "S")

legend("topright", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()