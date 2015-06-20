## run_analysis description
The script run_analysis.R performs the following 5 setps:
  1. All the similar data is merged using the rbind() function
  2. Columns with the mean and standard deviation measures are taken from the whole dataset and are given more user friendly names, taken from features.txt.
  3. We take the activity names from activity_labels.txt substitute them in the dataset.
  4. Columns names are made more descriptive.
  5. A new dataset is generated with all the average measures for each subject and activity type. The output is called data.Avg

## Variables
- *x_train, y_train, x_test, y_test, subject_train* and *subject_test* contain data downloade from the file described in the README file
- *dataX, dataY and dataY* merge the above datasets to simplify analysis.
- *features* and *activities* contain more user friendly names for the *x_data* dataset, which are applied to the column names.
- *dataset2* consolidates previous datasets in a big one
- *dataAvg* contains the relevant averages which will be later stored in a .txt file
