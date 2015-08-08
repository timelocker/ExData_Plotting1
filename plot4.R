## reading file from working directory
file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## subsetting data frame 
dat <- subset(file, file$Date %in% c("1/2/2007", "2/2/2007"))
datetime <- as.POSIXct(paste(dat[,1], dat[,2]), format="%d/%m/%Y %H:%M:%S")
datframe <- cbind(dat, datetime)

## making PNG file and creating spaces for 4 plots
png(file="plot4.png",width=800,height=800, res = 100)
par(mfrow = c(2,2))


## 1st plot on topleft corner
with(datframe, plot(datframe$datetime, datframe$Global_active_power, type = "n",
                    ylab = "Global Active Power",
                    xlab = ""))
lines(datframe$datetime, datframe$Global_active_power)

## plot2 on topright corner
with(datframe, plot(datframe$datetime, datframe$Voltage, type = "n",
                    xlab = "datetime", ylab = "voltage"))
lines(datframe$datetime, datframe$Voltage)

## plot3 on bottomleft corner
with(datframe, plot(datframe$datetime, datframe$Sub_metering_1, type = "n",
                    ylab = "Energy sub metering",
                    xlab = ""))
lines(datframe$datetime, datframe$Sub_metering_1)
lines(datframe$datetime, datframe$Sub_metering_2, col = "red")
lines(datframe$datetime, datframe$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, bty = "n", cex = 0.75)

## 4th plot on bottomright corner
with(datframe, plot(datframe$datetime, datframe$Global_reactive_power, type = "n",
                    xlab = "datetime", ylab = "Global_reactive_power"))
lines(datframe$datetime, datframe$Global_reactive_power)

## saving into PNG file
dev.off()