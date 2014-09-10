#--------------------------
# 0. Download the data and stores it in the data/raw folder
#--------------------------
source("code/downloadData.R")
downloadData()

#--------------------------
# 1. Merge the training and the test sets to create one data set
#--------------------------
X_train <- read.table("data/raw/UCI HAR Dataset/train/X_train.txt", sep = '',
                    header = FALSE)

X_test <- read.table("data/raw/UCI HAR Dataset/test/X_test.txt", sep = '',
                     header = FALSE)

X <- rbind(X_train, X_test)

#--------------------------
#2. Appropriately label the data set with descriptive variable names
#--------------------------
featureNames <- read.table("data/raw/UCI HAR Dataset/features.txt", sep = '',
                           col.names = c('num', 'name'), header = FALSE,
                           stringsAsFactors = FALSE)

colnames(X) <- featureNames$name

#--------------------------
# 3. Extracts only the measurements on the mean and standard deviation for each 
#    measurement
#--------------------------

col_means <- grep("-mean()", colnames(X))
col_stds  <- grep("-std()", colnames(X))
cols <- sort(c(col_means, col_stds))
X_m_sd <- X[,cols]

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

# save the tidy dataset into a file


#--------------------------
#5. Create a second independent tidy data set with the average of each variable
#   for each activity and each subject
#--------------------------

#save the tidy dataset into a file
