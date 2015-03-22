# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. Additionally, a tidy data set will be prepared that can be  used for later analysis. 

The following are required: 

1. A tidy data set as described below under Processed Data Information.
2. A link to a Github repository with your script for performing the analysis.
3. A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called Codebook.md. 
    
# General Data Information

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked in the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Data for the project were acquired from:

(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

# Raw Data Information

The raw data are listed in order of processing by run_analysis.R:

* 'features.txt':  List of all the variables in the feature vectors for both the test and train data.
* 'X_train.txt':  Training data where each feature vector is a row on the text file.
* 'y_train.txt':  Numeric training class labels.  
* 'subject_train.txt':  Each row identifies the subject who performed the activity for each window sample. 
* 'X_test.txt':  Test data where each feature vector is a row on the text file.
* 'y_test.txt':  Numeric test class labels.  
* 'subject_test.txt':  Each row identifies the subject who performed the activity for each window sample. 
* 'activity_labels.txt': File which links the class labels with their activity name.  The 6 activities are walking, walking upstairs, walking downstairs, sitting, standing, and laying.

# Processed Data Information

* 'tidy.txt':  Data set with the average of each feature variable for each activity and each subject.

# Instruction List

Create one R script called run_analysis.R that does the following:
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  Upload the data set as a txt file created with write.table() using row.name=FALSE.
