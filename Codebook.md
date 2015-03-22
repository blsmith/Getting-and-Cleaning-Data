# Getting and Cleaning Data Course Project

# Rawdata

__features.txt:__  List of all the variables in the feature vectors.  There are 561 rows representing the variables of the feature vector.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using 
a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the 
acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another 
low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using 
the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

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


__X_train.txt:__  Training data where each feature vector is a row and the columns are the measurements described above.  There are 561 columns, 7352 rows, and no column labels are present.  __Processing:__  Assign column names using the created features list.
 
__y_train.txt:__  Numeric training class labels. 7352 rows, 1 column for the class.

__subject_train.txt:__  Each row identifies the subject who performed the activity for each window sample. There are 7352 rows and 1 column for the subject ID.  __Processing:__  Combine columns of all 3 train data sets and assign 'Subject' and 'Class' labels.  Every column in the combined train data now have descriptive labels.
       
__X_test.txt:__  Test data where each feature vector is a row and the columns are the measurements described above.  There are 561 columns, 2947 rows, and no column labels are present.  __Processing:__  Assign column names using the created features list.

__y_test.txt__  Numeric test class labels. 2947 rows, 1 column for the class.

__subject_test.txt:__  Each row identifies the subject who performed the activity for each window sample. There are 2947 rows and 1 column for the subject ID.  __Processing:__  Combine columns of all 3 test data sets and assign 'Subject' and 'Class' labels.  Every column in the combined test data now have descriptive labels.

    
__activity_labels.txt:__ File which links the class labels with their activity name.  The 6 activities are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.  There are 2 columns (class) and 6 rows (activity). 
__Processing:__  
1. Assign 'Class' and 'Activity' labels.
2. Combine train, test, and activity label data, named 'all'.
3. Extract only the measurements on the mean and standard deviation for each measurement, named 'avgstd'.
4. Update labels the data set with descriptive variable names. 

# Processed Data

Using the extracted mean/standard deviation data (avgstd), calculate column averages by subject and activity.
Create a tidy data set, 'tidy', containing these new derivations, subject, activity, and class.  Set row.names to FALSE.

The data set contains 180 rows and 82 columns.  Each row represents the required mean calculations by subject and activity.
The column labels are: (1) Subject, (2) Activity, (3) Class, and (4-82) Mean_*existing variable name from feature vector* where the word _Mean_ is prefixed to the existing variable label.	

	 
