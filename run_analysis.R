##For the project, you will be required to submit: 
##A) a tidy data set as described below, 
##B) a link to a Github repository with your script for performing the analysis, and 
##C) a code book that describes the variables, the data, and any transformations or work that you performed to 
##clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This 
##repo explains how all of the scripts work and how they are connected.  

##This R script (run_analysis.R) that does the following. 
##1) Merges the training and the test sets to create one data set.
##2) Extracts only the measurements on the mean and standard deviation for each measurement. 
##3) Uses descriptive activity names to name the activities in the data set
##4) Appropriately labels the data set with descriptive variable names. 
##5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
##for each activity and each subject.

##Assumptions:
##i) Implementation of this script is based on the interpretation of the requirements clarified in this post: 
##"https://class.coursera.org/getdata-013/forum/thread?thread_id=30"
##ii) the "run_analysis.R" script is stored in the current R working directory.
##iii) the zip pakcage data has been downloaded from the source to your local computer which has been unzipped.
##iv) the unzipped folder is called "UCI HAR Dataset" and is stored in the root of the current R working directory.


## Clean up workspace
rm(list=ls())

## Set working directory to the location where the UCI HAR Dataset was unzipped
setwd("C:/Users/teresa/Downloads/coursera/data cleaning/assignment/project")

## Load necessary librararies
if (!require("dlyr")) {
  install.packages("dplyr")
  library(dplyr)
}
if (!require("reshape2")) {
  install.packages("reshape2")
  library(reshape2)
}

## 1) Merges the training and the test sets to create one data set.

## Load files for labelling
activityTypes <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, blank.lines.skip=TRUE)
features <- read.table('./UCI HAR Dataset/features.txt', header=FALSE, blank.lines.skip=TRUE)

## Load train data files, select the required columns, label  the columns and merge them 
subjectTrain <- read.table('./UCI HAR Dataset/train/subject_train.txt', header=FALSE, blank.lines.skip=TRUE)
xTrain <- read.table('./UCI HAR Dataset/train/x_train.txt', header=FALSE, blank.lines.skip=TRUE)
yTrain <- read.table('./UCI HAR Dataset/train/y_train.txt', header=FALSE, blank.lines.skip=TRUE)

## Tidy up and combine train data
# assign headers - fulfiled requirement #4
colnames(activityTypes) <- c('activityId','activityType')
colnames(subjectTrain) <- "subjectId"
colnames(xTrain) <- features[,2] 
colnames(yTrain) <- "activityId"
# combine train data
trainData = cbind(subjectTrain,yTrain,xTrain)


## Load test data files, select the required columns, label  the columns and merge them 
subjectTest <- read.table('./UCI HAR Dataset/test/subject_test.txt', header=FALSE, blank.lines.skip=TRUE)
xTest <- read.table('./UCI HAR Dataset/test/x_test.txt', header=FALSE, blank.lines.skip=TRUE)
yTest <- read.table('./UCI HAR Dataset/test/y_test.txt', header=FALSE, blank.lines.skip=TRUE)

## Tidy up and combine test data
# assign headers - fulfiled requirement #4
colnames(subjectTest) <- "subjectId"
colnames(xTest) <- features[,2] 
colnames(yTest) <- "activityId"
# combine test data
testData = cbind(subjectTest,yTest,xTest)

## combine train and test data - fulfiled requirement #1 
tmpData = rbind(trainData,testData)


## 2) Extracts only the measurements on the mean and standard deviation for each measurement.

## Get column names of file created in step 1 
tmpDataColNames <- colnames(tmpData)
## Find column names that indicates mean or standard deviation along with "subjectId" and "activityId"
extractFeatures <- grepl("subjectId|activityId|mean|std", tmpDataColNames)
## Subset only measurements on the mean and standard deviation for each measurement - fulfiled requirement #2
df <- tmpData[,extractFeatures]


## 3) Uses descriptive activity names to name the activities in the data set.
## Merge with activityTypes object to get the activity names
finalData <- merge(df,activityTypes,by="activityId")


##4) Appropriately labels the data set with descriptive variable names - already fulfiled in step 1 above.


##5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
##for each activity and each subject.

# Reshape the file
fdColNames <- colnames(finalData)
# Define ID labels
idLabels <- c("subjectId", "activityId", "activityType")
# Define other variable labels
dataLabels <- setdiff(fdColNames, idLabels)
meltData <- melt(finalData, id = idLabels, measure.vars = dataLabels)
# Apply mean function to dataset using dcast function
tidyData <- dcast(meltData, subjectId + activityId + activityType ~ variable, mean)

# Export the second, tidy dataset
write.table(tidyData, file="./tidyData-mean.txt", row.names=FALSE, sep="\t")

