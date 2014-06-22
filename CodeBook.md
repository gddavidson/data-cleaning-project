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


tBodyAcc.mean...X tBodyAcc-mean()-X

tBodyAcc.mean...Y tBodyAcc-mean()-Y

tBodyAcc.mean...Z tBodyAcc-mean()-Z
