# Code Book for the Tidy Dataset (tidyData-mean.txt)
This file describes the variables of the output dataset (tidyData-mean.txt) from the R script (run_anlaysis.R) and the data, and any transformations or work that I performed to clean up the data.

# The Data Source
Original description of the dataset can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 
The dataset can be downloaded at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Assumptions for Implementation
* Implementation of this R script (run_anlaysis.R) is based on the interpretation of the requirements clarified in this post: https://class.coursera.org/getdata-013/forum/thread?thread_id=30
* The "run_analysis.R" script should be stored in the current R working directory.
* The zip package data has been downloaded from the source to your local computer which has been unzipped.
* The unzipped folder is called "UCI HAR Dataset" and is stored in the root of the current R working directory.

# Transformation done in the R script (run_analysis.R) to clean up the data files
Step 1. Merge the training and the test sets to create one data set.
===
a) set the working directory in R
b) unzipped the data package downloaded from the source and placed the unzipped folder in the current working directory 
c) read the files (./UCI HAR Dataset/activity_labels.txt, ./UCI HAR Dataset/features.txt) that contained the data labels
d) loaded train data files (subjectTrain, xTrain, yTrain), labelled the columns and merged them using cbind().
e) loaded test data files (subjectTest, xTest, yTest), labelled the columns and merged them using cbind().
f) combined the train and test data files using rbind().

Step 2. Extract only the measurements on the mean and standard deviation for each measurement.
===
Used grepl() to create a logical vector that contains TRUE values for the subjectId, activityId, mean and standard deviation columns. Subset the combined data to keep only the necessary columns.

Step 3. Use descriptive activity names to name the activities in the dataset
===
Merged the combined dataset with the activityTypes table to include the descriptive activity names

Step 4. Appropriately label the data set with descriptive activity names.
===
Done in Step 1 while labelling the columns.

Step 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
===
Use melt and dcast functions to create a second , independent tidy data set with the average of each variable for each activity and each subject.


# Descriptions of the variables in the output data file (tidyData-mean.txt)
<table>
<tr><td>Variable Name</td><td>Description</td></tr>
<tr><td>subjectId</td><td>Subject ID</td></tr>
<tr><td>activityId</td><td>Activity ID</td></tr>
<tr><td>activityType</td><td>Activity Type</td></tr>
<tr><td>tBodyAcc-mean()-X</td><td>Mean of tBodyAcc-mean()-X</td></tr>
<tr><td>tBodyAcc-mean()-Y</td><td>Mean of tBodyAcc-mean()-Y</td></tr>
<tr><td>tBodyAcc-mean()-Z</td><td>Mean of tBodyAcc-mean()-Z</td></tr>
<tr><td>tBodyAcc-std()-X</td><td>Mean of tBodyAcc-std()-X</td></tr>
<tr><td>tBodyAcc-std()-Y</td><td>Mean of tBodyAcc-std()-Y</td></tr>
<tr><td>tBodyAcc-std()-Z</td><td>Mean of tBodyAcc-std()-Z</td></tr>
<tr><td>tGravityAcc-mean()-X</td><td>Mean of tGravityAcc-mean()-X</td></tr>
<tr><td>tGravityAcc-mean()-Y</td><td>Mean of tGravityAcc-mean()-Y</td></tr>
<tr><td>tGravityAcc-mean()-Z</td><td>Mean of tGravityAcc-mean()-Z</td></tr>
<tr><td>tGravityAcc-std()-X</td><td>Mean of tGravityAcc-std()-X</td></tr>
<tr><td>tGravityAcc-std()-Y</td><td>Mean of tGravityAcc-std()-Y</td></tr>
<tr><td>tGravityAcc-std()-Z</td><td>Mean of tGravityAcc-std()-Z</td></tr>
<tr><td>tBodyAccJerk-mean()-X</td><td>Mean of tBodyAccJerk-mean()-X</td></tr>
<tr><td>tBodyAccJerk-mean()-Y</td><td>Mean of tBodyAccJerk-mean()-Y</td></tr>
<tr><td>tBodyAccJerk-mean()-Z</td><td>Mean of tBodyAccJerk-mean()-Z</td></tr>
<tr><td>tBodyAccJerk-std()-X</td><td>Mean of tBodyAccJerk-std()-X</td></tr>
<tr><td>tBodyAccJerk-std()-Y</td><td>Mean of tBodyAccJerk-std()-Y</td></tr>
<tr><td>tBodyAccJerk-std()-Z</td><td>Mean of tBodyAccJerk-std()-Z</td></tr>
<tr><td>tBodyGyro-mean()-X</td><td>Mean of tBodyGyro-mean()-X</td></tr>
<tr><td>tBodyGyro-mean()-Y</td><td>Mean of tBodyGyro-mean()-Y</td></tr>
<tr><td>tBodyGyro-mean()-Z</td><td>Mean of tBodyGyro-mean()-Z</td></tr>
<tr><td>tBodyGyro-std()-X</td><td>Mean of tBodyGyro-std()-X</td></tr>
<tr><td>tBodyGyro-std()-Y</td><td>Mean of tBodyGyro-std()-Y</td></tr>
<tr><td>tBodyGyro-std()-Z</td><td>Mean of tBodyGyro-std()-Z</td></tr>
<tr><td>tBodyGyroJerk-mean()-X</td><td>Mean of tBodyGyroJerk-mean()-X</td></tr>
<tr><td>tBodyGyroJerk-mean()-Y</td><td>Mean of tBodyGyroJerk-mean()-Y</td></tr>
<tr><td>tBodyGyroJerk-mean()-Z</td><td>Mean of tBodyGyroJerk-mean()-Z</td></tr>
<tr><td>tBodyGyroJerk-std()-X</td><td>Mean of tBodyGyroJerk-std()-X</td></tr>
<tr><td>tBodyGyroJerk-std()-Y</td><td>Mean of tBodyGyroJerk-std()-Y</td></tr>
<tr><td>tBodyGyroJerk-std()-Z</td><td>Mean of tBodyGyroJerk-std()-Z</td></tr>
<tr><td>tBodyAccMag-mean()</td><td>Mean of tBodyAccMag-mean()</td></tr>
<tr><td>tBodyAccMag-std()</td><td>Mean of tBodyAccMag-std()</td></tr>
<tr><td>tGravityAccMag-mean()</td><td>Mean of tGravityAccMag-mean()</td></tr>
<tr><td>tGravityAccMag-std()</td><td>Mean of tGravityAccMag-std()</td></tr>
<tr><td>tBodyAccJerkMag-mean()</td><td>Mean of tBodyAccJerkMag-mean()</td></tr>
<tr><td>tBodyAccJerkMag-std()</td><td>Mean of tBodyAccJerkMag-std()</td></tr>
<tr><td>tBodyGyroMag-mean()</td><td>Mean of tBodyGyroMag-mean()</td></tr>
<tr><td>tBodyGyroMag-std()</td><td>Mean of tBodyGyroMag-std()</td></tr>
<tr><td>tBodyGyroJerkMag-mean()</td><td>Mean of tBodyGyroJerkMag-mean()</td></tr>
<tr><td>tBodyGyroJerkMag-std()</td><td>Mean of tBodyGyroJerkMag-std()</td></tr>
<tr><td>fBodyAcc-mean()-X</td><td>Mean of fBodyAcc-mean()-X</td></tr>
<tr><td>fBodyAcc-mean()-Y</td><td>Mean of fBodyAcc-mean()-Y</td></tr>
<tr><td>fBodyAcc-mean()-Z</td><td>Mean of fBodyAcc-mean()-Z</td></tr>
<tr><td>fBodyAcc-std()-X</td><td>Mean of fBodyAcc-std()-X</td></tr>
<tr><td>fBodyAcc-std()-Y</td><td>Mean of fBodyAcc-std()-Y</td></tr>
<tr><td>fBodyAcc-std()-Z</td><td>Mean of fBodyAcc-std()-Z</td></tr>
<tr><td>fBodyAcc-meanFreq()-X</td><td>Mean of fBodyAcc-meanFreq()-X</td></tr>
<tr><td>fBodyAcc-meanFreq()-Y</td><td>Mean of fBodyAcc-meanFreq()-Y</td></tr>
<tr><td>fBodyAcc-meanFreq()-Z</td><td>Mean of fBodyAcc-meanFreq()-Z</td></tr>
<tr><td>fBodyAccJerk-mean()-X</td><td>Mean of fBodyAccJerk-mean()-X</td></tr>
<tr><td>fBodyAccJerk-mean()-Y</td><td>Mean of fBodyAccJerk-mean()-Y</td></tr>
<tr><td>fBodyAccJerk-mean()-Z</td><td>Mean of fBodyAccJerk-mean()-Z</td></tr>
<tr><td>fBodyAccJerk-std()-X</td><td>Mean of fBodyAccJerk-std()-X</td></tr>
<tr><td>fBodyAccJerk-std()-Y</td><td>Mean of fBodyAccJerk-std()-Y</td></tr>
<tr><td>fBodyAccJerk-std()-Z</td><td>Mean of fBodyAccJerk-std()-Z</td></tr>
<tr><td>fBodyAccJerk-meanFreq()-X</td><td>Mean of fBodyAccJerk-meanFreq()-X</td></tr>
<tr><td>fBodyAccJerk-meanFreq()-Y</td><td>Mean of fBodyAccJerk-meanFreq()-Y</td></tr>
<tr><td>fBodyAccJerk-meanFreq()-Z</td><td>Mean of fBodyAccJerk-meanFreq()-Z</td></tr>
<tr><td>fBodyGyro-mean()-X</td><td>Mean of fBodyGyro-mean()-X</td></tr>
<tr><td>fBodyGyro-mean()-Y</td><td>Mean of fBodyGyro-mean()-Y</td></tr>
<tr><td>fBodyGyro-mean()-Z</td><td>Mean of fBodyGyro-mean()-Z</td></tr>
<tr><td>fBodyGyro-std()-X</td><td>Mean of fBodyGyro-std()-X</td></tr>
<tr><td>fBodyGyro-std()-Y</td><td>Mean of fBodyGyro-std()-Y</td></tr>
<tr><td>fBodyGyro-std()-Z</td><td>Mean of fBodyGyro-std()-Z</td></tr>
<tr><td>fBodyGyro-meanFreq()-X</td><td>Mean of fBodyGyro-meanFreq()-X</td></tr>
<tr><td>fBodyGyro-meanFreq()-Y</td><td>Mean of fBodyGyro-meanFreq()-Y</td></tr>
<tr><td>fBodyGyro-meanFreq()-Z</td><td>Mean of fBodyGyro-meanFreq()-Z</td></tr>
<tr><td>fBodyAccMag-mean()</td><td>Mean of fBodyAccMag-mean()</td></tr>
<tr><td>fBodyAccMag-std()</td><td>Mean of fBodyAccMag-std()</td></tr>
<tr><td>fBodyAccMag-meanFreq()</td><td>Mean of fBodyAccMag-meanFreq()</td></tr>
<tr><td>fBodyBodyAccJerkMag-mean()</td><td>Mean of fBodyBodyAccJerkMag-mean()</td></tr>
<tr><td>fBodyBodyAccJerkMag-std()</td><td>Mean of fBodyBodyAccJerkMag-std()</td></tr>
<tr><td>fBodyBodyAccJerkMag-meanFreq()</td><td>Mean of fBodyBodyAccJerkMag-meanFreq()</td></tr>
<tr><td>fBodyBodyGyroMag-mean()</td><td>Mean of fBodyBodyGyroMag-mean()</td></tr>
<tr><td>fBodyBodyGyroMag-std()</td><td>Mean of fBodyBodyGyroMag-std()</td></tr>
<tr><td>fBodyBodyGyroMag-meanFreq()</td><td>Mean of fBodyBodyGyroMag-meanFreq()</td></tr>
<tr><td>fBodyBodyGyroJerkMag-mean()</td><td>Mean of fBodyBodyGyroJerkMag-mean()</td></tr>
<tr><td>fBodyBodyGyroJerkMag-std()</td><td>Mean of fBodyBodyGyroJerkMag-std()</td></tr>
<tr><td>fBodyBodyGyroJerkMag-meanFreq()</td><td>Mean of fBodyBodyGyroJerkMag-meanFreq()</td></tr>
</table>

# Additional information about the variables in the output data file
**Extracted from "features_info.txt" in the original dataset downloaded from the source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
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