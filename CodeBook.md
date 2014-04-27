###Step 1: Download data collected from the accelerometers from the Samsung Galaxy S smartphone to current working directory.

This step will download the UCI sensor data described here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

You can also download the data here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

    source("download_data.R")
    	
###Step 2: Run run_analysis.R script to generate tidy data sets.

This step will generate two TSV files:

* sensor_means_and_std.tsv
* sensor_means_and_std_grouped_by_activity_and_subject.tsv

Code:

    source("run_analysis.R")
  
###Variable names for sensor_means_and_std.tsv
To create a tidy data set from the UHAR data, I only extracted the mean and std of 
the original signals were used to estimate variables of the feature vectors:

1. tBodyAcc-XYZ
2. tGravityAcc-XYZ
3. tBodyAccJerk-XYZ
4. tBodyGyro-XYZ
5. tBodyGyroJerk-XYZ
6. tBodyAccMag
7. tGravityAccMag
8. tBodyAccJerkMag
9. tBodyGyroMag
10. tBodyGyroJerkMag
11. fBodyAcc-XYZ
12. fBodyAccJerk-XYZ
13. fBodyGyro-XYZ
14. fBodyAccMag
15. fBodyAccJerkMag
16. fBodyGyroMag
17. fBodyGyroJerkMag

Here are resulting features in the our tidy data set. The column names have been updated to be self describing.

1.                                       subject_id
2.                    time_body_acceleration_mean_x
3.                    time_body_acceleration_mean_y
4.                    time_body_acceleration_mean_z
5.                     time_body_acceleration_std_x
6.                     time_body_acceleration_std_y
7.                     time_body_acceleration_std_z
8.                 time_gravity_acceleration_mean_x
9.                time_gravity_acceleration_mean_y
10.                time_gravity_acceleration_mean_z
11.                time_gravity_acceleration_std_x
12.                 time_gravity_acceleration_std_y
13.                 time_gravity_acceleration_std_z
14.              time_body_acceleration_jerk_mean_x
15.              time_body_acceleration_jerk_mean_y
16.              time_body_acceleration_jerk_mean_z
17.               time_body_acceleration_jerk_std_x
18.               time_body_acceleration_jerk_std_y
19.               time_body_acceleration_jerk_std_z
20.                      time_body_gyroscope_mean_x
21.                      time_body_gyroscope_mean_y
22.                      time_body_gyroscope_mean_z
23.                       time_body_gyroscope_std_x
24.                       time_body_gyroscope_std_y
25.                       time_body_gyroscope_std_z
26.                 time_body_gyroscope_jerk_mean_x
27.                 time_body_gyroscope_jerk_mean_y
28.                 time_body_gyroscope_jerk_mean_z
29.                  time_body_gyroscope_jerk_std_x
30.                  time_body_gyroscope_jerk_std_y
31.                  time_body_gyroscope_jerk_std_z
32.           time_body_acceleration_magnitude_mean
33.            time_body_acceleration_magnitude_std
34.        time_gravity_acceleration_magnitude_mean
35.         time_gravity_acceleration_magnitude_std
36.      time_body_acceleration_jerk_magnitude_mean
37.       time_body_acceleration_jerk_magnitude_std
38.              time_body_gyroscope_magnitude_mean
39.               time_body_gyroscope_magnitude_std
40.         time_body_gyroscope_jerk_magnitude_mean
41.          time_body_gyroscope_jerk_magnitude_std
42.              frequency_body_acceleration_mean_x
43.              frequency_body_acceleration_mean_y
44.              frequency_body_acceleration_mean_z
45.               frequency_body_acceleration_std_x
46.               frequency_body_acceleration_std_y
47.               frequency_body_acceleration_std_z
48.         frequency_body_acceleration_jerk_mean_x
49.         frequency_body_acceleration_jerk_mean_y
50.         frequency_body_acceleration_jerk_mean_z
51.          frequency_body_acceleration_jerk_std_x
52.          frequency_body_acceleration_jerk_std_y
53.          frequency_body_acceleration_jerk_std_z
54.                 frequency_body_gyroscope_mean_x
55.                 frequency_body_gyroscope_mean_y
56.                 frequency_body_gyroscope_mean_z
57.                  frequency_body_gyroscope_std_x
58.                  frequency_body_gyroscope_std_y
59.                  frequency_body_gyroscope_std_z
60.      frequency_body_acceleration_magnitude_mean
61.       frequency_body_acceleration_magnitude_std
62. frequency_body_acceleration_jerk_magnitude_mean
63.  frequency_body_acceleration_jerk_magnitude_std
64.         frequency_body_gyroscope_magnitude_mean
65.          frequency_body_gyroscope_magnitude_std
66.    frequency_body_gyroscope_jerk_magnitude_mean
67.     frequency_body_gyroscope_jerk_magnitude_std
68.                                   activity_name
