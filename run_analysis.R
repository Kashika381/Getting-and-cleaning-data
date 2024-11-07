library(dplyr)
train_data <- read.table("C:/Users/HP/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
test_data <- read.table("C:/Users/HP/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
data <- rbind(train_data, test_data)
train_labels <- read.table("C:/Users/HP/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
test_labels <- read.table("C:/Users/HP/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
activity_data <- rbind(train_labels, test_labels)
train_subjects <- read.table("C:/Users/HP/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
test_subjects <- read.table("C:/Users/HP/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

# Merge subject data (rows)
subject_data <- rbind(train_subjects, test_subjects)

features <- read.table("C:/Users/HP/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
mean_std_columns <- grep("mean\\(\\)|std\\(\\)", features$V2)
data <- data[, mean_std_columns]
activity_labels <- read.table("C:/Users/HP/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

# Map the activity IDs to activity names
activity_data <- factor(activity_data$V1, levels = activity_labels$V1, labels = activity_labels$V2)

# 4. Appropriately labels the data set with descriptive variable names.

# Assign column names to the data using the feature names
colnames(data) <- features$V2[mean_std_columns]

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

# Add subject and activity data to the main data
data <- cbind(subject_data, activity_data, data)

# Rename columns for subject and activity
colnames(data)[1:2] <- c("Subject", "Activity")

# Create a tidy dataset: average of each variable for each activity and each subject
data$Subject <- as.factor(data$Subject)
data$Activity <- as.factor(data$Activity)

# Create the tidy data by calculating the mean of all numeric columns
tidy_data <- data %>%
  group_by(Subject, Activity) %>%
  summarise(across(where(is.numeric), ~mean(.x, na.rm = TRUE)))

# View the result
print(tidy_data)

# Optionally, save the tidy data to a file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

