library(tidyverse)

# I like to keep things organized, so this codes creates the folders you need to match my architecture
if(!file.exists("~/Data Science Bootcamp")){dir.create("~/Data Science Bootcamp")}
if(!file.exists("~/Data Science Bootcamp/Exploratory Data Analysis")){dir.create("~/Data Science Bootcamp/Exploratory Data Analysis")}
if(!file.exists("~/Data Science Bootcamp/Exploratory Data Analysis/ExData_Plotting1")){dir.create("~/Data Science Bootcamp/Exploratory Data Analysis/ExData_Plotting1")}

# download & read the zip file
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url, destfile = "~/Data Science Bootcamp/Exploratory Data Analysis/ExData_Plotting1/household_power_consumption.zip")
extracted <- unz("~/Data Science Bootcamp/Exploratory Data Analysis/ExData_Plotting1/household_power_consumption.zip", filename = "household_power_consumption.txt")
pc <- read.table(extracted, sep = ";", header = TRUE, dec=".", stringsAsFactors = FALSE)
glimpse(pc)

# subset for the dates we are working with: feb 1 & 2, 2007
feb_pc <- pc[pc$Date %in% c("1/2/2007", "2/2/2007"),]
glimpse(feb_pc)
sm1 <- feb_pc$Sub_metering_1
sm2 <- feb_pc$Sub_metering_2
sm3 <- feb_pc$Sub_metering_3
date_time <- strptime(paste(feb_pc$Date, feb_pc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
head(date_time)


# time to build the plots
gap_num <- as.numeric(feb_pc$Global_active_power)
png("~/Data Science Bootcamp/Exploratory Data Analysis/ExData_Plotting1/plot3.png", width=480, height=480)
plot(date_time, sm1, type = "l", xlab = "", ylab = "Energy sub metering", main = "", col = "black")
lines(date_time, sm2, type = "l", xlab = "", ylab = "Energy sub metering", main = "", col = "red")
lines(date_time, sm3, type = "l", xlab = "", ylab = "Energy sub metering", main = "", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5)
dev.off()
