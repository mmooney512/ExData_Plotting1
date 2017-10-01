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
# plot 2
# ----------------------------------------------------------------------------
# create a png file
png(file = "plot2.png", width = 480, height = 480, units = "px")

# plot the graph
with(hh_power_plot,
		 plot(date_time
		 	 ,Global_active_power
		 	 ,type = "l"
		 	 ,xlab = ""
		 	 ,ylab = "Global Active Power (kilowatts)"
		 	 )
	)

#close the device and save the file
dev.off() 