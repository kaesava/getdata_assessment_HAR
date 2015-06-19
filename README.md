README - Description of Human Activity Recognition Analysis script
===========

This is a guide for anyone who wants to use the R Analysis script that 
summarises mean and standard deviations available in the the HAR dataset.

## Raw Data

Raw data for the analysis is available from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The data represents smartphone measurements collected from 30 subjects and
the outcome (activity) that each subject was undertaking.

The zip file contains the following files that we use:
* activity_labels.txt: List of indices and corresponding Activities
* features.txt: 561-vector set of measurements for  time and frequency domain
variables specified in each observation
* features_info.txt.: List of feature indices and corresponding feature names
* train/X_train.txt: Training set of measurements for observations
* train/subject_train.txt: Subject relating to each training set observation
* train/Y_train.txt: Outcome relating to each testing set observation
* test/X_test.txt: Testing set of measurements for observations
* test/subject_test.txt: Subject relating to each testing set observation
* test/Y_test.txt: Outcome relating to each testing set observation

We don't use the "Inertial Signals" data from the training or testing folders.

## Running the Script

Download and unzip the raw data and save the analysis script (run_analysis.R)
in the unzipped folder (at the same level of the README.txt raw data file).
Running the file produces the output  file ("getdata_assess_run_analysis.txt")
in the same directory.

## Loading the output data

The output file is also available from this repository. Copy the file into
the same folder as the script and run

`read.table("getdata_assess_run_analysis.txt", header=TRUE)`

## Analysis Steps

Refer to the Code book for details of variables 

We unzipped the raw data and ensured that the following files exist in the
working directory.

* train/X_train.txt
* train/y_train.txt
* train/subject_train.txt
* test/X_test.txt
* test/y_test.txt
* test/subject_test.txt
* features.txt
* activity_labels.txt

We then read the training and testing data sets and appended the testing
dataset to the bottom of the training dataset.

We then read the training and testing observation subjects data and 
observation outcome data and appended the testing data to the training 
dataset for both. We then merged (row-by-row) the subject and activity data.

We read the features list and isolated features (and corresponding feature
indices) that contained the phrase mean() or std(). These relate to mean
and standard deviations of measurements. There were 33 mean and 33 standard
deviation measurements.

We then removed all columns from the combined training and testing data
that were not in the list of features that we isolated in the previous step.

Since the feature names used are not valid R column names, we converted them
into valid column names. We replaced consecutive "."s in the column name
with a single "." and removed the last "." if any. This resulted in a set
of descriptive feature names. We applied these to the data.

We read activity labels and merged the data set with the activity dataset
(both datasets include the activity index used to merge the data). We then
dropped the activity_id.

We then grouped the data by subject and activity in preparation of producing
summarised data for each subject and activity.

For each subject and activity, we created a summarised dataset with 
average of the 33 mean and 33 standard deviations in the data.

We output the file to the working directory.