setwd("D:\\Coursera\\Exploratory Data Analysis\\Project 1")

power_consumption <- read.table("./household_power_consumption.txt", sep = ";", header = T, na.strings ="?")

power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")

power_consumption$Date <- as.character(power_consumption$Date)

Data <- power_consumption[power_consumption$Date == "2007-02-01",]
Data2 <- power_consumption[power_consumption$Date == "2007-02-02",]
Data3 <- rbind(Data, Data2) #нужные данные

x1 <- Data3$Sub_metering_1
x2 <- Data3$Sub_metering_2
x3 <- Data3$Sub_metering_3

library(lubridate)
Data3$Date <- as.Date(Data3$Date)
wday(Data3$Date, label=TRUE)

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2), mar= c(4,4,2,1), oma=c(0,0,2,0))
with(Data3,{
    plot(Global_active_power, type = "l",  xlab="", ylab="Global active power", xaxt='n')
    axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
    
    plot(Voltage, type = "l", xlab="datetime", ylab="Global active power", xaxt='n')
    axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
    
    plot(x1, type = "l", xaxt='n', ylab="Energy sub metering", xlab="", col=1, xaxt='n')
    lines(x2, type = "l", xaxt='n', ylab="", xlab="", col=2)
    lines(x3, type = "l", xaxt='n', ylab="", xlab="", col=4)
    legend("topright",lty=1, col = c("black","red", "blue"),bty="n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
    
    plot(Global_reactive_power, type = "l",   xlab="datetime", ylab="Global reactive power", xaxt='n')
    axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
})
dev.off()

par(mfrow = c(1,1))
