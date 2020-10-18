#conver date and time to dd/mm/YYYY and HH:MM:SS formats
data1$Date <- as.Date(data1$Date, format = '%d/%m/%Y')
data1$DateTime <- as.POSIXct(paste(data1$Date, data1$Time))
#plotting and creating the .png
if(!file.exists('graphs')) dir.create('graphs')
png(filename = 'D:/Users/CRISTINA/Documents/graphs/plot2.png', width = 480, height = 480, units='px')
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(data1$DateTime, data1$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
dev.off()