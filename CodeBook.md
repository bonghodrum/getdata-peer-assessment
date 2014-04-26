####Step 1: Download data collected from the accelerometers from the Samsung Galaxy S smartphone to current working directory.

This step will download the UCI sensor data described here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

You can also download the data here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

    source("download_data.R")
    
####Step 2: Run run_analysis.R script to generate tidy data sets.

This step will generate two TSV files, sensor_means_and_std.tsv and sensor_means_and_std_grouped_by_activity_and_subject.tsv 

    source("run_analysis.R")
  
  
