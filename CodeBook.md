# Data Dictionary - Averages by activityDesc, subjectCode

Averages are calculated for a subset of the variables in the features.txt file containing avg() or std()

## activityDesc

Factor Variable where the Value is a Description of the Activity.  This variable is derived where the activity code is replaced by the text description using the values in the "activity_labels.txt" file.  Valid values are:

+ WALKING
+ WALKING_UPSTAIRS
+ WALKING_DOWNSTAIRS
+ SITTING
+ STANDING
+ LAYING

## subjectCode

A unique code used to identify subjects.

+ Valid subject codes are integers in range 1 to 30

## Remaining Columns (Averages)

The remaining columns are averages by activityDesc, subjectCode for a subset of variables described in the "features_info.txt" file included in the "UCI HAR Dataset".  This subset is derived by selecting any values within the "features.txt" file that includes the character
strings "mean()" or "std()".

Note that the columns names are alterered from their appearance in "features.txt".  Anywhere the characters "()" appear
they are replaces with "...".  The mapping is as follows:


    tBodyAcc.mean...X    tBodyAcc-mean()-X
    tBodyAcc.mean...Y    tBodyAcc-mean()-Y
    tBodyAcc.mean...Z    tBodyAcc-mean()-Z
    ...

The complete list of columns is as follows:

    tBodyAcc.mean...X
    tBodyAcc.mean...Y
    tBodyAcc.mean...Z
    tBodyAcc.std...X
    tBodyAcc.std...Y
    tBodyAcc.std...Z
    tGravityAcc.mean...X
    tGravityAcc.mean...Y
    tGravityAcc.mean...Z
    tGravityAcc.std...X
    tGravityAcc.std...Y
    tGravityAcc.std...Z
    tBodyAccJerk.mean...X
    tBodyAccJerk.mean...Y
    tBodyAccJerk.mean...Z
    tBodyAccJerk.std...X
    tBodyAccJerk.std...Y
    tBodyAccJerk.std...Z
    tBodyGyro.mean...X
    tBodyGyro.mean...Y
    tBodyGyro.mean...Z
    tBodyGyro.std...X
    tBodyGyro.std...Y
    tBodyGyro.std...Z
    tBodyGyroJerk.mean...X
    tBodyGyroJerk.mean...Y
    tBodyGyroJerk.mean...Z
    tBodyGyroJerk.std...X
    tBodyGyroJerk.std...Y
    tBodyGyroJerk.std...Z
    tBodyAccMag.mean..
    tBodyAccMag.std..
    tGravityAccMag.mean..
    tGravityAccMag.std..
    tBodyAccJerkMag.mean..
    tBodyAccJerkMag.std..
    tBodyGyroMag.mean..
    tBodyGyroMag.std..
    tBodyGyroJerkMag.mean..
    tBodyGyroJerkMag.std..
    fBodyAcc.mean...X
    fBodyAcc.mean...Y
    fBodyAcc.mean...Z
    fBodyAcc.std...X
    fBodyAcc.std...Y
    fBodyAcc.std...Z
    fBodyAcc.meanFreq...X
    fBodyAcc.meanFreq...Y
    fBodyAcc.meanFreq...Z
    fBodyAccJerk.mean...X
    fBodyAccJerk.mean...Y
    fBodyAccJerk.mean...Z
    fBodyAccJerk.std...X
    fBodyAccJerk.std...Y
    fBodyAccJerk.std...Z
    fBodyAccJerk.meanFreq...X
    fBodyAccJerk.meanFreq...Y
    fBodyAccJerk.meanFreq...Z
    fBodyGyro.mean...X
    fBodyGyro.mean...Y
    fBodyGyro.mean...Z
    fBodyGyro.std...X
    fBodyGyro.std...Y
    fBodyGyro.std...Z
    fBodyGyro.meanFreq...X
    fBodyGyro.meanFreq...Y
    fBodyGyro.meanFreq...Z
    fBodyAccMag.mean..
    fBodyAccMag.std..
    fBodyAccMag.meanFreq..
    fBodyBodyAccJerkMag.mean..
    fBodyBodyAccJerkMag.std..
    fBodyBodyAccJerkMag.meanFreq..
    fBodyBodyGyroMag.mean..
    fBodyBodyGyroMag.std..
    fBodyBodyGyroMag.meanFreq..
    fBodyBodyGyroJerkMag.mean..
    fBodyBodyGyroJerkMag.std..
    fBodyBodyGyroJerkMag.meanFreq..
    

    
