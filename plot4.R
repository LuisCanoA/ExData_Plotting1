#code for plot 4

epc<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character");
epcS <- subset(epc,Date %in% c("1/2/2007","2/2/2007"));
rm(epc);
epcS$DateF<-strptime(paste(epcS$Date,epcS$Time),"%d/%m/%Y %H:%M:%S");
epcS$Global_active_powerF = as.numeric(epcS$Global_active_power);

png(file="plot4.png");
par(mfrow=c(2,2),mar=c(4,4,1,1));
with(epcS,plot(DateF,Global_active_powerF,type='l', xlab="", 
               ylab='Global Active Power'));
with(epcS,plot(DateF,Voltage,type='l', xlab="datetime", 
               ylab='Voltage'));
with(epcS,plot(DateF, Sub_metering_1,type='l', xlab="", col='black',
               ylab='Energy sub metering'));
with(epcS,lines(DateF, Sub_metering_2, col='red'));
with(epcS,lines(DateF, Sub_metering_3, col='blue'));
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue")
       ,lwd=1,bty="n");
with(epcS,plot(DateF,Global_reactive_power,type='l', xlab="datetime", 
               ylab='Global reactive power'));
dev.off();
