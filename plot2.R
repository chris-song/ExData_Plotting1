#
# Plot the level of Global_active_power against time (in minute interval) in a two-day period from the 
# household power usage data set
#
x=read.table("household_data.txt", header=TRUE, sep=";", na.strings="?")
y=subset(x, Date %in% c("1/2/2007", "2/2/2007"))
y$DT=strptime(paste(y$Date,y$Time), format="%d/%m/%Y %H:%M:%S")

png("plot2.png")

# Plot data
with(y, plot(DT, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.off()