## Getting and Cleaning Data : Course Project
## uisng the Human Activity Recognition Using Smartphones Data Set 
## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#########################################################################
## Step 1: Merges the training and the test sets to create one data set.
#########################################################################

## read the x_train, y_train and subject_train  data  using read.table()

xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

## read the x_test, y_test and subject_test  data  using read.table()

xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

# merge the two raw data tables together, row-wise.
# create 'x_data' data set using the rbind() combines the rows of x_train and x_test
xData <- rbind(xTrain, xTest)


# create 'y_data' data set using the rbind() combines the rows of y_train and y_test
yData <- rbind(yTrain, yTest)

# merge the two subject codes lists
# create 'subject_data' data set using the rbind() combines the rows of Subject_train and Subject_test

subjectData <- rbind(subjectTrain, subjectTest)

############################################################################################
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
############################################################################################

## read the activity labels data using the read.table()
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

## read the features data using the read.table()
features <- read.table("UCI HAR Dataset/features.txt")
# identify all the features that are either standard deviations or means of measurements.
# The following code identifies a vector of boolean values that correspond to the means and
# standard deviation measures.

meanSdFeatures  <- grepl("(-std\\(\\)|-mean\\(\\))",features$V2)

## remove columns that are not having the means or sd features
## Subset this data to keep only the necessary columns.

extractData <- xData[, which(meanSdFeatures == TRUE)]

# finding  the correct the column names
## which are having mean,standard features

names(extractData) <- features[meanSdFeatures, 2]

###########################################################################
## 3. Uses descriptive activity names to name the activities in the data set
############################################################################

## read the activity labels data using the read.table()
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

# update the column names with correct activity names.

activityData <-activityLabels[yData[, 1], 2]

# correct the column name with "activity"

names(yData) <- "activity"


##################################################################
## 4. Appropriately labels the data set with descriptive activity names.
#################################################################

## changing subjectData to factor variable subject

subject <- as.factor(subjectData$V1)

## labeling the dataset with descriptive activity names
## bind all the data sets into one data set

combinedData <- cbind(extractData,activityData,subject)


######################################################################################################################
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
######################################################################################################################

## separate the activitiesdata and subject from data
## get the average of the extracted data using the colMeans()
## finding the average of the tidydata and split the unnecessary df using ddply()

averagesData <- ddply(combinedData, .(subject, activityData), function (avg) colMeans(avg[, 1:66]))

## creating the text file uisng write.table() for finding  the average of extractData

write.table(averagesData, "tidyData.txt", sep="\t", row.names = FALSE)


