## reading file from working directory
file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## subsetting data frame 
dat <- subset(file, file$Date %in% c("1/2/2007", "2/2/2007"))

## making png file
png(file="plot1.png",width=800,height=800, res = 100)

## making histogram
hist(dat$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

## saving into PNG file
dev.off()