data <- read.table('household_power_consumption.txt', header=TRUE,sep=";",stringsAsFactors=FALSE)
data <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
data %>% mutate(Date=dmy(Date), Global_active_power = as.numeric(Global_active_power)) %>%
    filter(Global_active_power != is.na(Global_active_power))
png("plot1.png",width=480,height = 480)
hist(as.numeric(data$Global_active_power),col = "red", main = "Global Active Power",xlim = c(0,6), ylim = c(0,1200),xlab = "Global Active Power (kilowatts)",ylab = "Frequency")
dev.off()

