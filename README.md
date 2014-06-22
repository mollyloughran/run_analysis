
run_analysis script, processing the:
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Molly Loughran.
Coursera - Getting and Cleaning Data Course
Githup Repo: https://github.com/mollyloughran/run_analysis.git




Per the assignment, this script does the following:
    - Merges the training and the test sets to create one data set.
    - Extracts only the measurements on the mean and standard deviation for each measurement. 
    - Uses descriptive activity names to name the activities in the data set
    - Appropriately labels the data set with descriptive variable names. 
    - Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


Accessing the dataset:
- Dataset was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- The zip file was downloaded and unzipped into the working directory that will be used to run the r script. The file contains several folders
- The file contains several folders, the top level "UCI HAR Dataset" needs to be saved to the working directory.
- After the file is unzipped to the working directory, the "run_analysis.R" script can be run 


The github repo for contains the following files:

- 'README run_analysis.md': Describes how to access the data, run the script and reproduce the tidy datasets

- 'codebook run_analysis.txt': Shows information about the variables contained in the dataset

- 'run_analysis.R': R script for reproducing the tidy datasets


Running the script:

- source(run_analysis.R)

- The script is designed to create several R objects to get to the final results requested in this assignment. The final two requested data sets are named as such:

	- mergeset: data set that merges the training set and test set using an rbind so that the two sets are combined under common variable names in a data set. This dataset only includes any variable that had "std" or "mean" in the variable name as required by the assignment. Other feature names were not included. Variable names have all been stripped of punctuation and made lower case to make them easier to read. They were considered descriptive in their current state.

	- tidyset: data set that takes the average of each variable for each activity and each subject and returns one row per subject/activity pair and provides the mean for that row for each variable
