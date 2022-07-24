#Reads text file and store as 'dataset'
dataset<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
#Filters Date for 2007-02-01 and 2007-02-02
plot_set<-subset(dataset, Date=="1/2/2007"|Date=="2/2/2007")
#Convert Date and Time to date/time class
plot_set$Date_Time<-strptime(paste(plot_set$Date, plot_set$Time),
                             format="%d/%m/%Y %H:%M:%S")
#Plot 2
png("plot2.png", width=480, height=480)
with(plot_set, plot(Date_Time,Global_active_power, type="l",
                    xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()