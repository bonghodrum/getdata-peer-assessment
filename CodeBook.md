####Step 1: Download data collected from the accelerometers from the Samsung Galaxy S smartphone to current working directory.

    setwd("~/git-repo/getdata-peer-assessment")
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","ucidataset.zip", method="curl")
    unzip("ucidataset.zip")
  
  