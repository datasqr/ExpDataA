dataTest <- read.table("household_power_consumption.txt", 
                       sep = ";", 
                       header = TRUE,
                       nrows = 5,
                       na.strings = "?")

classes <- sapply(dataTest, class)

data <- read.table("household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE,
                   colClasses = classes,
                   na.strings = "?")
sapply(data, class)                     

data1 <- data
data1$Date = as.Date(data1$Date, "%d/%m/%Y")
str(data1)

data2 <- data1[data1$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time), format="%Y-%m-%d %H:%M:%S")

################ Plot 3 #######################################
with(data2, plot(DateTime, Sub_metering_1, 
                 type="l", 
                 xlab="",ylab="Energy sub metering"))
lines(data2$DateTime,data2$Sub_metering_2,col="Red")
lines(data2$DateTime,data2$Sub_metering_3,col="Blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lwd=1)
dev.copy(png,file="Plot3.png")
dev.off()
