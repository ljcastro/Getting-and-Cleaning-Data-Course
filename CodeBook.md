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
Following the instructions of the PA Project, we must create a new data set which should contains the observed data for both, the train and test set. All the files are formatted as plain text (TXT), suitable for loading as table.

Based on the files, we see that the requested data are stored on different files. There are two files that contains the labels and the descriptive activity for the observed data: *features.txt* and *activity_labels.txt*, respectively.

The observed data are stored on three of different files for both data sets, train and test:
* *subject_train.txt*, which contains the ID of the person who performed the activity.
* *X_train.txt*, which contains 561 values for each row of observed ID performing an activity.
* *y_train.txt*, which describes the activity that was perfomed during the experiment.


###Preparing the data
With all the files loaded in **R**, we can merge the three data set for each train and test data, and create a new data set with this two sets of observations. Finally we assign the names of the features to the names of the newly created data set, and export it to a *TXT* file.

At this point, the data set contains 10299 observations and 563 variables.

The following step implies to extract from this data set the columns referring to the mean and standard deviation observed values.

For this task, we simply use a pattern based on the names of the columns, and using *grepl* function, extract all the columns that matched the pattern. Resulting in 66 selected columns

Then we create a new data set with the ID of the subject, the activity (at this step is still an ID), and the 66 columns for mean and standard deviation values.

Finally, we convert the activity ID to a factor column, using the names of the activity as labels.


###Final Result
The last task is to perform a grouping calculation with this new data set. We use the *plyr* package for this task, and use the *ddply* function to perform the mean for all the numeric columns grouping by *activity* and *subjectID*. We saved the resulting calculation in a new data set.

This final set contains 180 observations, having 6 total observations per activity and subjectID, and 68 variables containing the resulting average of the different experiments per activity and subject.

Finally, we export this data set to a new *TXT* file.


