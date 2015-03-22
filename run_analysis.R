###  Getting and Cleaning Data Course Project:  run_analysis.R
###
###  Developer notes:  
##E  1. R version used:  3.1.2 
###  2. Platform:  x86_64-apple-darwin13.4.0 (64-bit)
###
###  Description:  Create one R script that does the following:
###  1. Merges the training and the test sets to create one data set.
###  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
###  3. Uses descriptive activity names to name the activities in the data set
###  4. Appropriately labels the data set with descriptive variable names. 
###  5. From the data set in step 4, create a second, independent tidy data set with the average of 
###     each variable for each activity and each subject.

library("dplyr")
library("plyr")

setwd("~/Desktop/Data Science Coursera/Getting and Cleaning Data/course project/UCI HAR Dataset")


# 'features.txt': vector containing the variables that were estimated from the measured signals
features <- read.table("features.txt", header=F) 
features <- features[c(-1)]  
features <- as.list(t(features)) 


# Read training data and associated class labels / subject identifiers
X_train <- read.table("./train/X_train.txt", header=F)
y_train <- read.table("./train/y_train.txt", header=F)
subject_train <- read.table("./train/subject_train.txt", header=F)

colnames(X_train) <- features  
train <- cbind(subject_train, y_train, X_train)
colnames(train)[1:2] <- c("Subject", "Class")


# Read test data and associated class labels / subject identifiers
X_test <- read.table("./test/X_test.txt", header=F)
y_test <- read.table("./test/y_test.txt", header=F)
subject_test <- read.table("./test/subject_test.txt", header=F)

colnames(X_test) <- features
test <- cbind(subject_test, y_test, X_test)
colnames(test)[1:2] <- c("Subject", "Class")


# Uses descriptive activity names to name the activities in the merged data set, 'all'
# 'activity_labels.txt': Links the class labels with their activity name, then assign colunm labels.
activity_labels <- read.csv("activity_labels.txt", sep=' ', header=F)
colnames(activity_labels) <- c("Class", "Activity")


# Merges the training and the test sets to create one data set.
all <- rbind(train, test)
all <- merge(activity_labels, all, by="Class")


# Extracts only the measurements on the mean and standard deviation for each measurement.
avgstd <- all[ , grep( "mean|std|Class|Subject|Activity", names(all)) ]


# Appropriately labels the data set with descriptive variable names. 
names(avgstd) <- gsub("^t", "Time", names(avgstd))
names(avgstd) <- gsub("^f", "Frequency", names(avgstd))
names(avgstd) <- gsub("Acc", "Accelerometer", names(avgstd))
names(avgstd) <- gsub("Gyro", "Gyroscope", names(avgstd))
names(avgstd) <- gsub("Mag", "Magnitude", names(avgstd))
names(avgstd) <- gsub("BodyBody", "Body", names(avgstd))
names(avgstd) <- gsub("-", "_", names(avgstd))


# Create a tidy dataset calculating column averages by Subject and Activity
tidy <- ddply(avgstd, c("Subject", "Activity"), numcolwise(mean))

# Update descriptive variable names to reflect the column mean averages
names(tidy) [c(4:ncol(tidy))] <- paste("Mean", names(tidy) [c(4:ncol(tidy))], sep="_")

# Create a tidy data set in txt format.
write.table(tidy, file="tidy.txt", row.names=F)
