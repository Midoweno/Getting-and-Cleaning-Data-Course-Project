# Getting-and-Cleaning-Data-Course-Project
Thank you for taking a look at my project.

This project cleans and transforms raw accelerometer data into a tidy dataset with averages per subject and activity.

The data comes from the UCI HAR Dataset, containing smartphone sensor data from 30 subjects performing 6 activities.

To process this data, I took these steps:
  1.Merged the training and test datasets
  2.Extracted only measurements on mean and standard deviation
  3.Replaced activity codes with descriptive activity names
  4.Labeled the dataset with descriptive variable names
  5.Created a second tidy dataset with average of each variable for each activity and each subject
  
The output is a txt file ('tidy_avg.txt') that contains:
-180 rows (30 subjects x 6 activities)
-81 columns (Subject, Activity, and 79 averaged features)

You can run this script by :
  1.Setting your working directory to the dataset folder "UCI HAR DATASET"
  2.Run 'run_analysis.R'
  3.Output file will be generated in the working directory
  
Requirements: 
-R
-Dplyr package
