Getting and Cleaning Data Course Project
========================================================

Purpose 
-----------------

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 

1. a tidy data set as described below;
2. a link to a Github repository with your script for performing the analysis; and 
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called ``CodeBook.md``. 

You should also include a ``README.md`` in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

Objectives
-----------------

`run_analysis.R` performs the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Steps Before running the script
-----------------
1. Download the data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
2. Unzip the downloaded file.
3. Place the script in where is located the directory  "./.../***UCI HAR Dataset***" you've extracted.

run_analysis.R
-----------------
1. It loads the **train** and **test** data sets and appends the two datasets into one data frame. This is done using `rbind`.
2. The three data sets, **Features**, **Subject** and **Activity**, are merged in **data** data frame.
3. It extracts just the *mean* and *standard deviation* the **features** data set by usgin 'grep', and subsets it into *Data* data frame with *Subject* and *Activity* variables at the end. 
4. It  uses the descriptive activity names from *activity_labels.txt* to rename *Data$Activity* variable, by using factor.
5. It sets descriptive variables for naming the variables in *Data*.
6. The *average* of activities and subjects are created into a separate tidy data set which is exported into the Project folder as *txt* file; this is named **data2.txt**.

