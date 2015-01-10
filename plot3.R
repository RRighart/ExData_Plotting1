# Course project 1, Exploratory Data Analysis (EDA)
# script by: Ruthger Righart

D<-dim(dat) #dimension of dataset
RT<-D[1] #gives the length (and rightmost tick on the x-axis)
MT<-D[1]/2 #gives the midpoint of the x-axis 

A<-seq(1,RT) #makes a sequence to provide an x-axis 

png("plot3.png", width=480, height=480)
plot(dat$Sub_metering_1 ~ A, type="n", ylab="Energy sub metering", xaxt="n", xlab="", ylim=c(0,40))
lines(dat$Sub_metering_1 ~ A, col="black", type="l")
lines(dat$Sub_metering_2 ~ A, col="red", type="l")
lines(dat$Sub_metering_3 ~ A, col="blue", type="l")
axis(side=1, at=c(1,MT,RT), labels=c("Thu", "Fri", "Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("black","red","blue"))
dev.off()
