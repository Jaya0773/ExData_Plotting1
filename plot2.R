#Read the data and create the histogram
library(dplyr)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data$Global_active_power <- as.numeric(data$Global_active_power)
data <- tbl_df(data)
data <- mutate(data, date_time = paste(Date, Time, sep = " "))
data$date_time <- strptime(data$date_time, format = "%Y-%m-%d %H:%M:%S")
#Create PNG device
png(filename = "plot2.png")
#Create the plot
plot(data$date_time, data$Global_active_power ,type = "l" , xlab = "", ylab = "Global Active power(kilowatts)")
dev.off()
