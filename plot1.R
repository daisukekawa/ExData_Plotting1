plot1 <- function() {
        #data <- table
        data <- read.table("household_power_consumption.txt",skip = grep("1/2/2007", readLines("household_power_consumption.txt"))-1, nrows=2880,sep=";")
        colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

        with(data, hist(Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
        dev.copy(png, file = "plot1.png") 
        dev.off()
}