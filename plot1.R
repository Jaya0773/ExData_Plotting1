#Read the data and create the histogram
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data$Global_active_power <- as.numeric(data$Global_active_power)
#Create PNG device
png(filename = "plot1.png")
#Create Histogram
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power(Kilowatts)")
dev.off()