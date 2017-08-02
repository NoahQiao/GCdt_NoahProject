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

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# ==================================================================================
#
# > Step 1 : Input features.

feature <- read.table("./UCI/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[,2]

# > Step 2 : Extract the mean/std from features, then get their row num.

fi <- grep(("mean\\(|std\\("), feature)
exdt <- finaldt[, c(1, 2, fi+2)]
colnames(exdt) <- c("subject", "activity", feature[fi])

# 3. Uses descriptive activity names to name the activities in the data set.
# ==================================================================================
#
# > Step 1 : Input activity names.

actname <- read.table("./UCI/UCI HAR Dataset/activity_labels.txt")

# > Step 2 : Replace them in exdt.

exdt$activity <- factor(exdt$activity, levels = actname[,1], labels = actname[,2])

# 4. Appropriately labels the data set with descriptive variable names.
# ==================================================================================

names(exdt) <- gsub("\\()", "", names(exdt))
names(exdt) <- gsub("^t", "time", names(exdt))
names(exdt) <- gsub("^f", "frequence", names(exdt))
names(exdt) <- gsub("-mean", "Mean", names(exdt))
names(exdt) <- gsub("-std", "Std", names(exdt))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# ==================================================================================

library(dplyr)
groupdt <- exdt %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean))

write.table(groupdt, "./Tidydata.txt", row.names = FALSE)