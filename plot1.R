#Exploratory Data
#Week 1 peer review assignment
library(data.table)
library(lubridate)

hh_power <- fread("./household_power_consumption.txt"
	  			,na.strings = "?"
	  			)

hh_power_plot <- hh_power[which(dmy(hh_power$Date) >= dmy("01/02/2007")
								& dmy(hh_power$Date) <= dmy("02/02/2007")
								), ]
# ----------------------------------------------------------------------------
# plot 1
# ----------------------------------------------------------------------------
# create a png file
png(file = "plot1.png", width = 480, height = 480, units = "px")

# plot the graph
hist(hh_power_plot$Global_active_power
	 ,main = "Global Active Power "
	 ,xlab = "Global Active Power (kilowatts}"
	 ,col = "Red"
)

#close the device and save the file
dev.off() 

