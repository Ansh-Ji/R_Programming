# Coursera Week 4 peer graded assignment
#Getting all the test files
library('dplyr')

# collecting all the train data
train_y<-data.table::fread("./UCI HAR Dataset/train/y_train.txt")
train_x<-data.table::fread("./UCI HAR Dataset/train/X_train.txt")
train_subject<-data.table::fread("./UCI HAR Dataset/train/subject_train.txt")

#collecting all the test data
test_y<-data.table::fread("./UCI HAR Dataset/test/y_test.txt")
test_x<-data.table::fread("./UCI HAR Dataset/test/X_test.txt")
test_subject<-data.table::fread("./UCI HAR Dataset/test/subject_test.txt")

#getting names of all the features
features<-read.table("./UCI HAR Dataset/features.txt")

#Get the activity labels
activity<-read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity)<-c("activityid","activity-type")

#Question-01
#Merging the test and train dataset to create one dataset
merged_y<-rbind(train_y,test_y)
merged_x<-rbind(train_x,test_x)
merged_subject<-rbind(train_subject,test_subject)

#remove unwanted objects from the environment
rm(train_x,train_y,train_subject,test_x,test_y,test_subject)

#Assigning names to all the variables
colnames(merged_x)<-features[,2]
colnames(merged_y)<-"activityid"
colnames(merged_subject)<-"subjectid"
data_set<-cbind(merged_x,merged_y,merged_subject)

rm(merged_subject, merged_x, merged_y)

#Question-02
#Extract only the measurements on the mean and standard deviation for each measurement.
name<-colnames(data_set)
select_features <- features[grep(".*mean\\(\\)|std\\(\\)", features$V2,ignore.case = FALSE),]


#Subseting the data-set to get only the required columns
mean_sd_data<-select(data_set,c(select_features$V1,562,563))
rm(select_features,name,data_set)

#Question-03
#Use descriptive activity names to name the activities in the data set
tidydata<-merge(mean_sd_data,activity, by='activityid', all.x = TRUE)
head(tidydata)
rm(mean_sd_data)
tidydata$activityid <- factor(tidydata$activityid, levels = activity[,1], labels = activity[,2]) 
tidydata$subject  <- as.factor(tidydata$subject) 
rm(activity)
#Question-04
#Appropriately label the data set with descriptive variable names.
#Some part already done in part 1&2
names(tidydata)<-gsub("Acc", "Accelerometer", names(tidydata))
names(tidydata)<-gsub("Gyro", "Gyroscope", names(tidydata))
names(tidydata)<-gsub("BodyBody", "Body", names(tidydata))
names(tidydata)<-gsub("Mag", "Magnitude", names(tidydata))
names(tidydata)<-gsub("^t", "Time", names(tidydata))
names(tidydata)<-gsub("^f", "Frequency", names(tidydata))
names(tidydata)<-gsub("tBody", "TimeBody", names(tidydata))
names(tidydata)<-gsub("-mean()", "Mean", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("-std()", "STD", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("-freq()", "Frequency", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("angle", "Angle", names(tidydata))
names(tidydata)<-gsub("gravity", "Gravity", names(tidydata))
names(tidydata)<- gsub("[\\(\\)-]", "", names(tidydata))


#Question-05
#From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
finaldata <- tidydata %>%
  group_by(subjectid, activityid) %>% #Grouping by subject and activity
  summarise_all(funs(mean))
finaldata<-select(finaldata,c(1:68))

rm(tidydata)

#Writing the tidy dataset to a text-file
write.table(finaldata, "FinalData.txt", row.name=FALSE, sep = '\t')
