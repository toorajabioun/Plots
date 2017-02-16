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
with(d,plot(Global_active_power,type="l",lwd=2,xaxt="n",xlab="",ylab = "Global Active Power (KiloWatts)"))
axis(1,c(1,1440,2880),c("Thu","Fri","Sat"))

#making the png file:
dev.copy(png,file="plot2.png")
dev.off()
