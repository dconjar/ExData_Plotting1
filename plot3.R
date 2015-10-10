getData <- function () {
  data <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = '?')
  data <- rbind(subset(data, Date == '1/2/2007'), subset(data, Date == '2/2/2007'))
  
  data$Timestamp <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
  
  data
}

plot3 <- function (data) {
  plot(data$Timestamp, data$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '')
  lines(data$Timestamp, data$Sub_metering_2, col = '#f81c20')
  lines(data$Timestamp, data$Sub_metering_3, col = '#4400f9')
  axis(side = 1, at = c(0, length(data$Global_active_power) / 2, length(data$Global_active_power)), labels = c('Thu', 'Fri', 'Sat'))
  legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), fill = c('#111111', '#f81c20', '#4400f9'))
}

png('plot3.png')
plot3(getData())
dev.off()