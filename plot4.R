setwd("D:\\Coursera\\Exploratory Data Analysis\\Project 1")

power_consumption <- read.table("./household_power_consumption.txt", sep = ";", header = T, na.strings ="?", 
                                stringsAsFactors = FALSE)

selected<-subset(power_consumption, Date =='1/2/2007'|Date =='2/2/2007')

dates <- as.Date(selected$Date, "%d/%m/%Y")
times <- selected[,"Time"]
DateTime <- paste(dates,times)
DateTime <- strptime(DateTime, format="%Y-%m-%d %H:%M:%S")

selected <- cbind(selected, DateTime)
Sys.setlocale("LC_TIME", "English")

x1 <- selected$Sub_metering_1
x2 <- selected$Sub_metering_2
x3 <- selected$Sub_metering_3

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2), mar= c(4,4,2,1), oma=c(0,0,2,0))
with(selected, {
    plot(DateTime, Global_active_power, type = "l", xlab="", ylab="Global Active Power(kilowatts)")
    plot(DateTime, Voltage, type = "l", xlab="datetime", ylab="Voltage")
    
    plot(x1, type = "l", xaxt='n', ylab="Energy sub metering", xlab="", col=1 )
    lines(x2, type = "l", xaxt='n', ylab="", xlab="", col=2)
    lines(x3, type = "l", xaxt='n', ylab="", xlab="", col=4)
    axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
    legend("topright", lty=1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    plot(DateTime, Global_reactive_power, type = "l",   xlab="datetime", ylab="Global reactive power")
})
dev.off()

par(mfrow = c(1,1))
