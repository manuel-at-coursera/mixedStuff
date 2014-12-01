data <- read.csv("activity.csv")

head(data)

data

# Loading and preprocessing the data
setwd("foo/bar")
data <- read.csv("activity.csv")

# What is mean total number of steps taken per day?
library(ggplot2)
with(data, hist(steps, breaks="date"))


# What is the average daily activity pattern?

# Imputing missing values

# Are there differences in activity patterns between weekdays and weekends?

# 


task1 <- aggregate(data$steps ~ data$date, data=data, FUN=sum)
stepsPerDay <- aggregate(data$steps ~ data$date, data=data, FUN=sum)
qplot(task1[,2])

binwidth = 10

hist(task1[,2], 
     breaks=seq(min(task1[,2]),max(task1[,2]),l=length(task1[,2])+1))
?hist

hist(aggregate(data$steps ~ data$date, data=data, FUN=sum)[,2], breaks="FD")

length(task1[,2])

hist(task1[,2])

x <- rnorm(100)
mx <- mean(x)
hist(x)
abline(v = mx, col = "blue", lwd = 2)

bla bla blub


