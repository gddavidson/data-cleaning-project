# Load Column Labels for Activity and Measurements

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE,
                             col.names=c("activityCode", "activityDesc"))
measureLabels <- read.table("UCI HAR Dataset/features.txt",header=FALSE,
                            col.names=c("colNbr", "colLabel"))

# Load Training Datasets
#

# Load Measurements, adding the column labels retrieved above
measurements_train <- read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE,
                                 col.names=measureLabels[,"colLabel"])
# Add an "id" column for each measurement (to be used in merging)
measurements_train$id <- 1:nrow(measurements_train)

# Load Activities for each measurement, naming the column "activityCode"
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE,
                             col.names=c("activityCode"))
# Add an "id" column for each activity measurement (to be used in merging)
activity_train$id <- 1:nrow(activity_train)

# Load the Subjects involved in each measurement, naming the column "subjectCode"
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE,
                            col.names=c("subjectCode"))
# Add an "id" column for each subject measurement (to be used in merging)
subject_train$id <- 1:nrow(subject_train)


# Load Test Datasets
#

# Load Measurements, adding the column labels retrieved above
measurements_test <- read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE,
                                 col.names=measureLabels[,"colLabel"])
# Add an "id" column for each measurement (to be used in merging)
measurements_test$id <- 1:nrow(measurements_test)

# Load Activities for each measurement, naming the column "activityCode"
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE,
                             col.names=c("activityCode"))
# Add an "id" column for each activity measurement (to be used in merging)
activity_test$id <- 1:nrow(activity_test)

# Load the Subjects involved in each measurement, naming the column "subjectCode"
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE,
                            col.names=c("subjectCode"))
# Add an "id" column for each subject measurement (to be used in merging)
subject_test$id <- 1:nrow(subject_test)


# Merge Datasets to create a single dataset with one row per measurement, adding the
# subject and activity for each measurement

# Merging train datasets (measurement, activity, and subject) to create merged train data frame
mergedTrain <- merge(measurements_train,activity_train, by.x = "id", by.y = "id")
mergedTrain <- merge(mergedTrain, subject_train, by.x = "id", by.y = "id")

# Merging test datasets (measurement, activity, and subject) to create merged test data frame
mergedTest <- merge(measurements_test,activity_test, by.x = "id", by.y = "id")
mergedTest <- merge(mergedTest, subject_test, by.x = "id", by.y = "id")

# Combine Test and Train data frames into single data frame
#

####
#### 1. Merges the training and the test sets to create one data set.
####
mergedFrame <- rbind(mergedTrain,mergedTest)

####
#### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
####
####    I chose only columns with "mean()" or "std()" in the labels and "subjectCode" and "activityCode"

meansAndStd <- grep ("mean()|std()|subjectCode|activityCode",names(mergedFrame))
mergedExtFrame <- mergedFrame[,meansAndStd]

####
#### 3. Uses descriptive activity names to name the activities in the data set
####

# Adding "activityDesc" to frame where the activityCode is an index into the activity labels
mergedExtFrame$activityDesc <- activityLabels[mergedExtFrame$activityCode,"activityDesc"]

# Removing the "activityCode" as we have added the factor "activityDesc"
mergedExtFrame <- subset(mergedExtFrame,select=-activityCode)

####
####  4. Appropriately labels the data set with descriptive variable names. 
####
####     As we've built the data frames, we've added labels along the way.


####
####  5. Creates a second, independent tidy data set with the average of each variable 
####    for each activity and each subject. 
####
library(reshape2)
mergedExtMelt <- melt(mergedExtFrame,id=c("activityDesc","subjectCode"))
