#star! 
householdfile <- read.table("D:/R Data/exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=";", na.strings="?")

## fetch the data according to given time period

timeData <- householdfile[householdfile$Date %in% c("1/2/2007","2/2/2007"),]
Timeclass <-strptime(paste(timeData$Date, timeData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(Timeclass, timeData)

## Generating Plot 1
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
