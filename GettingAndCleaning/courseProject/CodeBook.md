## Collect the data
The [project data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is provided in a .zip file.
Once we unzip the file, a folder named UCI HAR Dataset is created.  

## Files used for creating the merged data set  
The following image shows the structure of the new data set and the files used  

![image](data.png)  
__ image extracted from the class forums __  

- The activity values were transformed from numerical values (1-6) to a factor variable using the names provided on the activity_labels.txt file  

## Feature Selection  

The final data set contains a row with the avarage value of each feature per each Subject and Activity. The first 6 rows and 5 columns of the generated file looks like:  

|  Subject        |  Activity            |  tBodyAcc-mean()-X   |  tBodyAcc-mean()-Y  |  tBodyAcc-mean()-Z   |  
| :------------- :| :------------------- | -------------------: | ------------------: | -------------------: |  
| 1               |  WALKING             |       0.2773308      |   -0.017383819      |    -0.1111481        |  
| 1               |  WALKING_UPSTAIRS    |       0.2554617      |   -0.023953149      |    -0.0973020        |  
| 1               |  WALKING_DOWNSTAIRS  |       0.2891883      |   -0.009918505      |    -0.1075662        |  
| 1               |  SITTING             |       0.2612376      |   -0.001308288      |    -0.1045442        |  
| 1               |  STANDING            |       0.2789176      |   -0.016137590      |    -0.1106018        |  
| 1               |  LAYING              |       0.2215982      |   -0.040513953      |    -0.1132036        |  
  
  
The variables included in the tidy data set are:  
- Subject: User identification values from 1 to 30
- Activity: Factor variable (levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)  
- Features: Only the features that contained mean (mean()) or standard deviation (std()) measures has been selected.  
  - Features such as angle(tBodyAccMean,gravity) (includes capital M for Mean) aren't included
  - Features with meanFreq() measures are not included  
  - Complete list:  
	tBodyAcc--XYZ  
	tGravityAcc-XYZ  
	tBodyAccJerk-XYZ  
	tBodyGyro-XYZ  
	tBodyGyroJerk-XYZ  
	tBodyAccMag  
	tGravityAccMag  
	tBodyAccJerkMag  
	tBodyGyroMag  
	tBodyGyroJerkMag  
	fBodyAcc-XYZ  
	fBodyAccJerk-XYZ  
	fBodyGyro-XYZ  
	fBodyAccMag  
	fBodyAccJerkMag  
	fBodyGyroMag  
	fBodyGyroJerkMag  
    
* An extensive description of the features can be read in the [features_info.txt file](https://github.com/rosariomgomez/datasciencecoursera/blob/master/GettingAndCleaning/courseProject/features_info.txt)



