downloadData <- function(){
    if (!file.exists("./data/")){
        dir.create("./data/")
    }
    if(!file.exists("./data/pml-training.csv")){
        #download file
        fileUrl <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
        download.file(fileUrl, destfile = "./data/pml-training.csv", method = "curl")
    }
    if(!file.exists("./data/pml-testing.csv")){
        #download file
        fileUrl <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"
        download.file(fileUrl, destfile = "./data/pml-testing.csv", method = "curl")
    }
}