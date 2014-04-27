library(data.table)

#Merging training and testing X files 
x <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"),read.table("UCI HAR Dataset/test/X_test.txt"))

#Setting more descriptive names for X columns
features <-read.table("UCI HAR Dataset/features.txt")
normalize_columns<-function(x) {  
  x<-tolower(x)
  x<-gsub("^f","frequency_",x);
  x<-gsub("^t","time_",x); x
  x<-gsub("\\-","\\_",x); 
  x<-gsub("\\,","\\_",x); 
  x<-gsub("\\(|\\)","_",x); 
  x<-gsub("body|bodybody","body_",x);
  x<-gsub("gravity","gravity_",x);
  x<-gsub("mag","magnitude_",x);
  x<-gsub("gyro","gyroscope_",x);
  x<-gsub("acc","acceleration_",x);
  x<-gsub("jerk","jerk_",x);
  x<-gsub("(_)+","_",x);
  x<-gsub("_$","",x);
}
colnames(x)<-unlist(lapply(features[,2], FUN=normalize_columns))

#Merging training and testing Y files
y<- rbind(read.table("UCI HAR Dataset/train/y_train.txt"), read.table("UCI HAR Dataset/test/y_test.txt"))
colnames(y)<-c("activity_id")

#Merging training and testing subject files
subject<- rbind(read.table("UCI HAR Dataset/train/subject_train.txt"), read.table("UCI HAR Dataset/test/subject_test.txt"))
colnames(subject) <-c("subject_id")

#Merging subject, X, and Y columns
raw_data<-cbind(subject,x,y)

#Extracting only columns related to the mean and standard deviation of sensor data to create first tidy data set
tidy_data <- data.table(raw_data[ , grep("activity_id|subject_id|(^(frequency|time).*(mean|std)(_|$))",names(raw_data))])

#Adding activity_label column to tidy_data which is more descriptive than the activity_id column
activity_table <- data.table(read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activity_id","activity_name")), key="activity_id")
tidy_data[,activity_name:=activity_table[activity_id]$activity_name]
tidy_data[,activity_id:=NULL]
write.table(tidy_data, file="sensor_means_and_std.tsv", row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)

#summarizing data by activity and subject_id
tidy_data_2<-tidy_data[,lapply(.SD,mean),by=list(activity_name,subject_id)]
write.table(tidy_data_2, file="sensor_means_and_std_grouped_by_activity_and_subject.tsv", row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)


