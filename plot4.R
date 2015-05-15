plot4 <- function() {
        #data <- table
        data <- read.table("household_power_consumption.txt",skip = grep("1/2/2007", readLines("household_power_consumption.txt"))-1, nrows=2880,sep=";")
        colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
        par(mfrow=c(2,2))
        data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

        with(data, {
                plot(x=DateTime, y=Global_active_power, type="l", main="", xlab="", ylab="Global Active Power")
                plot(x=DateTime, y=Voltage, type="l", main="", xlab="datatime", ylab="Voltage")
                plot(x=DateTime, y=Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering", ylim=c(0,40))
                
                par(new=T) 
                plot(x=DateTime, y=Sub_metering_2, type="l", xlab="", ylab="", ylim=c(0,40), col="red")
                par(new=T) 
                plot(x=DateTime, y=Sub_metering_3, type="l", xlab="", ylab="", ylim=c(0,40), col="blue")
                legend("topright", lwd=2, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=1.0)

                plot(x=DateTime, y=Global_reactive_power, type="l", main="", xlab="datatime", ylab="Global_ractive_power")
        })
        
        dev.copy(png, file = "plot4.png") 
        dev.off()
}