# Getting and Cleaning Data Course Project

# Rawdata

1.'features.txt':  List of all the variables in the feature vectors.  There are 561 rows representing the variables of the feature vector.

The accelerometer, gyroscope, and jerk signals below were used to estimate variables of the feature vector for each pattern ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag
	
The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.
	
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
	
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

__Processing:__  After reading data, drop first column and assign resulting data to a list object.  The list will be used to apply descriptive labels to the features data.

2. 'X_train.txt':  Training data where each feature vector is a row and the columns are the measurements described above.  There are 561 columns, 7352 rows, and no column labels are present.  

__Processing:__  Assign column names using the created features list.
   
3. 'y_train.txt':  Numeric training class labels. 7352 rows, 1 column for the class.
4. 'subject_train.txt':  Each row identifies the subject who performed the activity for each window sample. There are 7352 rows and 1 column for the subject ID.
    
__Processing:__  Combine columns of all 3 train data sets and assign 'Subject' and 'Class' labels.  Every column in the combined train data now have descriptive labels.
    
5. 'X_test.txt':  Test data where each feature vector is a row and the columns are the measurements described above.  There are 561 columns, 2947 rows, and no column labels are present.  
   
__Processing:__  Assign column names using the created features list.
  
6. 'y_test.txt':  Numeric test class labels. 2947 rows, 1 column for the class.
7. 'subject_test.txt':  Each row identifies the subject who performed the activity for each window sample. There are 2947 rows and 1 column for the subject ID.
    
__Processing:__  Combine columns of all 3 test data sets and assign 'Subject' and 'Class' labels.  Every column in the combined test data now have descriptive labels.
    
8. 'activity_labels.txt': File which links the class labels with their activity name.  The 6 activities are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.  There are 2 columns (class) and 6 rows (activity).
   
__Processing:__  
1. Assign 'Class' and 'Activity' labels.
2. Combine train, test, and activity label data, named 'all'.
3. Extract only the measurements on the mean and standard deviation for each measurement, named 'avgstd'.
4. Update labels the data set with descriptive variable names. 

# Processed Data

* Using the extracted mean/standard deviation data (avgstd), calculate column averages by subject and activity.
* Create a tidy data set, 'tidy', containing these new derivations, subject, activity, and class.  Set row.names to FALSE.
