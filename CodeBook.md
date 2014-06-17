## Code Book

## Description
The goal of this script is to prepare tidy data that can be used for later analysis.

## Data
Data is obtained from 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
where you can also find a detailed description of the data set.
 
##Variables
- subject_test: Data frame containing mapping between subjects and measurements for the test data set. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- X_test: Data frame containing test data.
- y_test: Data frame containing labels indicating the activity of test data.
- subject_train: Data frame containing mapping between subjects and measurements for the train data set. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- X_train: Data frame containing training data.
- y_train: Data frame containing labels indicating the activity of training data.
- activity_labels: Data frame containing mapping from the class labels with their activity name.
- features: Data frame containing the different feature names and IDs.
- data_set_X: Data frame containing both test and training data (union).
- data_set_Y: Data frame containing merged test and training labels (union).
- data_set: Data frame merging measurement data and activity labels.
- data_set_subject : Data frame containing mapping for subjects of both test and training data (union).
- meancol: Logical list indicating which measurements/columns are calculating the mean.
- sdcol: Logical list indicating which measurements/columns are calculating the standard deviation.
- data_set_tidy: Data frame containing desired tidy data set.
- DT: Data table used for aggregating data set.


## Script Functionalities
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5.   Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
### In Detail
 - Line 10 - 19: Read necessary data files
 - Line 21 - 25: Merge datasets
 - Line 28 - 29: Calculate vector indicating features that measure mean() or std()
 - Line 30: Reduce features to rows that either are mean() or std()
 - Line 31: Reduce data set to columns containing features that are either mean() or std()
 - Line 34 - 38: Replace activity IDs with labels and rename column names of data set.
 - Line 41 - 42: Merge data set with subject mapping and rename column names.
 - Line 43 - 44: Load data table package and transform data set to a data table in order to calculate aggregations.
 - Line 45: Calculate aggreagtions and transform data set back to a data frame (optional).
 - Line 46: Write tidy data set to a text file.
