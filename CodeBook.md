Getting and Cleaning Data Peer Assessment Codebook
==================================================

merge_data function is used to load and merge test and train data
- train_data is the merged data table of the training data with the subject, activity, activity id, and the other variables
- test_data is the merged data table of the test data with the subject, activity, activity id, and the other variables
- all_data is the merged version of train_data and test_data

get_mean_std function take data from features.txt and the features_data and returns mean() and std() columns.
 - mean_std_rows variable stores subset data from the features_data where just the mean() and std() columns are extracted.
 - mean_columns is the extracted data from the data_set where the mean() columns are extracted.
 - std_columns is the extracted data from the data_set where the std() columns are extracted.
 

write_tidy_set function returns data after performing dcast so that we can get the mean of the related activities across the different variables of the data

When the script is executed it will output tab separated values to a text file (named tidset.txt) in the users current working directory.
