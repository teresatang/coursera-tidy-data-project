# Getting and Cleaning Data Project (coursera)
The files in this folder include the R script (run_anlaysis.R) for solving the Coursera Getting and Cleaning Data Project, and two documents that explain this project (current document) and a code book (CodeBook.md) for the output data file. Details of the project can be found here: https://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3/submissions

The data file for this project "Human Activity Recognition Using Smartphones Dataset" comes from the UCI Machine Learning Repository. A description of the dataset can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The dataset can be downloaded at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Project Requirements
The tasks that I have accomplished in the R script include:
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# The R script
The R script will address the 5 requirements listed above. Please refer to CodeBook.md for details about transformation made to the data and how to run the script.

# The Code Book
The code book file **CodeBook.md** describes the variables of the output dataset (tidyData-mean.txt) from the R script (run_anlaysis.R) and the data, and any transformations or work that I performed to clean up the data.