# Course project 1, Exploratory Data Analysis (EDA)
# script by: Ruthger Righart

setwd("/home/righart/Documents/prs/Course-DataSciences-EDA")

dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep=";", header=FALSE, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

D<-dim(dat) #dimension of dataset
RT<-D[1] #gives the length (and rightmost tick on the x-axis)
MT<-D[1]/2 #gives the midpoint of the x-axis 

A<-seq(1,RT) #makes a sequence to provide an x-axis 

png("plot2.png", width=480, height=480)
plot(dat$Global_active_power ~ A, type="n", ylab="Global Active Power (kilowatts)", xaxt="n", xlab="")
lines(dat$Global_active_power ~ A, type="l")
axis(side=1, at=c(1,MT,RT), labels=c("Thu", "Fri", "Sat"))
dev.off()
