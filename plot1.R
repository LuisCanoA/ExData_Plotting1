#code for plot1 

epc<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character");
epcS <- subset(epc,Date %in% c("1/2/2007","2/2/2007"));
rm(epc);
epcS$DateF<-strptime(paste(epcS$Date,epcS$Time),"%d/%m/%Y %H:%M:%S");
epcS$Global_active_powerF = as.numeric(epcS$Global_active_power);

png(file="plot1.png");
hist(epcS$Global_active_powerF, col = 'red',
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power');
dev.off();
