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

################ Plot 4 #######################################
par(mfrow=c(2,2))
plot(data2$DateTime,data2[,3],type="l",xlab=" ",ylab="Global Active Power")

plot(data2$DateTime,data2[,5],type="l",xlab="datetime",ylab="Voltage")

plot(data2$DateTime,data2[,7],type="l",xlab=" ",ylab="Energy sub metering")
lines(data2[,10],data2[,8],col="Red")
lines(data2[,10],data2[,9],col="Blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lwd=1,pt.cex=0.6,cex=0.6,bty="n")

plot(data2$DateTime,data2[,4],type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,file="plot4.png")
dev.off()