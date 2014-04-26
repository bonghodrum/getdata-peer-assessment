library(data.table)

#Merging training and testing X files 
x <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"),read.table("UCI HAR Dataset/test/X_test.txt"))

#Setting more descriptive names for X columns
features <-read.table("UCI HAR Dataset/features.txt")
colnames(x) <- unlist(lapply(tolower(features[,2]), FUN=function(x){x<-gsub("\\-","\\_",x);  gsub("\\(|\\)","",x)}))

#Merging training and testing Y files
y<- rbind(read.table("UCI HAR Dataset/train/y_train.txt"), read.table("UCI HAR Dataset/test/y_test.txt"))
colnames(y)<-c("activity_id")

#Merging training and testing subject files
subject<- rbind(read.table("UCI HAR Dataset/train/subject_train.txt"), read.table("UCI HAR Dataset/test/subject_test.txt"))
colnames(subject) <-c("subject_id")

#Merging subject, X, and Y columns
raw_data<-cbind(subject,x,y)

#Extracting only columns related to the mean and standard deviation of sensor data to create first tidy data set
tidy_data <- data.table(raw_data[ , grep("activity_id|subject_id|.*_mean_|.*_std_",names(raw_data))])

#Adding activity_label column to tidy_data which is more descriptive than the activity_id column
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("activity_id","activity_name")
activity_table <- data.table(activity_labels,key="activity_id")
tidy_data[,activity_name:=activity_table[activity_id]$activity_name]
tidy_data[,activity_id:=NULL]

#summarizing data by activity and subject_id
tidy_data_2<-tidy_data[,lapply(.SD,mean),by=list(activity_name,subject_id)]


