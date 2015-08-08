## reading file from working directory
file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## subsetting data frame 
dat <- subset(file, file$Date %in% c("1/2/2007", "2/2/2007"))
datetime <- as.POSIXct(paste(dat[,1], dat[,2]), format="%d/%m/%Y %H:%M:%S")
datframe <- cbind(dat, datetime)

## making PNG file
png(file="plot3.png",width=800,height=800, res = 100)

## making empty graph
with(datframe, plot(datframe$datetime, datframe$Sub_metering_1, type = "n",
                    ylab = "Energy sub metering",
                    xlab = ""))

## adding lines
lines(datframe$datetime, datframe$Sub_metering_1)
lines(datframe$datetime, datframe$Sub_metering_2, col = "red")
lines(datframe$datetime, datframe$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1)

## saving into PNG file
dev.off()