# Step 1: Merges the training and the test sets to create one data set.
# Set to working directory
# Read the X's
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
dim(trainData) # 7352*561
head(trainData)
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
dim(testData) # 2947*561
head(testData)
# Read the Y's
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt")
table(trainLabel)
testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt") 
table(testLabel) 
# Read the subjects (1-30)
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
table(trainSubject)
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
table(testSubject)
# Merge test and training to obtain full data set
joinData <- rbind(trainData, testData)
dim(joinData) # 10299*561

# Additional variable to identify the activity and subject
joinLabel <- rbind(trainLabel, testLabel)
dim(joinLabel) # 10299*1
joinSubject <- rbind(trainSubject, testSubject)
dim(joinSubject) # 10299*1

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
# Descriptions of the 561 variables
features <- read.table("./UCI HAR Dataset/features.txt")
dim(features)  # 561*2
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2]) # only get the ones with mean and std
length(meanStdIndices) # 66 variable matches
joinData <- joinData[, meanStdIndices] # extract data for those indices
dim(joinData) # 10299*66
#Giving the variable names as indicated by the variable "features"
names(joinData) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) # remove "()"
names(joinData) <- gsub("mean", "Mean", names(joinData)) # capitalize M
names(joinData) <- gsub("std", "Std", names(joinData)) # capitalize S
names(joinData) <- gsub("-", "", names(joinData)) # remove "-" in column names 
head(joinData)

# Step 3: Uses descriptive activity names to name the activities in the data set
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8)) # Capital U in "walkingupstairs"
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8)) # Capital D in "walkingdownstairs"
# Name the labels with relevant activities
joinLabel[, 1] <- activity[joinLabel[, 1], 2]
names(joinLabel) <- "activity"
head(joinLabel)

# Step 4: Appropriately labels the data set with descriptive variable names. 
names(joinSubject) <- "subjectid"
tidyData <- cbind(joinSubject, joinLabel, joinData)
dim(tidyData) # 10299*68
# write.table(tidyData, "merged_dataset.txt") # write out the first tidy dataset in txt format

# Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
subjectLen <- length(table(joinSubject)) # 30
activityLen <- dim(activity)[1] # 6
columnLen <- dim(tidyData)[2] # 68

library(reshape2)
tinyDataMelt <- melt(tidyData, id.vars=c("subjectid", "activity"))
# Recast the data and applying mean as a function.
tidyData2 <- dcast(tinyDataMelt, subjectid + activity ~ variable, mean)
head(tidyData2)

write.table(tidyData2, "indeptidydataset.txt") # write out the second tidy dataset

# OR
# library(dplyr)
# p <- tidyData[, 3:dim(tidyData)[2]] 
# tidyData2b<- aggregate(p,list(tidyData$subjectid, tidyData$activity), mean)
# names(tidyData2b)[1]="subjectid"
# names(tidyData2b)[2]="activity"
# tidyData2b<-tidyData2b[sort(tidyData2$subjectid,order(tidyData2$activity), ]
# tidyData2b<-arrange(tidyData2b, subjectid)
# head(tidyData2b)
# # Cross check if two methods give same result by summing the number of unequal values
# sum(tidyData2!=tidyData2b) # 0
# write.table(tidyData2b, "indeptidydataset.txt") # write out the second tidy dataset