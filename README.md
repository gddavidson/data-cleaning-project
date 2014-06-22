data-cleaning-project
=====================

Code associated with project for Data Cleaning class

The script "run_analysis.R" will utilize data contained in the "UCI HAR Dataset" to produce a "tidy dataset"
containing one line per activity and subject with averages of those columns within "features.txt" that contain
the substrings "mean()" or "std()".  The output dataset features column labels from the "features.txt" file along
with "activityDesc" (activity descriptions obtained from "activity_labels.txt") and subjectCode (a number used to
differentiate subjects.)

The output will be contained in a file "averages.txt" located within the working directory.

Running the R script file "run_analysis.R" requires that the working directory is set to the location of
the data within the "UCI HAR Dataset".

The file "CodeBook.md" contains a description of the columns that are output in the "averages.txt" file along
with a reference to the "features_info.txt" file which contains information on the columns which are being
averaged.


## Data processing steps

+ Labels are read in from the "activity_labels.txt" and "features.txt" files.  These will be used later.

+ Data are loaded from the training directory.  As data are loaded, we provide descriptive column names for the 
measurements ("train/X_train.txt") obtained from the "features.txt" file and add an "id" column which we will use to merge the "measurements", "activities", and "subjects" data frames.

+ Data are loaded from the test directory.  As data are loaded, we provide descriptive column names for the 
measurements ("test/X_test.txt") obtained from the "features.txt" file and add an "id" column which we will use to merge the "measurements", "activities", and "subjects" data frames.

+ Test and Training data frames are merged into a single frame for each.  The merge adds the "activityCode" to the measurements matching by id and then adds the "subjectCode" to the measurements again matching by id.

+ The single merged data frames are combined into one large data frame with a "rbind" statement.

+ A new data frame is created based on extracting the "activityCode", "subjectCode", and any columns containing a mean or std.  Our selection is based on the following grep "mean()|std()|subjectCode|activityCode".

+ "activityCode", a numeric value, is replaced with a factor variable containing a descriptive string describing the activity contained in the "activity_labels.txt" file.

+ The now redundant "activityCode" column is removed.

+ Library "reshape2" is used to melt our data with "ids" of "activityDesc" and "subjectCode".  All remaining column are included as "values"

+ The melted data is cast into a dataframe to obtain the "mean" for each "activityDesc" and "subjectCode"
for all variables containing "mean()" or "std()".

+ We write out a tidy dataset into the working directory.  This file will be written to the working directory and be called "averages.txt".
