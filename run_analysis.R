## msaggi@gmail.com
## Getting and Cleaning Data Course Project
## all the files for the assignment are assumed to be in the working directory `UCIHARDataset`. Please refer to the Readme attached to this project

## setwd("/Users/mohitsaggi/data/UCIHARDataset")

## Merges the training and the test sets to create one data set
merge_data = function() {

  ## read test data
  x_test <- read.table("test/X_test.txt")
  y_test <- read.table("test/y_test.txt")
  sub_test <- read.table("test/subject_test.txt")
  
  ## read training data
  x_train <- read.table("train/X_train.txt")
  y_train <- read.table("train/y_train.txt")
  sub_train <- read.table("train/subject_train.txt")
  
  ## read the activity labels
  activity_labels <- read.table("activity_labels.txt")
  
  ## merge y test and training activity labels
  test_labels <- merge(y_test,activity_labels,by="V1")
  train_labels <- merge(y_train,activity_labels,by="V1")
  
  ## merge the test and training data and the respective labels together
  train_data <- cbind(sub_train,train_labels,x_train)
  test_data <- cbind(sub_test,test_labels,x_test)
  
  ## merge the test and training data together
  all_data <- rbind(train_data,test_data)
  
  return (all_data)
}

## Get only the measurements on the mean and standard deviation for each measurement
get_mean_std <- function(data_set) {
  features_data <- read.table("features.txt")

  mean_std_rows <- subset(features_data,  grepl("(mean\\(\\)|std\\(\\))", features_data$V2) )

  # convert activity labels to meaningful names
  colnames(data_set) <- c("Subject","Activity_Id","Activity",as.vector(features_data[,2]))
  
  ## extract the data from the merged data where the column names are mean OR std
  mean_columns <- grep("mean()", colnames(data_set), fixed=TRUE)
  std_columns <- grep("std()", colnames(data_set), fixed=TRUE)
  
  ## put both mean and std columns into single vector
  mean_std_column_vector <- c(mean_columns, std_columns)
  
  ## extract the columns with std and mean in their column headers
  extracted_data_set <- data_set[,c(1,2,3,mean_std_column_vector)]
  return (extracted_data_set)
}

## set descriptive activity names to name the activities in the data set
write_tidy_set <- function(data_set) {

  require(reshape2)
  melted_data <- melt(data_set, id=c("Subject","Activity_Id","Activity"))
  
  ## cast the data to the tidy_data format
  tidy_data <- dcast(melted_data, formula = Subject + Activity_Id + Activity ~ variable, mean)
  
  ## format the column names
  col_names_vector <- colnames(tidy_data)
  col_names_vector <- gsub("-mean()","Mean",col_names_vector,fixed=TRUE)
  col_names_vector <- gsub("-std()","Std",col_names_vector,fixed=TRUE)
  col_names_vector <- gsub("BodyBody","Body",col_names_vector,fixed=TRUE)
  
  ## put back in the tidy column names
  colnames(tidy_data) <- col_names_vector
  
  ## write the output into a file
  write.table(tidy_data, file="./tidyset.txt", sep="\t", row.names=FALSE)
}

merged_data <- merge_data()

mean_std_data_set <- get_mean_std(merged_data)

write_tidy_set(mean_std_data_set)
