#Read the data and create the histogram
library(dplyr)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data$Global_active_power <- as.numeric(data$Global_active_power)
data <- tbl_df(data)
data <- mutate(data, date_time = paste(Date, Time, sep = " "))
data$date_time <- strptime(data$date_time, format = "%Y-%m-%d %H:%M:%S")
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)
#Create PNG device
png(filename = "plot4.png")
#Create the plot
par(mfrow = c(2,2))
#First plot
plot(data$date_time, data$Global_active_power ,type = "l" , xlab = "", ylab = "Global Active power(kilowatts)")
#Second plot
plot(data$date_time, data$Voltage ,type = "l" , xlab = "datetime", ylab = "Voltage")
#Third Plot
plot(data$date_time, data$Sub_metering_1 ,type = "l", col = "black", xlab = " " , ylab = "Energy sub metering")
lines(data$date_time, data$Sub_metering_2 ,type = "l", col = "red")
lines(data$date_time, data$Sub_metering_3 ,type = "l", col = "blue")
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Fourth Plot
plot(data$date_time, data$Global_reactive_power ,type = "l" , xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
