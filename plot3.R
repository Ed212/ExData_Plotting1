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

# Make plot
plot(datasub[,7], type="l", col="black",xaxt="n", xlab="", ylab="Energy sub metering")
points(datasub[,8], type="l", col="red")
points(datasub[,9], type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , col=c("black", "red", "blue"), lty=1, cex=0.5)
beg <- 1
mid <- length(which(datasub[,1] == "2007-02-01"))
end <- mid + length(which(datasub[,1] == "2007-02-02"))
axis(1, at=c(beg, mid, end), labels=c("Thu", "Fri", "Sat"))

# copy png file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()