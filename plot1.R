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
hist(datasub[,3], col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# copy png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()