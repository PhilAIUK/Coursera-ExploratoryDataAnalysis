# Coursera Course - Exploratory Data Analysis
# Week 1 Assignment
# By PhilAIUK
# March 25, 2019

# R Code file to create Plot 2

# This file includes the following steps:
# - Read the data
# - Constructs Plot 2
# - Create plot2.png file

# 1. Read the data
# Set up a specific working directory for this assignment
setwd("/Users/Philippe1/DataCourse4Week1")

# Load the assignment Datase
# The dataset has 2,075,259 rows and 9 columns, and a header
# In this dataset missing values are coded as "?"
alldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# We will only be using data from the dates 2007-02-01 and 2007-02-02
dataplot2 <- subset(alldata, Date %in% c("1/2/2007","2/2/2007"))
# Convert the Date and Time variables to Date/Time classes in R
dataplot2$Date <- as.Date(dataplot2$Date, format="%d/%m/%Y")
# Create a new variable which contains both the Date and Time in the right format
datetime <- paste(as.Date(dataplot2$Date), dataplot2$Time)
dataplot2$Datetime <- as.POSIXct(datetime)

# 2. Construct Plot 2
with(dataplot2, {
    plot(Global_active_power~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    })

# 3. Create plot2.png file
dev.print(png, file = "plot2.png", width=480, height=480)
dev.off()  # Close the Graphical Device

# Please look at plot2.png file for the result
