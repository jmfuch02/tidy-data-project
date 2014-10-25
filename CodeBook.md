# Code Book


## Data Frame Description

aggData - This is the final output, which shows the mean for each variable broken down by subject and activity.

allData - This is the test and training data combined, with only the mean and standard deviations extracted.

allTestData - This is just the test data, before being combined or otherwise pared down.

allTrainData - This is just the training data, before being combined or otherwise pared down.


## Variables

activityID - A unique number 1-6 describing an activity associated with the data. This variable is not included in the final set of output data "aggData".

activityDesc - A description of the activity in activityID 1-6 as follows:
	1 WALKING
	2 WALKING_UPSTAIRS
	3 WALKING_DOWNSTAIRS
	4 SITTING
	5 STANDING
	6 LAYING

subjectID - A unique number 1-30 describing one of the participants in the study

dataSetType - A field showing either "test" or "train" depending on what group performed the activity. This variable is not included in the final set of output data "aggData".

The remaining columns form the "raw" data as described in features_info.txt and features.txt. In "aggData" only the mean and standard deviation measurements will appear.