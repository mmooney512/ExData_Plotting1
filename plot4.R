#Exploratory Data
#Week 1 peer review assignment
library(data.table)
library(dpylr)
library(lubridate)

hh_power <- fread("./household_power_consumption.txt"
				  ,na.strings = "?"
)

hh_power_plot <- hh_power[which(dmy(hh_power$Date) >= dmy("01/02/2007")
								& dmy(hh_power$Date) <= dmy("02/02/2007")
), ]
hh_power_plot <- mutate(hh_power_plot, date_time = 
							as_datetime(paste(dmy(hh_power_plot$Date)
											  ,hh_power_plot$Time
											  , sep= " "))
)

# ----------------------------------------------------------------------------
# plot 4
# ----------------------------------------------------------------------------
# create a png file
png(file = "plot4.png", width = 480, height = 480, units = "px")

# set the page outlet to a 2 x 2 grid
par(mfcol=c(2,2))

# plot the graph 4.1
	plot(hh_power_plot$date_time
		 ,hh_power_plot$Global_active_power
		 ,type="l"
		 ,xlab=""
		 ,ylab="Global Active Power (kilowatts)"
		 )
	
# plot the graph 4.2
	plot(hh_power_plot$date_time
		 , hh_power_plot$Sub_metering_1
		 ,type="l"
		 ,xlab=""
		 ,ylab="Energy sub metering"
		 )
	lines(hh_power_plot$date_time
		  , hh_power_plot$Sub_metering_2
		  , col="red"
		  )
	lines(hh_power_plot$date_time
		  , power_feb$Sub_metering_3
		  , col="blue"
		  )
	
	legend("topright"
		   , lty=1
		   , bty="n"
		   , col = c("black", "red", "blue")
		   , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
		   )
	
# plot the graph 4.3
	plot(hh_power_plot$date_time
		 , hh_power_plot$Voltage
		 , type="l"
		 , xlab="datetime"
		 , ylab="Voltage"
		 )
# plot the graph 4.4
	plot (hh_power_plot$date_time
		  , hh_power_plot$Global_reactive_power
		  , type="l"
		  , xlab="datetime"
		  , ylab="Global_reactive_power"
		  )


#close the device and save the file
dev.off() 