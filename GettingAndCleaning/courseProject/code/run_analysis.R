#--------------------------
# 0. Download the data
#--------------------------
source("code/downloadData.R")
downloadData()

#--------------------------
# 1. Merges the training and the test sets to create one data set
#--------------------------
X_train <- read.table("data/raw/UCI HAR Dataset/train/X_train.txt", sep = '',
                    header = FALSE)

X_test <- read.table("data/raw/UCI HAR Dataset/test/X_test.txt", sep = '',
                     header = FALSE)

X <- rbind(X_train, X_test)

#--------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement
#--------------------------

#####TODO

#--------------------------
#3. Appropriately labels the data set with descriptive variable names
#--------------------------
featureNames <- read.table("data/raw/UCI HAR Dataset/features.txt", sep = '',
                           col.names = c('num', 'name'), header = FALSE,
                           stringsAsFactors = FALSE)

colnames(X) <- featureNames$name

#--------------------------
#4. Uses descriptive activity names to name the activities in the data set
#--------------------------
y_train <- read.table("data/raw/UCI HAR Dataset/train/y_train.txt", sep = '',
                         header = FALSE)

y_test <- read.table("data/raw/UCI HAR Dataset/test/y_test.txt", sep = '',
                       header = FALSE)

y <- rbind(y_train, y_test)

ylabels <- read.table("data/raw/UCI HAR Dataset/activity_labels.txt", sep = '',
                      col.names = c('num', 'name'), header = FALSE, 
                      stringsAsFactors = FALSE)

###PENDING TO ASIGN ylabels to y

#--------------------------
#5. Create a second independent tidy data set with the average of each variable
#   for each activity and each subject
#--------------------------
