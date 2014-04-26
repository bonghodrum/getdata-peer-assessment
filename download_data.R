#This script will download the UCI smartphone sensor data described in 
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

setwd("~/git-repo/getdata-peer-assessment")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","ucidataset.zip", method="curl")
unzip("ucidataset.zip")