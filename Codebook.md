====================================================
Work done on cleaning and tidying data:

All data was first read into respective objects using the read.table function. These data include the features and activity_labels provided as part of the original data package, and of course the data from x_test.txt and x_train.txt.

Columns of x_test, x_train, subjects_test, subjects_train, y_test, y_train, and activity_labels were all given proper column names for easy reference and merging.

Datasets are then merged step by step in a meaningful and intuitive manner until the final product of a tidy dataset is written to a txt file.

y_test and y_train were first merged with activity_labels to give them meaningful activity labels instead of the numbers they first came with. 

Datasets are then merged first on the test data, then with training data before merge them both too.

The fully merged dataset is named full_data.

full_data was then searched for columns that have standard deviations and means as column names. These are saved as indices for extraction from full_data to create a dataset that contains only the standard deviations and means of the entire dataset.

Index variables as created above were used to extract columsn of standard deviation and mean, and named full_data_mean_std.

Subject_ID and Activity of full_data_mean_std was combined to make SubjectActivity using the paste function with sep="-" so that SubjectActivity can be used as a unique identifier in the dataset for "melting". Subject_ID and Activity columns were temporarily removed.

reshape2 package was loaded for using melt and dcast functions

full_data_mean_std was "melted" with id="SubjectAct", then dcast with SubjectAct~vriable and mean as arguments and named full_data_mean_std_melt

tidyr package was loaded for using the separate function to separate Subject_ID and Activity back from SubjectAct.

Subject_ID was coerced to numeric for ordering and later written using the write.table function with row.name=FALSE

====================================================

Description of variables in the tidy data set. In the following lines in this file, each variable is given a brief description of what it measures.

====================================================

"Subject_ID": The ID of each subject ranging from 1 to 30



"Activity": The activity that the subject is doing, that is, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING STANDING LAYING



"tBodyAcc-std()-X": For each of the later columns, a 't' prefix denodes that this variable is of 'time', 'std' denotes the standard deviation of that variable, 'mean' denotes the average, and 'X', 'Y' or 'Z' denotes the axis on which the measurement is taken. This variable measures the standard deviation of the Body Acceleration on the X-axis on the time domain. 



"tBodyAcc-std()-Y": This variable measures the standard deviation of the Body Acceleration on the Y-axis on the time domain. 


"tBodyAcc-std()-Z": This variable measures the standard deviation of the Body Acceleration on the Z-axis on the time domain. 



"tGravityAcc-std()-X": This variable measures the standard deviation of the Gravitational Acceleration on the X-axis on the time domain. 



"tGravityAcc-std()-Y": This variable measures the standard deviation of the Gravitational Acceleration on the Y-axis on the time domain. 



"tGravityAcc-std()-Z": This variable measures the standard deviation of the Gravitational Acceleration on the Z-axis on the time domain. 



"tBodyAccJerk-std()-X": This variable measures the standard deviation of the Body Acceleration Jerk on the X-axis on the time domain. 



"tBodyAccJerk-std()-Y": This variable measures the standard deviation of the Body Acceleration Jerk on the Y-axis on the time domain. 



"tBodyAccJerk-std()-Z": This variable measures the standard deviation of the Body Acceleration Jerk on the Z-axis on the time domain. 



"tBodyGyro-std()-X": This variable measures the standard deviation of the Body Angular Velocity on the Gyroscope on the X-axis on the time domain. 



"tBodyGyro-std()-Y": This variable measures the standard deviation of the Body Angular Velocity on the Gyroscope on the Y-axis on the time domain. 



"tBodyGyro-std()-Z": This variable measures the standard deviation of the Body Angular Velocity on the Gyroscope on the Z-axis on the time domain. 



"tBodyGyroJerk-std()-X": This variable measures the standard deviation of the Body Angular Velocity Jerk on the Gyroscope on the X-axis on the time domain. 



"tBodyGyroJerk-std()-Y": This variable measures the standard deviation of the Body Angular Velocity Jerk on the Gyroscope on the Y-axis on the time domain. 



"tBodyGyroJerk-std()-Z": This variable measures the standard deviation of the Body Angular Velocity Jerk on the Gyroscope on the Z-axis on the time domain.



"tBodyAccMag-std()": This variable measures the standard deviation of the Body Acceleration Magnitude on the time domain.



"tGravityAccMag-std()": This variable measures the standard deviation of the Gravitational Acceleration Magnitude on the time domain.



"tBodyAccJerkMag-std()": This variable measures the standard deviation of the Body Acceleration Jerk Magnitude on the time domain.



"tBodyGyroMag-std()": This variable measures the standard deviation of the Body Angular Velocity Magnitude on the Gyroscope on the time domain.



"tBodyGyroJerkMag-std()": This variable measures the standard deviation of the Body Angular Velocity Jerk Magnitude on the Gyroscope on the time domain.



"fBodyAcc-std()-X": This variable measures the standard deviation of the Body Acceleration on the X-axis on the frequency domain.



"fBodyAcc-std()-Y": This variable measures the standard deviation of the Body Acceleration on the Y-axis on the frequency domain.



"fBodyAcc-std()-Z": This variable measures the standard deviation of the Body Acceleration on the Z-axis on the frequency domain.



"fBodyAccJerk-std()-X": This variable measures the standard deviation of the Body Acceleration Jerk on the X-axis on the frequency domain.



"fBodyAccJerk-std()-Y": This variable measures the standard deviation of the Body Acceleration Jerk on the Y-axis on the frequency domain.



"fBodyAccJerk-std()-Z": This variable measures the standard deviation of the Body Acceleration Jerk on the Z-axis on the frequency domain.



"fBodyGyro-std()-X": This variable measures the standard deviation of the Body Angular Velocity on the Gyroscope on the X-axis on the frequency domain.



"fBodyGyro-std()-Y": This variable measures the standard deviation of the Body Angular Velocity on the Gyroscope on the Y-axis on the frequency domain.



"fBodyGyro-std()-Z": This variable measures the standard deviation of the Body Angular Velocity on the Gyroscope on the Z-axis on the frequency domain.



"fBodyAccMag-std()": This variable measures the standard deviation of the Body Acceleration Magnitude on the frequency domain.



"fBodyBodyAccJerkMag-std()": This variable measures the standard deviation of the Body Acceleration Jerk Magnitude on the frequency domain.




"fBodyBodyGyroMag-std()": This variable measures the standard deviation of the Body Angular Velocity Acceleration Magnitude on the Gyroscope on the frequency domain.



"fBodyBodyGyroJerkMag-std()": This variable measures the standard deviation of the Body Angular Velocity Acceleration Jerk Magnitude on the Gyroscope on the frequency domain.



"tBodyAcc-mean()-X": This variable measures the average of the Body Acceleration on the X-axis on the time domain. 



"tBodyAcc-mean()-Y": This variable measures the average of the Body Acceleration on the Y-axis on the time domain.



"tBodyAcc-mean()-Z": This variable measures the average of the Body Acceleration on the Z-axis on the time domain.



"tGravityAcc-mean()-X": This variable measures the average of the Gravitational Acceleration on the X-axis on the time domain.



"tGravityAcc-mean()-Y": This variable measures the average of the Gravitational Acceleration on the Y-axis on the time domain.



"tGravityAcc-mean()-Z": This variable measures the average of the Gravitational Acceleration on the Z-axis on the time domain.



"tBodyAccJerk-mean()-X": This variable measures the average of the Body Acceleration Jerk on the X-axis on the time domain.



"tBodyAccJerk-mean()-Y": This variable measures the average of the Body Acceleration Jerk on the Y-axis on the time domain.



"tBodyAccJerk-mean()-Z": This variable measures the average of the Body Acceleration Jerk on the Z-axis on the time domain.



"tBodyGyro-mean()-X": This variable measures the average of the Body Angular Velocity on the Gyroscope on the X-axis on the time domain.



"tBodyGyro-mean()-Y": This variable measures the average of the Body Angular Velocity on the Gyroscope on the Y-axis on the time domain.



"tBodyGyro-mean()-Z": This variable measures the average of the Body Angular Velocity on the Gyroscope on the Z-axis on the time domain.



"tBodyGyroJerk-mean()-X": This variable measures the average of the Body Angular Velocity Jerk on the Gyroscope on the X-axis on the time domain.



"tBodyGyroJerk-mean()-Y": This variable measures the average of the Body Angular Velocity Jerk on the Gyroscope on the Y-axis on the time domain.



"tBodyGyroJerk-mean()-Z": This variable measures the average of the Body Angular Velocity Jerk on the Gyroscope on the Z-axis on the time domain.



"tBodyAccMag-mean()": This variable measures the average of the Body Acceleration Magnitude on the time domain.



"tGravityAccMag-mean()": This variable measures the average of the Gravitational Acceleration Magnitude on the time domain.



"tBodyAccJerkMag-mean()": This variable measures the average of the Body Acceleration Jerk Magnitude on the time domain.



"tBodyGyroMag-mean()": This variable measures the average of the Body Angular Velocity Magnitude on the Gyroscope on the time domain.



"tBodyGyroJerkMag-mean()": This variable measures the average of the Body Angular Velocity Jerk Magnitude on the Gyroscope on the time domain.



"fBodyAcc-mean()-X": This variable measures the average of the Body Acceleration on the X-axis on the frequency domain.



"fBodyAcc-mean()-Y": This variable measures the average of the Body Acceleration on the Y-axis on the frequency domain.



"fBodyAcc-mean()-Z": This variable measures the average of the Body Acceleration on the Z-axis on the frequency domain.



"fBodyAcc-meanFreq()-X": This variable measures the weighted average of the frequency components of the Body Acceleration on the X-axis on the frequency domain.



"fBodyAcc-meanFreq()-Y": This variable measures the weighted average of the frequency components of the Body Acceleration on the Y-axis on the frequency domain.



"fBodyAcc-meanFreq()-Z": This variable measures the weighted average of the frequency components of the Body Acceleration on the Z-axis on the frequency domain.



"fBodyAccJerk-mean()-X": This variable measures the average of the Body Acceleration Jerk on the X-axis on the frequency domain.



"fBodyAccJerk-mean()-Y": This variable measures the average of the Body Acceleration Jerk on the Y-axis on the frequency domain.



"fBodyAccJerk-mean()-Z": This variable measures the average of the Body Acceleration Jerk on the Z-axis on the frequency domain.



"fBodyAccJerk-meanFreq()-X": This variable measures the weighted average of the frequency components of the Body Acceleration Jerk on the X-axis on the frequency domain.



"fBodyAccJerk-meanFreq()-Y": This variable measures the weighted average of the frequency components of the Body Acceleration Jerk on the Y-axis on the frequency domain.



"fBodyAccJerk-meanFreq()-Z": This variable measures the weighted average of the frequency components of the Body Acceleration Jerk on the Z-axis on the frequency domain.



"fBodyGyro-mean()-X": This variable measures the average of the Body Angular Velocity on the Gyroscope on the X-axis on the frequency domain.



"fBodyGyro-mean()-Y": This variable measures the average of the Body Angular Velocity on the Gyroscope on the Y-axis on the frequency domain.



"fBodyGyro-mean()-Z": This variable measures the average of the Body Angular Velocity on the Gyroscope on the Z-axis on the frequency domain.



"fBodyGyro-meanFreq()-X": This variable measures the weighted average of the frequency components of the Body Acceleration Jerk on the X-axis on the frequency domain.



"fBodyGyro-meanFreq()-Y": This variable measures the weighted average of the frequency components of the Body Acceleration Jerk on the X-axis on the frequency domain.



"fBodyGyro-meanFreq()-Z": This variable measures the weighted average of the frequency components of the Body Acceleration Jerk on the X-axis on the frequency domain.



"fBodyAccMag-mean()": This variable measures the average of the Body Acceleration Magnitude on the X-axis on the frequency domain.



"fBodyAccMag-meanFreq()": This variable measures the weighted average of the frequency components of the Body Acceleration Magnitude on the frequency domain.



"fBodyBodyAccJerkMag-mean()": This variable measures the average of the Body Acceleration Jerk Magnitude on the frequency domain.



"fBodyBodyAccJerkMag-meanFreq()": This variable measures the weighted average of the frequency components of the Body Acceleration Jerk Magnitude on the frequency domain.



"fBodyBodyGyroMag-mean()": This variable measures the average of the Body Angular Velocity Magnitude on the Gyroscope on the frequency domain.



"fBodyBodyGyroMag-meanFreq()": This variable measures the weighted average of the frequency components of the Body Angular Velocity Magnitude on the Gyroscope on the frequency domain.



"fBodyBodyGyroJerkMag-mean()": This variable measures the average of the Body Angular Velocity Jerk Magnitude on the Gyroscope on the frequency domain.



"fBodyBodyGyroJerkMag-meanFreq()": This variable measures the weighted average of the frequency components of the Body Angular Velocity Jerk Magnitude on the Gyroscope on the frequency domain.