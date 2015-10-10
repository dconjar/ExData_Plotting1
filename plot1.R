getData <- function () {
  data <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = '?')
  data <- rbind(subset(data, Date == '1/2/2007'), subset(data, Date == '2/2/2007'))
  
  data$Timestamp <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
  
  data
}

getHistogram <- function (data) {
  hist(data$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')
}

png('plot1.png')
getHistogram(getData())
dev.off()