## 1)Merges the training and the test sets to create one data set.

X<- rbind(xtrain, xtest)            ## Binds the rows of xtest and xtrain
Y<- rbind(ytrain, ytest)            ## Binds the rows of ytest and ytrain
Subject<- rbind(subtrain, subtest)  ## Binds the rows of subtest and subtrain
merged_data<- cbind(Subject, Y, X)  ## Binds the columns X, Y, Subject

## 2)Extracts only the measurements on the mean and standard deviation for each measurement.

tidydata<- merged_data%>%select(subject, code, contains("mean"), contains("std"))   
## Using chain operator, selects only subject and code columns, measurements containing mean and standard deviation in merged_data

## 3)Uses descriptive activity names to name the activities in the data set.

tidydata$code<- activities[tidydata$code, 2]     ## Subsets code and second one in the activities.

## 4)Appropriately labels the data set with descriptive variable names.

names(tidydata)[2]= "activity"
names(tidydata)<- gsub("Acc", "Accelerometer", names(tidydata))
names(tidydata)<- gsub("Gyro", "Gyroscope", names(tidydata))
names(tidydata)<- gsub("BodyBody", "Body", names(tidydata))
names(tidydata)<- gsub("Mag", "Magnitude", names(tidydata))
names(tidydata)<- gsub("^t", "Time", names(tidydata))
names(tidydata)<- gsub("^f", "Frequency", names(tidydata))
names(tidydata)<- gsub("tBody", "TimeBody", names(tidydata))
names(tidydata)<- gsub("-mean()", "Mean", names(tidydata), ignore.case=TRUE)
names(tidydata)<- gsub("-std()", "STD", names(tidydata), ignore.case=TRUE)
names(tidydata)<- gsub("-freq()", "Frequency", names(tidydata), ignore.case=TRUE)
names(tidydata)<- gsub("angle", "Angle", names(tidydata))
names(tidydata)<- gsub("gravity", "Gravity", names(tidydata))

## 5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Finaldata<- tidydata%>%group_by(subject, activity)%>%summarize_all(funs(mean))
## group tidydata by subject and activity and summarize the mean as asked
write.table(Finaldata, "Finaldata.txt", row.name=FALSE)
## create a new dataset as asked

