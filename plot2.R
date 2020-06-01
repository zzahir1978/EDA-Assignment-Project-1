data.plot2 <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(data.plot2) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub.dataplot2 <- subset(data.plot2,data.plot2$Date=="1/2/2007" | data.plot2$Date =="2/2/2007")

sub.dataplot2$Date <- as.Date(sub.dataplot2$Date, format="%d/%m/%Y")
sub.dataplot2$Time <- strptime(sub.dataplot2$Time, format="%H:%M:%S")
sub.dataplot2[1:1440,"Time"] <- format(sub.dataplot2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub.dataplot2[1441:2880,"Time"] <- format(sub.dataplot2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(sub.dataplot2$Time,as.numeric(as.character(sub.dataplot2$Global_active_power)),type="l",xlab="Days",ylab="Global Active Power (kilowatts)")

title(main="Global Active Power Vs Time")

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()