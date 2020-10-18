#we download de file from the fiven url
if(!file.exists('data.zip')){
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  download.file(url,destfile = "household_power.zip")
}
unzip("household_power.zip")

#we read the info in the file, avoiding subsetting and only reading the chunk we need.

data1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

files <- file('household_power_consumption.txt')

data1 <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

#we remove incomplete observations

data1 <- t[complete.cases(t),]

#we combine Date and Time column
dateTime <- paste(data1$Date, data1$Time)
dateTime <- setNames(dateTime, "DateTime")
data1 <- data1[ ,!(names(data1) %in% c("Date","Time"))]
data1 <- cbind(dateTime, data1)
data1$dateTime <- as.POSIXct(dateTime)

#plot and creat .png
if(!file.exists('graphs')) dir.create('graphs')
png(filename = 'D:/Users/CRISTINA/Documents/graphs/plot1.png', width = 480, height = 480, units='px')
with(data1, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))
dev.off()