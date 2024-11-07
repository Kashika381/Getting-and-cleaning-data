# Codebook

## Dataset Overview
The dataset consists of measurements from an accelerometer and gyroscope on a smartphone, collected while subjects performed activities.

## Variables
- **Subject**: ID of the subject performing the activity (integer).
- **Activity**: The activity being performed (e.g., WALKING, WALKING_UPSTAIRS).
- **tBodyAcc-mean-X**: Mean of the body acceleration in the X direction.
- **tBodyAcc-mean-Y**: Mean of the body acceleration in the Y direction.
- **tBodyAcc-std-Z**: Standard deviation of the body acceleration in the Z direction.
- (etc. for other measurements...)

## Data Transformations
- Merged the training and test datasets.
- Extracted only measurements on the mean and standard deviation.
- Replaced activity IDs with descriptive activity names.
- Renamed columns for clarity.
- Created a tidy dataset with the average of each variable for each activity and subject.
