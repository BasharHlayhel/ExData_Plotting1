data <- read.table('household_power_consumption.txt', header=TRUE,sep=";",stringsAsFactors=FALSE)
data <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
data <- mutate(data,Global_active_power = as.numeric(Global_active_power)) 
data <- data[which(data$Global_active_power != is.na(data$Global_active_power)),]
data <- mutate(data, DT = dmy_hms(paste(data$Date,data$Time,sep= " "))) 
png("plot2.png",width=480,height = 480)
plot(data$DT,data$Global_active_power,type = "l" , main = "Global Active Power",ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()
    


