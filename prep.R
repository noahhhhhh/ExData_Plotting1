## set up the working directory
setwd("~/R/Working Directory/ExData_Plotting1")

##  if the zip file already exists, then unzip directly, if not, download it into the working directory
if (!file.exists("household_power_consumption.zip")) 
{
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip", method = "curl")
}

##  unzip the file, a txt file will be extracted in the working directory
unzip("household_power_consumption.zip")

##  load the txt file
dataHPC <- read.csv2("household_power_consumption.txt", na.string = "?")

##  delete the txt file and the zip file
file.remove(c("household_power_consumption.txt", "household_power_consumption.zip"))

##  transform the date to Date class, for subsetting purpose
dataHPC$Date <- strptime(dataHPC$Date, '%d/%m/%Y')

##  subset the original dataset by choosing only the rows from 2007-02-01 to 2007-02-02
dataHPCSub <- dataHPC[dataHPC$Date >= "2007-02-01" & dataHPC$Date <= "2007-02-02",]
##  release the original data memory
rm(dataHPC)

##  combine the Date and Time column
datetime <- paste(dataHPCSub$Date, dataHPCSub$Time, sep = " ")
##  convert the combined var to Date time class
datetime <- strptime(datetime, '%Y-%m-%d %H:%M:%S')
##  insert the new datetime column
data <- cbind(datetime, dataHPCSub)
##  release the original var and dateset
rm(dataHPCSub, datetime)

##  convert the non-date/time columns to numeric class
data[, -c(1,2,3)] <- apply(data[, -c(1,2,3)], 2, function(x) as.numeric(as.character(x)))