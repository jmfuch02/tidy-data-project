library(plyr)

#########################################################################
# GENERAL DATA SETUP
#########################################################################

# Set the path to look for the data
dataPath <- ".\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset"

# Look up the feature labels for the x vector data and join to get names
# These will form the names for the x data columns
features <- read.table(file.path(dataPath, "\\features.txt"),
                       col.names = c("featureID", "featureName"))

# Make a lookup table for the activity ID and description
activityLookup <- read.table(file.path(dataPath, "\\activity_labels.txt"),
                             col.names = c("activityID", "activityDesc"))

#########################################################################
# TEST DATA
#########################################################################

# Go to the x_test data and read it in as tables
x_test <- read.table(file.path(dataPath, "\\test\\X_test.txt"),
                     col.names = features[,2])

# Get the subject id for each record
testSubjectID <- read.table(file.path(dataPath,
                     "\\test\\subject_test.txt"),
                     col.names = "subjectID")

# Create a column displaying whether test or training
testDataSetType <- as.data.frame(rep("test", times = 2947))
colnames(testDataSetType) <- "dataSetType"

# Look up the activity labels for the Y data and join to get names
y_test <- read.table(file.path(dataPath, "\\test\\y_test.txt"),
                     col.names = "activityID")
y_testjoin <- join(y_test, activityLookup, by = "activityID")

# Combine all the test data by column-binding
allTestData <- cbind(y_testjoin, testSubjectID,
                     testDataSetType, x_test)

#########################################################################
# TRAINING DATA
#########################################################################

# Go to the x_test data and read it in as tables
x_train <- read.table(file.path(dataPath, "\\train\\X_train.txt"),
                     col.names = features[,2])

# Get the subject id for each record
trainSubjectID <- read.table(file.path(dataPath,
                        "\\train\\subject_train.txt"),
                        col.names = "subjectID")

# Create a column displaying whether test or training
trainDataSetType <- as.data.frame(rep("train", times = 7352))
colnames(trainDataSetType) <- "dataSetType"

# Look up the activity labels for the Y data and join to get names
y_train <- read.table(file.path(dataPath, "\\train\\y_train.txt"),
                     col.names = "activityID")
y_trainjoin <- join(y_train, activityLookup, by = "activityID")

# Combine all the training data by column-binding
allTrainData <- cbind(y_trainjoin, trainSubjectID,
                      trainDataSetType, x_train)

#########################################################################
# COMBINE DATA, PARE DOWN, WRITE FINAL OUTPUT
#########################################################################

# Combine both datasets
allData <- rbind(allTestData, allTrainData)

# Search for "mean" or "std" in X column names and just get those
meanStdData <- allData[,c(1:4,grep("mean|std", colnames(allData)))]

# Get the means for all the variables
aggData <- aggregate(meanStdData[c(5:83)],
          by = meanStdData[c("activityDesc", "subjectID")],
          FUN = mean)

# Write the table to txt file for inclusion in the course project
write.table(aggData, "tidyDataStep5.txt", row.names = FALSE)
