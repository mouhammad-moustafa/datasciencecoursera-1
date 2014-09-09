downloadData <- function(){
    if (!file.exists("./data/")){
        dir.create("./data/")
        dir.create("./data/raw/")
    }
    if(!file.exists("./data/raw/UCI HAR Dataset")){
        #download file
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile = "./data/raw/dataset.zip", method = "curl")
        folder <- unzip("./data/raw/dataset.zip", exdir = "./data/raw/")
    }
}