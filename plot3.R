## Read the household_power_consumption.txt file and create plot3
library(sqldf)
## Read file - only for dates 2/1/2007 and 2/2/2007
file <- c("./household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')")
data_subset$Date <- strptime(paste(data_subset$Date,data_subset$Time), "%d/%m/%Y %H:%M:%S")
par(mar = c(4,4,4,2))
## Plot 3
png(file="plot3.png")
plot(data_subset$Date,data_subset$Sub_metering_1,type="n", xlab="", ylab="Energy sub metering")
lines(data_subset$Date,data_subset$Sub_metering_1, col = "black", type = "l")
lines(data_subset$Date,data_subset$Sub_metering_2, col = "red", type = "l")
lines(data_subset$Date,data_subset$Sub_metering_3, col = "blue", type = "l")
legend("topright",  col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 0.75, cex = 0.75)
dev.off()