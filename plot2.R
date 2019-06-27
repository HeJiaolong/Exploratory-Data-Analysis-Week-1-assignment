#Reading, naming and subsetting data
power <- read.table("D:\\Documents\\Rstudy\\exdata_data_household_power_consumption\\household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subpower <- subset(power,Date=="1/2/2007" | Date =="2/2/2007")
head(subpower)

subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower$datetime <- paste(subpower$Date, subpower$Time)
subpower$Datetime <- as.POSIXct(datetime)

png(file = "plot2.png",width=480, height=480)
par(mar = c(2,4,2,2))
with(subpower,{plot(Datetime,as.numeric(Global_active_power),type="l",xlab="", ylab="Global Active Power (kilowatts)")} )
dev.off()
