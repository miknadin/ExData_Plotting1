setwd("D:\\Coursera\\Exploratory Data Analysis\\Project 1")

power_consumption <- read.table("./household_power_consumption.txt", sep = ";", header = T, na.strings ="?")

power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")

power_consumption$Date <- as.character(power_consumption$Date)

Data <- power_consumption[power_consumption$Date == "2007-02-01",]
Data2 <- power_consumption[power_consumption$Date == "2007-02-02",]
Data3 <- rbind(Data, Data2) #нужные данные

x<-Data3$Global_active_power

library(lubridate)
Data3$Date <- as.Date(Data3$Date)
wday(Data3$Date, label=TRUE)


plot(x, type = "l", xaxt='n', ylab="Global Active Power(kilowatts)", xlab="")
axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))


dev.copy(png, file="plot2.png")    
dev.off()
