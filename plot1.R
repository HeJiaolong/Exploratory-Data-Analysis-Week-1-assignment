#Reading, and subsetting data
setwd("D:\\Documents\\Rstudy")
power <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
head(subpower)

png(file = "plot1.png",width=480, height=480)
hist(as.numeric(subpower$Global_active_power),xlab="Global Active Power(kilowatts)", main = "Global Active power", col="red")
dev.off()

