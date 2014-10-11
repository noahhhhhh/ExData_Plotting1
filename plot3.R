## set up the working directory
setwd("~/R/Working Directory/ExData_Plotting1")

##  load and clean the data, and convert class for the data
source("prep.R")

##  set up the canvas
par(bg = "white", mfrow = c(1, 1))

##  generate a line chart for Sub_metering_1 against datatime
plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
##  add a red line for Sub_metering_2 against datatime
lines(data$datetime, data$Sub_metering_2, col = "red")
##  add a blue line for Sub_metering_3 against datatime
lines(data$datetime, data$Sub_metering_3, col = "blue")

##  add a legend
legend(
    "topright"
    , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    , col=c("black", "red", "blue")
    , lty="solid"
)

##  export the plot to a png file and turn off the printing device
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()