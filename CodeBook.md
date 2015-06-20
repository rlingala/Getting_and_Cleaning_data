## CodeBook.md

### Description

Additional information about the variables, data and transformations or work that you performed to clean up the data called CodeBook.md. It is used in 
the course project for the Johns Hopkins Getting and Cleaning Data course.

A full description of the data used in this project can be found at The UCI Machine Learning Repository


### Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on 
the waist.Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers
was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows 
of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated 
using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time 
and frequency domain.

### Introduction:

My  R script run_analysis.R performs the 5 steps described in the course project's definition.

1. First, all the similar kind of data is merged using the rbind() function, these files are having the same number of observations.

2. Then, only those columns containg mean and sd measures are taken from the dataset using grepl(). Given the correct names using names() after 
   extracting from the dataset. 

3. As activity dataset is addressed with values from 1 to 6, we take the activity ID'S and names from activity dataset and replaced in the dataset.

4. In the subject dataset the column ID's changed  to subject facor variable, labeling the dataset with descriptive activity names.
   Using the cbind() all three datasets are combined into a large tidy dataset.

5. Finally, generated a new  tidy dataset with all the average measures for each subject and activity type.
   The averages tidy dataset file is  tidyData.txt, and uploaded to Github repository.
   
### Variables:
   
Steps:

1. Read the xTrain, yTrain, subjectTrain and  yTrain, yTest, subjectTest data using the read.table() from downloaded files.
   Merged the xdata,yData and subjectData using rbind() for data analysis.

2. The data file features contains the correct column names for the xData dataset. Extracted the desired data using the numeric vector.

3. Read the activitylabels data using read.table()and updated the columns with correct activity names.

4. Labeling the dataset with descriptive activity names and binding all the datasets into a large dataset.

5. Using the ddply() to calculate the  average of each variable for each activity and each subject and saved the data into .txt file
   

