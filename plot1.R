## Read the household_power_consumption.txt file and create plot1
library(sqldf)
## Read file - only for dates 2/1/2007 and 2/2/2007
file <- c("./household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')")
data_subset$Date <- strptime(paste(data_subset$Date,data_subset$Time), "%d/%m/%Y %H:%M:%S")
par(mar = c(4,4,4,2))
## Plot 1
hist(data_subset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
## Copy to png file
dev.copy(png, file = "plot1.png")
dev.off()