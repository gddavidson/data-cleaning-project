data-cleaning-project
=====================

Code associated with project for Data Cleaning class

Running the R script file "run_analysis.R" requires that the working directory is set to the location of
the data within the "UCI HAR Dataset".  The script will process the data producing a tidy data set with 
averages of the specified variables (those containing means and standard deviations) for each subject and 
activity.

## Data processing steps

+ Labels are read in from the "activity_labels.txt" and "features.txt" files.  These will be used later.

+ Data are loaded from the training directory.  As data are loaded, we provide descriptive column names and 
+ add an "id" column which we will use to merge the "measurements", "activities", and "subjects" data frames

+ Data are loaded from the test directory.  As data are loaded, we provide descriptive column names and 
+ add an "id" column which we will use to merge the "measurements", "activities", and "subjects" data frames

+ Test and Training data frames are merged into a single frame for each.

+ The single merged data frames are combined into on large data frame

+ We extract the "activityCode", "subjectCode", and any columns containing a mean or std.  Our selection 
+ is based on the following grep "mean()|std()|subjectCode|activityCode"

+ We replace the "activityCode" numeric with a string description contained in the "activity_labels.txt"
+ file

+ We remove the now redundant "activityCode" column

+ We utilize the library "reshape2" to melt our data with ids of "activityDesc" and "subjectCode"

+ We cast the data into a dataframe to obtain the "mean" for each "activityDesc" and "subjectCode"
+ for all variables containing "mean" or "std".

+ We write out a tidy dataset into the working directory containing this information
