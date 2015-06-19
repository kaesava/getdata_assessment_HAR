Code Book -  Human Activity Recognition Analysis Output dataset
===========

This is a guide for anyone who wants to use the output dataset from the
Analysis of the Human Activity Recognition Analysis dataset.

## Information from the Original dataset 

The experiments have been carried out with a group of 30 volunteers within 
an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded
accelerometer and gyroscope, we captured 3-axial linear acceleration and 
3-axial angular velocity at a constant rate of 50Hz. The experiments have been
video-recorded to label the data manually. The obtained dataset has been
randomly partitioned into two sets, where 70% of the volunteers was selected
for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows of 2.56
sec and 50% overlap (128 readings/window). The sensor acceleration signal,
which has gravitational and body motion components, was separated using a
Butterworth low-pass filter into body acceleration and gravity. The 
gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time 
and frequency domain.

## Summary of Analysis

Refer to the README file for details around analysis. Effectively, mean and
standard deviation estimates of the various measurements of the training 
and testing (combined) datasets were isolated. Descriptive column names for
measurements were applied and a descriptive text for the outcome (activity)
was used. Each of the variables were then averaged for each subject and
activity combination.

The dataset has 180 observations (30 subjects over 6 activities) and 68
fields (subject, activity, and average of 33 mean and 33 standard deviation
estimates of various measures).

## Fields

### subject
An identifier that identifies one of the 30 subjects.

Units: Integer between 1 and 30.

### activity
A description of the activity (outcome) that the subject was undertaking
when the measurements were taken.

Units: Categorical variable with one of 6 values (levels):
* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS


### Average of feature measurements


#### Available information

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.
Then they were filtered using a median filter and a 3rd order low pass
Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low 
pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived
in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also
the magnitude of these three-dimensional signals were calculated using the
Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag,
tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain
signals). 

#### Additional information

For each subject and activity, the average mean and average standard deviation
of the 33 measurements are shown.

Units: Numbers in the range [-1,1]

#### Full list of fields

* tBodyAcc.mean.X
* tBodyAcc.mean.Y
* tBodyAcc.mean.Z
* tBodyAcc.std.X
* tBodyAcc.std.Y
* tBodyAcc.std.Z
* tGravityAcc.mean.X
* tGravityAcc.mean.Y
* tGravityAcc.mean.Z
* tGravityAcc.std.X
* tGravityAcc.std.Y
* tGravityAcc.std.Z
* tBodyAccJerk.mean.X
* tBodyAccJerk.mean.Y
* tBodyAccJerk.mean.Z
* tBodyAccJerk.std.X
* tBodyAccJerk.std.Y
* tBodyAccJerk.std.Z
* tBodyGyro.mean.X
* tBodyGyro.mean.Y
* tBodyGyro.mean.Z
* tBodyGyro.std.X
* tBodyGyro.std.Y
* tBodyGyro.std.Z
* tBodyGyroJerk.mean.X
* tBodyGyroJerk.mean.Y
* tBodyGyroJerk.mean.Z
* tBodyGyroJerk.std.X
* tBodyGyroJerk.std.Y
* tBodyGyroJerk.std.Z
* tBodyAccMag.mean
* tBodyAccMag.std
* tGravityAccMag.mean
* tGravityAccMag.std
* tBodyAccJerkMag.mean
* tBodyAccJerkMag.std
* tBodyGyroMag.mean
* tBodyGyroMag.std
* tBodyGyroJerkMag.mean
* tBodyGyroJerkMag.std
* fBodyAcc.mean.X
* fBodyAcc.mean.Y
* fBodyAcc.mean.Z
* fBodyAcc.std.X
* fBodyAcc.std.Y
* fBodyAcc.std.Z
* fBodyAccJerk.mean.X
* fBodyAccJerk.mean.Y
* fBodyAccJerk.mean.Z
* fBodyAccJerk.std.X
* fBodyAccJerk.std.Y
* fBodyAccJerk.std.Z
* fBodyGyro.mean.X
* fBodyGyro.mean.Y
* fBodyGyro.mean.Z
* fBodyGyro.std.X
* fBodyGyro.std.Y
* fBodyGyro.std.Z
* fBodyAccMag.mean
* fBodyAccMag.std
* fBodyBodyAccJerkMag.mean
* fBodyBodyAccJerkMag.std
* fBodyBodyGyroMag.mean
* fBodyBodyGyroMag.std
* fBodyBodyGyroJerkMag.mean
* fBodyBodyGyroJerkMag.std

For more information, download and reference the features_info.txt file
from the raw data (see the README file for details).
