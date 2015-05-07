#### Exploratory data analysis project 1 ####

# start of plotting code

# Load packages
if(!require(dplyr)){
      install.packages(dplyr)
}
library(dplyr)

# Load the data
data <- read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings = "?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datasub <- filter(data, Date >= as.Date("2007-02-01"), Date < as.Date("2007-02-03"))

# Remove large data set from memory
rm(data)

# Make plots
par(mfrow=c(2,2))

# 4.1
plot(datasub[,3], type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
beg <- 1
mid <- length(which(datasub[,1] == "2007-02-01"))
end <- mid + length(which(datasub[,1] == "2007-02-02"))
axis(1, at=c(beg, mid, end), labels=c("Thu", "Fri", "Sat"))

# 4.2
plot(datasub[,5], type="l", xaxt="n", xlab="datetime", ylab="Voltage")
axis(1, at=c(beg, mid, end), labels=c("Thu", "Fri", "Sat"))

# 4.3
plot(datasub[,7], type="l", col="black",xaxt="n", xlab="", ylab="Energy sub metering")
points(datasub[,8], type="l", col="red")
points(datasub[,9], type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , col=c("black", "red", "blue"), lty=1, cex=0.4)
axis(1, at=c(beg, mid, end), labels=c("Thu", "Fri", "Sat"))

# 4.4
plot(datasub[,4], type="l", xaxt="n", xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(beg, mid, end), labels=c("Thu", "Fri", "Sat"))

# copy png file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

# reset plot settings
par(mfrow=c(1,1))