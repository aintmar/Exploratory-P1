epc <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(epc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subepc <- subset(epc,epc$Date=="1/2/2007" | epc$Date =="2/2/2007")

subepc$Time <- strptime(subepc$Time, format="%H:%M:%S")
subepc$Date <- as.Date(subepc$Date, format="%d/%m/%Y")
subepc[1:1440,"Time"] <- format(subepc[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subepc[1441:2880,"Time"] <- format(subepc[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

par(mfcol=c(2,2))

with(subepc,{
  plot(subepc$Time,as.numeric(as.character(subepc$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subepc$Time,subepc$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subepc,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subepc,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subepc,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.35)
  plot(subepc$Time,as.numeric(as.character(subepc$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subepc$Time,as.numeric(as.character(subepc$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()