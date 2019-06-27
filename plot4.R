#Reading, and subsetting data
setwd("D:\\Documents\\Rstudy")
power <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
head(subpower)

subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower$datetime <- paste(subpower$Date, subpower$Time)
subpower$Datetime <- as.POSIXct(datetime)

subpower$Datetime

png(file = "plot4.png",width=480, height=480)
par(mar = c(4,4,2,2),mfrow=c(2,2))

with(subpower, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="datetime")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           lty=1, lwd=2.5, col=c("black", "red", "blue"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="datetime")
})
dev.off()

