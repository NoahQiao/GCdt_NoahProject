# SCRIPTS

```
# This project is the "Getting and Cleaning Data Course Project" by Noah
# The link in github is "https://github.com/NoahQiao/GCdt_NoahProject/blob/master/Scripts.md"
# 5 parts in this project as below

# 1. Merges the training and the test sets to create one data set.
# ==================================================================================
#
# > Step 1 : Input training & test datasets.

Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(Url,"./UCI/UCI.zip")
UCIzip<- unzip("./UCI/UCI.zip",exdir = "./UCI")
x_train <- read.table("./UCI/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI/UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./UCI/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI/UCI HAR Dataset/test/subject_test.txt")

# > Step 2 : Merge them.

traindt <- cbind(subject_train, y_train, x_train)
testdt <- cbind(subject_test, y_test, x_test)
finaldt <- rbind(traindt,testdt)


```
