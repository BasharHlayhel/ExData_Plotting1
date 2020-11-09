data <- read.table('household_power_consumption.txt', header=TRUE,sep=";",stringsAsFactors=FALSE)    data <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
data[which(data[,] != "?"),]
data <- mutate(data,DT = dmy_hms(paste(data$Date,data$Time,sep= " ")),Global_active_power = as.numeric(Global_active_power))
data <- mutate(data,Global_reactive_power = as.numeric(Global_reactive_power), Voltage = as.numeric(Voltage))
png("plot4.png",width=480,height = 480)
par(mfrow=c(2,2))
with(data, plot(DT,Global_active_power,type = "l" ,ylab = "Global Active Power",xlab=""))
with(data, plot(DT,Voltage,type="l",xlab = "datetime",ylab="Voltage" ))
plot(data$DT,data$Sub_metering_1,type = "l" ,ylab = "Energy sub metering",xlab="")
lines(data$DT,data$Sub_metering_2,type="l",col="red")
lines(data$DT,data$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),lty=1,lwd=2 )
with(data, plot(DT,Global_reactive_power,type = "l" ,xlab="datetime",lwd=1))
dev.off()
    
