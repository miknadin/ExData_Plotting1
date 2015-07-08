setwd("D:\\Coursera\\Exploratory Data Analysis\\Project 1")
install.packages("dplyr")
library(dplyr) 


power_consumption <- read.table("./household_power_consumption.txt", sep = ";", header = T, na.strings ="?")
object.size(power_consumption)
memory.profile()

power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")

power_consumption$Date <- as.character(power_consumption$Date)

#Data <- power_consumption[(power_consumption$Date=2007-02-01 & power_consumption$Date=2007-02-02)]
Data <- power_consumption[power_consumption$Date == "2007-02-01",]
Data2 <- power_consumption[power_consumption$Date == "2007-02-02",]
Data3 <- rbind(Data, Data2) #нужные данные

with(Data3, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", col=2))
dev.copy(png, file="plot1.png")    
dev.off()
