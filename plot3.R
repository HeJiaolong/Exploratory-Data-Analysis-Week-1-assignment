#Reading, and subsetting data
setwd("D:\\Documents\\Rstudy")
power <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
head(subpower)

subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subpower$Date), subpower$Time)
subpower$Datetime <- as.POSIXct(datetime)
subpower$Datetime

par(mar = c(2,4,2,2))
png("plot3.png", width=480, height=480)
plot(subpower$Datetime, as.numeric(subpower$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="", )
lines(subpower$Datetime, as.numeric(subpower$Sub_metering_2), type="l", col="red")
lines(subpower$Datetime, as.numeric(subpower$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()