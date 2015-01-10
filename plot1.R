# Course project 1, Exploratory Data Analysis (EDA)
# script by: Ruthger Righart

setwd("/home/righart/Documents/prs/Course-DataSciences-EDA")

dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep=";", header=FALSE, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# plot1

png("plot1.png", width=480, height=480)
hist(dat$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
