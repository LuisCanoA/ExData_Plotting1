#code for plot2

epc<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character");
epcS <- subset(epc,Date %in% c("1/2/2007","2/2/2007"));
rm(epc);
epcS$DateF<-strptime(paste(epcS$Date,epcS$Time),"%d/%m/%Y %H:%M:%S");
epcS$Global_active_powerF = as.numeric(epcS$Global_active_power);

png(file="plot2.png");
with(epcS,plot(DateF,Global_active_powerF,type='l', xlab="", 
               ylab='Global Active Power (kilowatts)'));
dev.off();
