# CodeBook_NoahProject

I hope you could download the scripts and source it in your R IDE.
You could get the tidydata finally (I suggest you to use  *tdt <- read.table("./Tidydata.txt", header = T)* to read it)

***

1. subject
subject is the volunteers number, from 1 - 30
2. activity
activity is the performed 6 activities
including : WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
3. varieties
You can find the varieties description as below:

The varieties are the features for the database, which marked the data was what kinds of signal.
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
* timeBodyAcc-XYZ
* timeGravityAcc-XYZ
* timeBodyAccJerk-XYZ
* timeBodyGyro-XYZ
* timeBodyGyroJerk-XYZ
* timeBodyAccMag
* timeGravityAccMag
* timeBodyAccJerkMag
* timeBodyGyroMag
* timeBodyGyroJerkMag
* frequenceBodyAcc-XYZ
* frequenceBodyAccJerk-XYZ
* frequenceBodyGyro-XYZ
* frequenceBodyAccMag
* frequenceBodyAccJerkMag
* frequenceBodyGyroMag
* frequenceBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* Mean(): Mean value
* Std(): Standard deviation




