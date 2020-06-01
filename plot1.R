data.plot1 <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

plot1 <- subset(data.plot1, Date %in% c("1/2/2007","2/2/2007"))

plot1$Date <- as.Date(plot1$Date, format="%d/%m/%Y")

hist(plot1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

png("plot1.png", width=480, height=480)

dev.off()