tidy-data-project
=================

#Description of run_analysis.R script

The script will operate on a set of data from a Samsung phone, taken from this site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

It is broken into four main sections which do the following:

1. First set up some general parameters
	- Point to the directory where the data is stored (It must be in your working directory)
	- Get all of the feature names from features.txt so the X data columns can be named later
	- Make a lookup table for the activity description so a "join" can be used later

2. Set up the test data set
	- Add all of the X data and rename the columns from the features table created earlier
	- Add a column that shows this is all test data
	- Use the activity lookup table to get the activity names

3. Set up the training data set
	- Add all of the X data and rename the columns from the features table created earlier
	- Add a column that shows this is all training data
	- Use the activity lookup table to get the activity names

4. Merge the training and the test sets to create one data set.
	- Extract the measurements on the mean and standard deviation for each measurement by using grep() to look for "mean" and "std" in the column names
	- Create a second, independent tidy data set with the average of each variable for each activity and each subject by using the aggregate() function
	- Output the table to a text file called "tidyDataStep5.txt" into the working directory