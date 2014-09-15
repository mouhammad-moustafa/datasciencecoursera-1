#--------------------------
# 0. Download the data and stores it in the data/raw folder
#--------------------------
source("code/downloadData.R")
downloadData()

#--------------------------
# 1. Merge the training and the test sets to create one data set
#--------------------------

# features
X_train <- read.table("data/raw/UCI HAR Dataset/train/X_train.txt", sep = '',
                      header = FALSE)

X_test <- read.table("data/raw/UCI HAR Dataset/test/X_test.txt", sep = '',
                     header = FALSE)

X <- rbind(X_train, X_test)

# subject
subject_train <- read.table("data/raw/UCI HAR Dataset/train/subject_train.txt", 
                            col.names = "Subject", sep = '', header = FALSE)

subject_test <- read.table("data/raw/UCI HAR Dataset/test/subject_test.txt", 
                            col.names = "Subject", sep = '', header = FALSE)

Subject <- rbind(subject_train, subject_test)

# activity
y_train <- read.table("data/raw/UCI HAR Dataset/train/y_train.txt", sep = '',
                      col.names = "Activity", header = FALSE)

y_test <- read.table("data/raw/UCI HAR Dataset/test/y_test.txt", sep = '',
                     col.names = "Activity", header = FALSE)

y <- rbind(y_train, y_test)

rm("subject_test", "subject_train", "X_test", "X_train", "y_test", "y_train")

#--------------------------
#2. Appropriately label the data set with descriptive variable names
#--------------------------

# features
featureNames <- read.table("data/raw/UCI HAR Dataset/features.txt", sep = '',
                           col.names = c('num', 'name'), header = FALSE,
                           stringsAsFactors = FALSE)

colnames(X) <- featureNames$name

#note: Subject and Activity column names were already set while loading the data

#--------------------------
# 3. Extract only the measurements on the mean and standard deviation for each 
#    measurement
#--------------------------

library(dplyr)
X_m_sd <- select(X, matches("mean|std", ignore.case = FALSE), 
                 -contains("meanFreq"))

#--------------------------
#4. Use descriptive activity names to name the activities in the data set
#--------------------------

ylabels <- read.table("data/raw/UCI HAR Dataset/activity_labels.txt", sep = '',
                      col.names = c('num', 'name'), header = FALSE, 
                      stringsAsFactors = FALSE)

y$Activity <- factor(ylabels$name[y$Activity], levels = ylabels$name)

tidy_ds <- cbind(Subject, y, X_m_sd)

#--------------------------
#5. Create a second independent tidy data set with the average of each variable
#   for each activity and each subject
#--------------------------

group_by <- list(Subject = tidy_ds$Subject, Activity = tidy_ds$Activity)
tidy_ds1 <- tidy_ds %>%
            aggregate(by = group_by, mean) %>%
            subset(select = -(3:4)) %>%
            arrange(Subject, Activity)

#save the tidy dataset into a file
write.table(tidy_ds1, file = "data/processed/tidy.txt", row.name=FALSE)
