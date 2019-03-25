# Coursera Course - Exploratory Data Analysis
# Week 1 Assignment
# By PhilAIUK
# March 25, 2019

# R Code file to create Plot 3

# This file includes the following steps:
# - Read the data
# - Constructs Plot 3
# - Create plot3.png file

# 1. Read the data
# Set up a specific working directory for this assignment
setwd("/Users/Philippe1/DataCourse4Week1")

# Load the assignment Datase
# The dataset has 2,075,259 rows and 9 columns, and a header
# In this dataset missing values are coded as "?"
alldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# We will only be using data from the dates 2007-02-01 and 2007-02-02
dataplot3 <- subset(alldata, Date %in% c("1/2/2007","2/2/2007"))
# Convert the Date and Time variables to Date/Time classes in R
dataplot3$Date <- as.Date(dataplot3$Date, format="%d/%m/%Y")
# Create a new variable which contains both the Date and Time in the right format
datetime <- paste(as.Date(dataplot3$Date), dataplot3$Time)
dataplot3$Datetime <- as.POSIXct(datetime)

# 2. Construct Plot 3
with(dataplot3, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="", col = "black")
    })
with(dataplot3, {
    points(Sub_metering_2~Datetime, type="l", col = "red")
    })
with(dataplot3, {
    points(Sub_metering_3~Datetime, type="l", col = "blue")
})
legend("topright", col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2)

# 3. Create plot3.png file
dev.print(png, file = "plot3.png", width=480, height=480)
dev.off()  # Close the Graphical Device

# Please look at plot3.png file for the result
