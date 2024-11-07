# UCI HAR Data Cleaning

This repository contains an R script (`run_analysis.R`) that performs data cleaning on the UCI Human Activity Recognition (HAR) dataset. The script merges the training and test datasets, extracts mean and standard deviation measurements, labels the activities and variables with descriptive names, and generates a tidy dataset containing the averages for each activity and subject.

## Script Overview

### `run_analysis.R`
This script performs the following steps:

1. Downloads and unzips the UCI HAR dataset.
2. Loads and merges the training and test data.
3. Extracts measurements on the mean and standard deviation.
4. Labels the dataset with descriptive activity and variable names.
5. Creates a second tidy dataset with the average of each variable for each activity and each subject.

### Dependencies

- `dplyr` (for data manipulation)

## How to Run

1. Clone this repository to your local machine.
2. Install the required dependencies by running `install.packages("dplyr")` in R.
3. Run the script `run_analysis.R` in your R environment.
4. The script will produce a tidy dataset (`tidy_data.txt`) containing the averages of the selected features.

## Results

- The tidy dataset is saved as `tidy_data.txt` and includes the average of each variable for each activity and subject.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
