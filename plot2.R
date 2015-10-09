setwd("D:\\Coursera\\Exploratory Data Analysis\\Project 1")

power_consumption <- read.table("./household_power_consumption.txt", sep = ";", header = T, na.strings ="?", 
                                stringsAsFactors = FALSE)

selected<-subset(power_consumption, Date =='1/2/2007'|Date =='2/2/2007')

dates <- as.Date(selected$Date, "%d/%m/%Y")
times <- selected[,"Time"]
DateTime <- paste(dates,times)
DateTime <- strptime(DateTime, format="%Y-%m-%d %H:%M:%S")

selected <- cbind(selected, DateTime)


x<-selected$Global_active_power
Sys.setlocale("LC_TIME", "English")
plot(selected$DateTime, x, type = "l", xlab="", ylab="Global Active Power(kilowatts)")
dev.copy(png, file="plot2.png")    
dev.off()


