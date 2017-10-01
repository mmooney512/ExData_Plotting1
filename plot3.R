#Exploratory Data
#Week 1 peer review assignment
library(data.table)
library(dplyr)
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
# plot 3
# ----------------------------------------------------------------------------
# create a png file
png(file = "plot3.png", width = 480, height = 480, units = "px")

# plot the graph
with(hh_power_plot,
	 plot(date_time
	 	 ,Sub_metering_1
	 	 ,type = "l"
	 	 ,xlab = ""
	 	 ,ylab = "Energy sub metering"
		 )
	)

lines(hh_power_plot$date_time
	  , hh_power_plot$Sub_metering_2
	  , col="red")

lines(hh_power_plot$date_time
	  , hh_power_plot$Sub_metering_3
	  , col="blue")

# add the legend
legend("topright", lty=1, col = c("black", "red", "blue")
	   , legend = c("Sub_metering_1"
	   			 , "Sub_metering_2"
	   			 , "Sub_metering_3")
	   )

#close the device and save the file
dev.off() 