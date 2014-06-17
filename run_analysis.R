##You should create one R script called run_analysis.R that does the following. 
##Merges the training and the test sets to create one data set.
##Extracts only the measurements on the mean and standard deviation for each measurement. 
##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive variable names. 
##Creates a second, independent tidy data set with the average of each variable for each 
##activity and each subject. 

##Loads all data sets and merge them into one data set
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

data_set_X <- rbind(X_test,X_train)
data_set_Y <- rbind(y_test,y_train)
data_set <- cbind(data_set_Y,data_set_X)

data_set_subject <- rbind(subject_test,subject_train)

##Extractss only the measurements on the mean and standard deviation for each measurement. 
meancol <- grepl("mean()",features$V2)
sdcol <- grepl("std()",features$V2)
features <- subset(features,meancol|sdcol)
data_set <- data_set[,c(1,1+features$V1)]

##Uses descriptive activity names to name the activities in the data set
data_set <- merge(activity_labels,data_set,by.x ="V1",by.y = "V1")
data_set <- data_set[,-1]

##Appropriately labels the data set with descriptive variable names.
colnames(data_set) <- c("Activity",as.character(features[,2]))

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data_set_tidy <- cbind(data_set_subject,data_set) ## Join Subject Table
colnames(data_set_tidy) <- c("Subject",colnames(data_set))  ## Add Column Name for Subject
library(data.table) ## Use data.table for aggregating data set
DT <- data.table(data_set_tidy)  
data_set_tidy <- data.frame(DT[,lapply(.SD,mean),by = c("Activity,Subject")])
write.csv(data_set_tidy,"Tidy_Data_Set.txt")

