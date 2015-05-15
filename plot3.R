plot3 <- function() {
        #data <- table
        data <- read.table("household_power_consumption.txt",skip = grep("1/2/2007", readLines("household_power_consumption.txt"))-1, nrows=2880,sep=";")
        colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
        data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
        with(data, plot(x=DateTime, y=Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering", ylim=c(0,40)))
        par(new=T) 
        with(data, plot(x=DateTime, y=Sub_metering_2, type="l", xlab="", ylab="", ylim=c(0,40), col="red"))
        par(new=T) 
        with(data, plot(x=DateTime, y=Sub_metering_3, type="l", xlab="", ylab="", ylim=c(0,40), col="blue"))
        legend("topright", lwd=2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=1.0)
        dev.copy(png, file = "plot3.png") 
        dev.off()
}