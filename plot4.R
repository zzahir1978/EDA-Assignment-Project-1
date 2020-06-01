data.plot4 <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

plot4 <- subset(data.plot4, Date %in% c("1/2/2007","2/2/2007"))

plot4$Date <- as.Date(plot4$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(plot4$Date), plot4$Time)

plot4$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(plot4, {
plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="Days")
plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="Days")
plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="Days")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
legend("topright", lty=1, lwd=2, col=c("black", "red", "blue"),bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="Days")
        })

dev.copy(png,file="plot4.png",height=480,width=480)

dev.off()
