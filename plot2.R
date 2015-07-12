#
# Plot the histogram of Global_active_power from the 
# household power usage data set for selected days
#
x=read.table("household_data.txt", header=TRUE, sep=";", na.strings="?")
y=subset(x, Date %in% c("1/2/2007", "2/2/2007"))
y$DT=strptime(paste(y$Date,y$Time), format="%d/%m/%Y %H:%M:%S")

png("plot2.png")

# Plot data
with(y, plot(DT, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.off()