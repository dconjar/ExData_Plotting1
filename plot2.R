getData <- function () {
  data <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = '?')
  data <- rbind(subset(data, Date == '1/2/2007'), subset(data, Date == '2/2/2007'))
  
  data$Timestamp <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
  
  data
}

getPlot <- function (data) {
  plot.ts(data$Global_active_power, main = '', xlab = '', ylab = 'Global Active Power (kilowatts)', xaxt='n')
  axis(side = 1, at = c(0, length(data$Global_active_power) / 2, length(data$Global_active_power)), labels = c('Thu', 'Fri', 'Sat'))
}

png('plot2.png')
getPlot(getData())
dev.off()