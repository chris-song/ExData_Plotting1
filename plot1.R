#
# Plot the histogram of Global_active_power from the 
# household power usage data set for selected days
#
x=read.table("household_data.txt", header=TRUE, sep=";", na.strings="?")
y=subset(x, Date %in% c("1/2/2007", "2/2/2007"))
gap=y$Global_active_power
png("plot1.png")
hist(gap, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()