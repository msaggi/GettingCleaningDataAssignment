Getting and Cleaning Data Peer Assessment Codebook
==================================================

1. merge_data function is used to load and merge test and train data
    a) train_data is the merged data table of the training data with the subject, activity, activity id, and the other variables
test_data is the merged data table of the test data with the subject, activity, activity id, and the other variables
all_data is the merged version of train_data and test_data

get_mean_std function take data from features.txt and the features_data and returns mean() and std() columns.
These headers were used to filter out only means and standard deviations from the set of observations. This extraction was done using a regular expression on the header names, with special care to not include `meanFreq()`.

Next, for readability column names of SubjectID and Activity were added for the subject and y values respectively.

When the script is executed it will output tab separated values to a text file (named tidset.txt) in the users current working directory.
