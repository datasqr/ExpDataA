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

data1 <- data
data1$Date = as.Date(data1$Date, "%d/%m/%Y")
str(data1)

data2 <- data1[data1$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time), format="%Y-%m-%d %H:%M:%S")

################ Plot 1 #######################################
png(filename = "Plot 1.png",
    width = 480, height = 480)
hist(data2[,3], 
     main = "Global Active Power",
     xlab = "Global Active Power [kilowatts]",
     col = "red")
dev.off()
