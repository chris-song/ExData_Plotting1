#
# Plot all four graphs in one plot
#
x=read.table("household_data.txt", header=TRUE, sep=";", na.strings="?")
y=subset(x, Date %in% c("1/2/2007", "2/2/2007"))
y$DT=strptime(paste(y$Date,y$Time), format="%d/%m/%Y %H:%M:%S")

png("plot4.png")

par(mfrow=c(2,2))

# Plot 4 graphs
with(y, plot(DT, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

with(y, plot(DT, Voltage, type="l", xlab="datetime"))

with(y, {
  plot(DT, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(DT, Sub_metering_2, col="red")
  lines(DT, Sub_metering_3, col="blue")
  legend("topright", lty=c(1,1,1), cex=0.8, seg.len=1, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col=c("black", "red", "blue"))
  }
)

with(y, plot(DT, Global_reactive_power, type="l", xlab="datetime"))

dev.off()