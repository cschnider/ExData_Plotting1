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

#Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
#par(mar = c(6, 6, 5, 4))
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()