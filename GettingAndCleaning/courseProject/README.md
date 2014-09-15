## Getting and Cleaning Data Course Project

* The project is structured as follows:
  - [CodeBook.md](https://github.com/rosariomgomez/datasciencecoursera/blob/master/GettingAndCleaning/courseProject/CodeBook.md):
    Markdown file describing the variables, the data, and the transformations performed to obtain the tidy dataset

  - [code/](https://github.com/rosariomgomez/datasciencecoursera/tree/master/GettingAndCleaning/courseProject/code)
    - downloadData.R: auxiliary script to create the data/ directory and download the raw data
    - run_analysis.R: script where the tidy data set is created, all transformations to the raw data are done here

  - [data/processed](https://github.com/rosariomgomez/datasciencecoursera/tree/master/GettingAndCleaning/courseProject/data/processed)
    - tidy.txt: text file containing the tidy data set created by the run_analysis.R script

## Introduction

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data on the study represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## How to use it
1. Fork/clone the [repository](https://github.com/rosariomgomez/datasciencecoursera)

2. Change the working directory to the courseProject directory  

  ```r
  setwd("<your_path_to_the_repo>/GettingAndCleaning/courseProject")
  ```

3. Run the run_analysis.R script  
  ```r
  source("code/run_analysis.R")
  ```

- The data/ folder will be created with two folders:  
  - raw/: will contain the downloaded data for the analysis  
  - processed/: will contain the tidy data set in the tidy.txt file  

A full description of the performed transformations and the used variables can be found at the [CodeBook](https://github.com/rosariomgomez/datasciencecoursera/blob/master/GettingAndCleaning/courseProject/CodeBook.md) file.
