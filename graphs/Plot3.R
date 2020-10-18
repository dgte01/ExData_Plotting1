#plotting and creating the .png
if(!file.exists('graphs')) dir.create('graphs')
png(filename = '.../graphs/plot3.png', width = 480, height = 480, units='px')
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(data1$DateTime, data1$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(data1$DateTime, data1$Sub_metering_2, col = 'red')
lines(data1$DateTime, data1$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
dev.off()