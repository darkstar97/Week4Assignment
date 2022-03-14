The dataset includes the following files:
=========================================

- 'README.txt'

- 'codebook.txt': List of all variables and summaries calculated. 

- 'run_analysis.R': R Script that completes the following.

	1. Merges the training and the test sets to create one data set.

	2. Extracts only the measurements on the mean and standard deviation for each measurement. 

	3. Uses descriptive activity names to name the activities in the data set

	4. Appropriately labels the data set with descriptive variable names. 

	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- 'final.txt': Independent tidy data set with the average of each variable for each activity and each subject.

Notes for 'run_analysis.R': 
======
- Lines 1-3 call the dplyr, data.table, and janitor R packages. 

- The trainData/testData/subjectTest/varNames variables read the data into R.
- The mergedSubject variable merges the subjects from both test and train data together.
- The mergedData variables merge the test and train measurements together.
- The mergedDataWithFeatures adds descriptive variable names. 
- The extractedDate table subsets the data to include only mean and standard deviation calculations.
- The subjectData table adds the subjects to the measurements.
