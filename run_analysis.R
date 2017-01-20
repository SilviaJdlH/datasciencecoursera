# load packages
library(plyr);

# 1. Merge the training and the test sets to create one data set.
# fI
FeaturesTest   <- read.table(file.path("test" , "X_test.txt" ), header = FALSE)
FeaturesTrain  <- read.table(file.path("train", "X_train.txt"), header = FALSE)
Features       <- rbind(FeaturesTrain, FeaturesTest)
features_Names          <- read.table("features.txt",head=FALSE)
names(Features)<- features_Names$V2 # set names for variables in Features

SubjectTest    <- read.table(file.path("test" , "subject_test.txt" ), header = FALSE)
SubjectTrain   <- read.table(file.path("train", "subject_train.txt"), header = FALSE)
Subject        <- rbind(SubjectTrain , SubjectTest)
names(Subject) <- c("Subject")# set names for variables in Subject

ActivityTest   <- read.table(file.path("test" , "Y_test.txt" ), header = FALSE)
ActivityTrain  <- read.table(file.path("train", "Y_train.txt"), header = FALSE)
Activity       <- rbind(ActivityTrain, ActivityTest)
names(Activity) <- c("Activity") #set names for variables in Activity


data_sub_act <- cbind(Subject, Activity)
data <- cbind(Features, data_sub_act)


# 2. Extracts only the measurements on the mean and standard deviation for 
# each measurement. 
mean_std_Names <- features_Names$V2[grep("mean\\(\\)|std\\(\\)", 
                                         features_Names$V2)]

Names <- c(as.character(mean_std_Names), "Subject", "Activity" )
Data  <- subset(data, select = Names)


# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt", head=FALSE)
Data$Activity   <- factor(Data$Activity)
Data$Activity   <- factor(Data$Activity, labels=as.character(activity_labels$V2))

# 4. Appropriately labels the data set with descriptive variable names. 

names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))


# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

data2<-aggregate(. ~Subject + Activity, Data, mean)
data2<-data2[order(data2$Subject,data2$Activity),]
write.table(data2, file = "data2.txt",row.name=FALSE)









