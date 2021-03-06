data <- read.table('household_power_consumption.txt', header=TRUE,sep=";",stringsAsFactors=FALSE)
data <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
data %>% filter(Sub_metering_1 != "?" & Sub_metering_2 != "?" & Sub_metering_3 != "?")
data <- mutate(data, DT = dmy_hms(paste(data$Date,data$Time,sep= " "))) 
png("plot3.png",width=480,height = 480)
plot(data$DT,data$Sub_metering_1,type = "l" ,ylab = "Energy sub metering",xlab="")
lines(data$DT,data$Sub_metering_2,type="l",col="red")
lines(data$DT,data$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),lty=1,lwd =2 )
dev.off()
