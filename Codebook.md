1)The run_analysis.R file is the script where the code for the peer-graded assignment for the course "Getting and cleaning data" is written. It contains the code for all the actions mentioned in the assignment question.


2)Download the raw unzipped data file, extract the folder "UCI HAR Dataset" from it.


3)Assign the data in the folder to the variables as follows:
features<- "....features.txt": (561 rows, 2 cols)
 ## This contains the data from Accelerometer and Gyroscope.
activities<- "....activity_label.txt": (6 rows, 2 cols)
 ## This contains a list of 6 labels each for one activity with codes.
subtrain<- "....train/subject_train.txt":(7352 rows, 1 cols)
 ## This contains train data of subjects being observed.
subtest<- "....test/subject_test.txt": (2947 rows, 1 cols)
 ## This contains the test data of subjects being observed.
xtest<- "....test/X_test.txt": (2947 rows, 561 cols)
 ## This contains recorded features of test data.
ytest<- "....test/y_test.txt": (2947 rows, 1 cols)
 ## This contains test data of codes of the activity labels.
xtrain<- "....train/X_train.txt": (7352 rows, 561 cols)
 ## This contains recorded features of train data.
ytrain<- "....train/y_train.txt": (7352 rows, 1 cols)
 ## This contains train data of codes of the activity labels.
 
 
4)Merge the training and the test sets to create one data set. 
X: Created by merging 'xtrain' and 'xtest' using rbind() function (10299 rows, 561 cols)
Y: Created by merging 'ytrain' and 'ytest' using rbind() function (10299 rows, 1 cols)
Subject: Created by merging 'subtrain' and 'subtest' using rbind() function (10299 rows, 1 cols)
merged_data: Created by merging X, Y, Subject using cbind() function (10299 rows, 563 cols)


5)Extract only the measurements on the mean and standard deviation for each measurement.
tidydata: Created by using chain operator, selects only 'subject' and 'code' columns, measurements containing 'mean' and standard deviation in 'merged_data' (10299 rows, 88 cols)


6)Use descriptive activity names to name the activities in the data set.
Entire numbers in the 'code' column of 'tidydata' replaced with corresponding activity taken from second column of the 'activities' variable 


7)Appropriately label the data set with descriptive variable names.
'Code' column in 'tidydata' renamed to 'activity', all 'Acc' to 'Accelerometer', all 'Gyro' to 'Gyroscope', all 'BodyBody' to 'Body', all 'Mag' to 'Magnitude' in column names. All that start with character 'f' are renamed to 'Frequency' and with character 't' to 'Time' in column names.


8)From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
Finaldata: Created by using the chain operator to group by subject and activity the 'tidydata' and summarizing it taking the mean of each variable for each activity and each subject (180 rows, 88 cols).
Export 'Finaldata' to 'Finaldata.txt' using write.table() function.
 
