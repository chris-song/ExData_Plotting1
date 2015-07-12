#
# Plot the level of energey sub-metering against time (in minute interval) in a two-day period from the 
# household power usage data set
#
x=read.table("household_data.txt", header=TRUE, sep=";", na.strings="?")
y=subset(x, Date %in% c("1/2/2007", "2/2/2007"))
y$DT=strptime(paste(y$Date,y$Time), format="%d/%m/%Y %H:%M:%S")

png("plot3.png")

# Plot data
with(y, {
  plot(DT, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(DT, Sub_metering_2, col="red")
  lines(DT, Sub_metering_3, col="blue")
  # cex=0.7, seg.len=1.5: used for screen device
  legend("topright", lty=c(1,1,1), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col=c("black", "red", "blue"))
}
  )

dev.off()