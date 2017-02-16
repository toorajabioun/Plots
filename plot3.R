#reading data file
d <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",nrows = 100000,colClasses = "character")

#converting characters to numeric values
for (i in 3:9) {d[,i]<-as.numeric(d[,i])}

#converting dates to POSIXlt class :
tim<-strptime(paste(d[,1],d[,2]),"%d/%m/%Y %H:%M:%S")

#extracting the data for 2/1/07-2/2/07:
ind=tim$year==107 & tim$mon==1 & (tim$mday==1 | tim$mday==2)
d<-d[ind,]

#ploting
with(d,plot(Sub_metering_1,type="l",lwd=1,xaxt="n",col="gray0",xlab="",ylab = "Energy Sub Metering (watt-hour)"))
with(d,points(Sub_metering_2,type="l",lwd=1,col="red"))
with(d,points(Sub_metering_3,type="l",lwd=1,col="blue"))
axis(1,c(1,1440,2880),c("Thu","Fri","Sat"))
legend("topright",pch="_",col=c("gray0","red","blue"),legend=c("sub metering 1","sub metering 2","sub metering 3"))


#making the png file:
dev.copy(png,file="plot3.png")
dev.off()
