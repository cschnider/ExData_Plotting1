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

#Plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")

Sys.setlocale("LC_TIME", "C")

plot(data$Date_Time, data$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")
lines(data$Date_Time, data$Global_active_power, type="S")
dev.off()