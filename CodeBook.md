##CodeBook for *run_analysis.R*

This CodeBook describes the **Getting and Cleaning Data** Peer Assessment, from the PA instructions we can read this:

> "The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis."

In this PA, we use a Data Set from a study that contains data collected from smartphone sensors. For a full description of the data, please visit: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


###Getting the data

The study is based on collected data from a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a Samsung Galaxy S II smartphone, and using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The data set used for the PA can be downloaded from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Once downloaded and unzipped the file, we get the following files and directories:

* *README.txt*
* *features_info.txt*: Shows information about the variables used on the feature vector.
* *features.txt*: List of all features.
* *activity_labels.txt*: Links the class labels with their activity name.
* *train/X_train.txt*: Training set.
* *train/y_train.txt*: Training labels.
* *test/X_test.txt*: Test set.
* *test/y_test.txt*: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

* *train/subject_train.txt*: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* *train/Inertial Signals/total_acc_x_train.txt*: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the *total_acc_x_train.txt* and *total_acc_z_train.txt* files for the Y and Z axis. 
* *train/Inertial Signals/body_acc_x_train.txt*: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* *train/Inertial Signals/body_gyro_x_train.txt*: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


###Reading the data
Following the instructions of the PA Project, we must create a new data set which should contains the observed data for both, the train and test set.

Based on the files, we see that the requested data are stored on different files. There are two files that contains the labels and the descriptive activity for the observed data: *features.txt* and *activity_labels.txt*, respectively.



