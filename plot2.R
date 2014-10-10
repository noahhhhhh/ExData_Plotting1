## set up the working directory
setwd("~/R/Working Directory/ExData_Plotting1")

##  load and clean the data, and convert class for the data
source("prep.R")

##  generate a line chart for Global_active_power against datetime
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

##  export the plot to a png file and turn off the printing device
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()