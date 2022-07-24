#Reads text file and store as 'dataset'
dataset<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
#Filters Date for 2007-02-01 and 2007-02-02
plot_set<-subset(dataset, Date=="1/2/2007"|Date=="2/2/2007")
#Plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(plot_set$Global_active_power), col="red", 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power"
)
dev.off()