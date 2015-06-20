## Getting and Cleaning Data Course Project
## Jose Almaraz, June 2015

## 1. Merging the training and the test sets to create one data set.
  
    ## Reading files to be merged
xTrain <- read.table("./train/X_train.txt") ## Training sets
yTrain <- read.table("./train/y_train.txt") ## Training labels
subjectTrain <- read.table("./train/subject_train.txt") ## Subject who performed activity


xTest <- read.table("test/X_test.txt") ## Tests sets
yTest <- read.table("test/y_test.txt") ## Tests labels
subjectTest <- read.table("test/subject_test.txt") ## Subject who performed test
dim(xTrain); dim(yTrain); dim(subjectTrain)

   ## Creating "X" data set
dataX <- rbind(xTrain, xTest)

  ## Creating "Y" data set
dataY <- rbind(yTrain, yTest)

  ## Creating "Subject" data set
dataSubject <- rbind(subjectTrain, subjectTest)
  
  ## Merging all three datasets into one and renaming subject and label column
dataset <- cbind(dataSubject, dataY, dataX)
names(dataset)[1] <- "Subject"
names(dataset)[2] <- "Label"

## 2. Extracting only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt")
head(features); dim(features)
  ## Getting only columns with mean() or std()
MeanAndStdDev <- grep("-(mean|std)\\(\\)", features[, 2])

  ## Subsetting 
dataX <- dataX[, MeanAndStdDev]

  ## Correcting the column names
names(dataX) <- features[MeanAndStdDev, 2]
head(dataX)

## 3. Using descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

  ## Updating values
dataY[, 1] <- activities[dataY[, 1], 2]

  # correcting column name
names(dataY) <- "ActivityLabel"

## 4. Appropriately labeling the data set with descriptive variable names
names(dataSubject) <- "Subject"


## 5. Creating a second, independent tidy data set with the average of each variable for 
## each activity and each subject

  ## Updating dataset
dataset2 <- cbind(dataSubject, dataY, dataX)
dim(dataset2)

  ## Applying average to subjcet and activity
library(plyr)
dataAvg <- ddply(dataset2, .("Subject", "ActivityLabel"), function(x) colMeans(x[, 3:68]))
write.table(dataset2, "dataAvg.txt", row.name=FALSE)

## Final data check
checkData <- read.table("dataAvg.txt")
head(checkData)
