Getting and Cleaning Data Peer Assessment Codebook
==================================================

Test and train data were loaded separately. The subject, X, and y files were loaded for both test and train.

Test and train data sets were merged into one

Headers for the X values were extracted from the `features.txt` file and applied to both test and train datasets.

These headers were used to filter out only means and standard deviations from the set of observations. This extraction was done using a regular expression on the header names, with special care to not include `meanFreq()`.

Next, for readability column names of SubjectID and Activity were added for the subject and y values respectively.

When the script is executed it will output tab separated values to a text file (named tidset.txt) in the users current working directory.
