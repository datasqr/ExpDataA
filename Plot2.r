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

################ Plot 2 #######################################
# x labels are in Polish (Cz - Thu, Pt - Fri, So - Sat)
plot(data2$DateTime,data2[,3],
     type="l",
     xlab=" ",
     ylab="Global Active Power (kilowatts)")
dev.copy(png,file="Plot 2.png", width = 480, height = 480)
dev.off()
