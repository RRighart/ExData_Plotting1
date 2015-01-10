setwd("/home/righart/Documents/prs/Course-DataSciences-EDA")

dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep=";", header=FALSE, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

D<-dim(dat) #dimension of dataset
RT<-D[1] #gives the length (and rightmost tick on the x-axis)
MT<-D[1]/2 #gives the midpoint of the x-axis 

A<-seq(1,RT) #makes a sequence to provide an x-axis 

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#left top
plot(dat$Global_active_power ~ A, type="n", ylab="Global Active Power", xaxt="n", xlab="", main="")
lines(dat$Global_active_power ~ A, type="l")
axis(side=1, at=c(1,MT,RT), labels=c("Thu", "Fri", "Sat"))

#right top
plot(dat$Voltage ~ A, type="n", ylab="Voltage", xaxt="n", xlab="datetime", ylim=c(234,246))
lines(dat$Voltage ~ A, col="black", type="l")
axis(side=1, at=c(1,MT,RT), labels=c("Thu", "Fri", "Sat"))

#left bottom
plot(dat$Sub_metering_1 ~ A, type="n", ylab="Energy sub metering", xaxt="n", xlab="", ylim=c(0,40))
lines(dat$Sub_metering_1 ~ A, col="black", type="l")
lines(dat$Sub_metering_2 ~ A, col="red", type="l")
lines(dat$Sub_metering_3 ~ A, col="blue", type="l")
axis(side=1, at=c(1,MT,RT), labels=c("Thu", "Fri", "Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), bty="n", col=c("black","red","blue"))

#right bottom
plot(dat$Global_reactive_power ~ A, type="n", ylab="Global_reactive_power", xaxt="n", xlab="datetime", ylim=c(0.0,0.5))
lines(dat$Global_reactive_power ~ A, col="black", type="l")
axis(side=1, at=c(1,MT,RT), labels=c("Thu", "Fri", "Sat"))
dev.off()
