#Reads text file and store as 'dataset'
dataset<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
#Filters Date for 2007-02-01 and 2007-02-02
plot_set<-subset(dataset, Date=="1/2/2007"|Date=="2/2/2007")
#Convert Date and Time to date/time class
plot_set$Date_Time<-strptime(paste(plot_set$Date, plot_set$Time),
                             format="%d/%m/%Y %H:%M:%S")
#Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(plot_set, {
      #plot 1
      plot(Date_Time, Global_active_power, xlab="",type="l",
           ylab="Global Active Power")
      #plot 2
      plot(Date_Time, Voltage, xlab="datetime", type="l")
      #plot 3
      plot(Date_Time,Sub_metering_1, type="l", xlab="",
           ylab="Energy sub metering")
      with(plot_set, points(Date_Time, Sub_metering_2, type="l", col="red"))
      with(plot_set, points(Date_Time, Sub_metering_3, type="l", col="blue"))
      legend("topright", bty="n", lty=1, cex=0.98, col=c("black","red","blue"),
             legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      #plot 4
      plot(Date_Time, Global_reactive_power, xlab="datetime",type="l")
})
dev.off()
