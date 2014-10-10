## set up the working directory
setwd("~/R/Working Directory/ExData_Plotting1")

##  load and clean the data, and convert class for the data
source("prep.R")

##  generate a histogram for Global_active_power
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

##  export the plot to a png file and turn off the printing device
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()