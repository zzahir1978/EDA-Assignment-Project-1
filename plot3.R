data.plot3 <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data.plot3) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subplot3 <- subset(data.plot3,data.plot3$Date=="1/2/2007" | data.plot3$Date =="2/2/2007")

subplot3$Date <- as.Date(subplot3$Date, format="%d/%m/%Y")
subplot3$Time <- strptime(subplot3$Time, format="%H:%M:%S")
subplot3[1:1440,"Time"] <- format(subplot3[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subplot3[1441:2880,"Time"] <- format(subplot3[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(subplot3$Time,subplot3$Sub_metering_1,type="n",xlab="Days",ylab="Energy sub metering")
with(subplot3,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subplot3,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subplot3,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))

title(main="Energy Sub-Metering Graph")

dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()