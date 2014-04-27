
#Load features and activity labels
features <- read.table("UCI HAR Dataset/features.txt")
names(features) <- c("id","name")
head(features)

activity <- read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)
names(activity) <- c("id","name")
head(activity)


#Load subjects and features of train and test data
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")

Y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
Y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

#create two sets with all variables
train <- cbind(train_subjects,X_train,Y_train)
test <- cbind(test_subjects,X_test,Y_test)

#merge the two data sets and add the column names
allData <- rbind(train,test)
names(allData) <- c("subjectID",paste(features$name),"activity")
head(allData)

#create the first complete data set
write.table(allData,"completeData.txt")


#extract the mean and sd variables
#and create a new data set with subjectID, activity and selected features
pattern <- '\\-mean\\(\\)|\\-std\\(\\)'
vars <- which(grepl(pattern,names(allData)))

selectData <- allData[,c(1,563,vars)]

#mapping activity variable with name
selectData$activity <- factor(selectData$activity, labels=activity$name)

summary(selectData)

#grouping and calculating means
library(plyr)
finalData <- ddply(selectData, .(activity,subjectID), numcolwise(mean))
summary(finalData)
head(finalData)

#saving results on a file
write.table(finalData,"finalData.txt")
