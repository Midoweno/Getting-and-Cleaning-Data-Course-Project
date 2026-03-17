# Assignment Instructions:
library(dplyr)

#1 Merges the training and the test sets to create one data set.
    setwd("/Users/renoguo/Documents/Coursera/GETTINGCLEANINGPROJ/UCI HAR Dataset")
    #Once we have this, we can easily use train/file.txt or test/file.txt to load in the specific files we need

    #x_test is the associated data in form of observations and rows
    #y_test.txt is the 6 types that are labeled as walking running bla bla from the readme
    #subject_test is which subject it is

  #Test folder Compiling
  #First Subj_test for numbering subjects, then y_test for labeling, and lastly x_test for the data
    vec_subj_test <- readLines("test/subject_test.txt")
    testdf <- data.frame(Subject = vec_subj_test)

    vec_y_test<-readLines("test/y_test.txt")

    vec_x_test<-read.table("test/X_test.txt")
    testdf <- cbind(
      Subject = vec_subj_test,
      Labels=vec_y_test,
      vec_x_test
    )

  #Training folder Compiling. Run up to Merging as a block
    vec_subj_train <- readLines("train/subject_train.txt")
    traindf <- data.frame(Subject = vec_subj_train)

    vec_y_train<-readLines("train/y_train.txt")
    
    vec_x_train<-read.table("train/X_train.txt")
    traindf <- cbind(
      Subject = vec_subj_train,
      Labels=vec_y_train,
      vec_x_train
    )

  #Merging  
    df<-rbind(testdf,traindf)
 
# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
  #Each column labeled V1 to V561 is a calculation with equations from features.txt
  #We need to filter mean and std metachar from the file to find their indexes to call in the table in df
    indexvec<-readLines("features.txt")
    allMeanAndSTD<-grepl("mean|std",indexvec)
    positions<-which(allMeanAndSTD)
    
    colnames(df)[3:563]<-indexvec
    
  #Now we have all positions where the table contains these values. Use dplyer select() to select
    MeanSTDdf<-df%>%
      select(Subject, Labels, all_of(positions + 2))
  
# 3 Uses descriptive activity names to name the activities in the data set
  #We just need to replace 1-6 with their associated labels. We can also use recode
    MeanSTDdf$Labels[MeanSTDdf$Labels==1]<-"Walking"
    MeanSTDdf$Labels[MeanSTDdf$Labels==2]<-"Walking_Upstairs"
    MeanSTDdf$Labels[MeanSTDdf$Labels==3]<-"Walking_Downstairs"
    MeanSTDdf$Labels[MeanSTDdf$Labels==4]<-"Sitting"
    MeanSTDdf$Labels[MeanSTDdf$Labels==5]<-"Standing"
    MeanSTDdf$Labels[MeanSTDdf$Labels==6]<-"Laying"
    
# 4 Appropriately labels the data set with descriptive variable names. 
  #Data is appropriately labeled 
    
# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  #So I should end up with mean of each variable so 6 sets (1 per activity) of 561 means per subj
  #Can use dplyer, select, group_by, and summarize
   MeanSTDdf<-arrange(MeanSTDdf,Subject)
   
   # MeanSTDdf contains:
   # - Subject
   # - Labels (activities, already named)
   # - Columns 3:81 -> all mean/std features
   colnames(MeanSTDdf)[1:2] <- c("Subject", "Labels")
   
   
   tidy_avg <- MeanSTDdf %>%
     group_by(across(1:2)) %>%        # first 2 columns
     summarize(across(where(is.numeric), mean), .groups = "drop")
   
   tidy_avg$Subject<-as.numeric(tidy_avg$Subject)
   tidy_avg <- tidy_avg %>%
     arrange(Subject, Labels)
   
#Final table
write.table(tidy_avg, "tidy_avg.txt", row.names = FALSE)
   
                     