# Coursera Course - Exploratory Data Analysis
# Week 1 Assignment
# By PhilAIUK
# March 25, 2019

# R Code file to create Plot 4

# This file includes the following steps:
# - Read the data
# - Constructs Plot 4
# - Create plot4.png file

# 1. Read the data
# Set up a specific working directory for this assignment
setwd("/Users/Philippe1/DataCourse4Week1")

# Load the assignment Datase
# The dataset has 2,075,259 rows and 9 columns, and a header
# In this dataset missing values are coded as "?"
alldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# We will only be using data from the dates 2007-02-01 and 2007-02-02
dataplot4 <- subset(alldata, Date %in% c("1/2/2007","2/2/2007"))
# Convert the Date and Time variables to Date/Time classes in R
dataplot4$Date <- as.Date(dataplot4$Date, format="%d/%m/%Y")
# Create a new variable which contains both the Date and Time in the right format
datetime <- paste(as.Date(dataplot4$Date), dataplot4$Time)
dataplot4$Datetime <- as.POSIXct(datetime)

# 2. Construct Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))  # Split the screen in 4 parts, with sufficient margins

with(dataplot4, {
    plot(Global_active_power~Datetime, type="l",
         ylab="Global Active Power", xlab="")
    plot(Voltage~Datetime, type="l",
         ylab="Voltage", xlab="")
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="", col = "black")
    points(Sub_metering_2~Datetime, type="l", col = "red")
    points(Sub_metering_3~Datetime, type="l", col = "blue")
    legend("topright", col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2)
    plot(Global_reactive_power~Datetime, type="l",
         ylab="Global_reactive_power", xlab="")
})

# 3. Create plot4.png file
dev.print(png, file = "plot4.png", width=480, height=480)
dev.off()  # Close the Graphical Device

# Please look at plot4.png file for the result
