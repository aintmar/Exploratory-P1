epc <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(epc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subepc <- subset(epc,epc$Date=="1/2/2007" | epc$Date =="2/2/2007")

hist(as.numeric(as.character(subepc$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()


