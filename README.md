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

# CodeBook for Getting and Cleaning Data Course Project

## Overview
This CodeBook describes the variables, structure, and content of the final tidy dataset (`tidy_avg.txt`) created from the UCI HAR Dataset. The dataset contains smartphone accelerometer and gyroscope signals collected from 30 subjects performing 6 activities. The final dataset reports the **average of each selected feature for each subject and activity**.

tidy_avg.txt – the final tidy dataset containing averages

Variables

1. **Subject**  
   - Type: Integer  
   - Description: ID of the subject (1–30)

2. **Labels / Activity**  
   - Type: Factor / Character  
   - Description: Activity performed by the subject  
   - Levels:
     1. Walking
     2. Walking_Upstairs
     3. Walking_Downstairs
     4. Sitting
     5. Standing
     6. Laying

3. **Feature columns (3–81)**  
   - Type: Numeric  
   - Description: Mean or standard deviation of accelerometer/gyroscope signals for each measurement feature. These correspond to the features in `features.txt` after filtering only **mean** or **standard deviation** measurements.  

   Example of some column names:
   - `tBodyAcc-mean()-X`
   - `tBodyAcc-mean()-Y`
   - `tBodyAcc-std()-Z`
   - … up to 79 features

---

## Data Structure

- Rows: 180  
  - Each row corresponds to one **subject-activity pair** (30 subjects × 6 activities)
- Columns: 81  
  - 1–2: Subject and Activity  
  - 3–81: Averaged measurement features

---

## Notes

- All measurement columns are averages of the original features per subject and activity  
- Column names are derived from `features.txt` and include `mean()` or `std()` only  
- Dataset is arranged by `Subject` ascending, then `Activity` ascending
- This dataset is suitable for **analysis of the relationship between activity and sensor measurements**.

---

## Usage

Example in R to load and inspect:

```r
tidy_data <- read.table("tidy_avg.txt", header = TRUE)
head(tidy_data)
