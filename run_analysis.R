library(dplyr)                                    
library(data.table)
library(janitor)                                  ##used to take the features variable names (row 1 in mergedDataWithFeatures) and make them the column names instead of V1:V561

testData <- read.table("X_test.txt")              ##the trainData/testData variables read the data into R.
testDataY <- read.table("y_test.txt")

trainData <- read.table("X_train.txt")
trainDataY <- read.table("y_train.txt")

subjectTest <- read.table("subject_test.txt")
subjectTrain <- read.table("subject_train.txt")
mergedSubject <- rbind(subjectTest, subjectTrain)

varNames <- read.table("features.txt")
varNamesCols <- as.data.frame(t(varNames$V2))     ##turn features into columns so they can be transfromed into column names


mergedDataX <- rbind(testData, trainData)         ##the 'mergedData' variables merge the data into one table. 

mergedDataY <- rbind(testDataY, trainDataY)

mergedDataY <- rename(mergedDataY, activityLabel = V1)      #renames V1 with more descriptive name "activityLabel"

mergedDataWithFeatures <- rbind(varNamesCols, mergedDataX)
mergedDataWithFeatures <- row_to_names(mergedDataWithFeatures, row_number = 1)

mergedData <- cbind(mergedDataWithFeatures, mergedDataY)     

extractedData <- mergedData[,grepl("mean|std|activityLabel", names(mergedData))]
extractedData$activityLabel[which(extractedData$activityLabel == "1")] <- "Walking"
extractedData$activityLabel[which(extractedData$activityLabel == "2")] <- "Walking_Upstairs"
extractedData$activityLabel[which(extractedData$activityLabel == "3")] <- "Walking_Downstairs"
extractedData$activityLabel[which(extractedData$activityLabel == "4")] <- "Sitting"
extractedData$activityLabel[which(extractedData$activityLabel == "5")] <- "Standing"
extractedData$activityLabel[which(extractedData$activityLabel == "6")] <- "Laying"

subjectData <- cbind(mergedSubject, extractedData)
subjectData <- rename(subjectData, subject = V1)

groupedData <- group_by(subjectData, subject, activityLabel)

summarize(groupedData, across(groupedData-c(groupedData$subject, groupedData$activityLabel)), mean)
