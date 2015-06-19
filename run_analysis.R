# Check that the working directory has the train and test folders
# with the training and testing datasets along with outcomes and subject
# information for each, as well as the list of features.

if (!file.exists("train/X_train.txt") | !file.exists("train/y_train.txt") | 
!file.exists("train/subject_train.txt") | !file.exists("test/X_test.txt") |
!file.exists("test/y_test.txt") | !file.exists("test/subject_test.txt") |
!file.exists("features.txt") | !file.exists("activity_labels.txt")) {
    stop("Data not found in train/test folders in working directory")
}

# Read the training data set - use as much info as we know (like row count)
# to speed up reading
train <- read.table("train/X_train.txt", header=FALSE, quote="", 
    colClasses = "numeric", blank.lines.skip = TRUE, 
    comment.char = "", stringsAsFactors = FALSE, nrows=7352)

# Read the testing data set - use as much info as know (like row count)
# to speed up reading
test <- read.table("test/X_test.txt", header=FALSE, quote="", 
    colClasses = "numeric", blank.lines.skip = TRUE, 
    comment.char = "", stringsAsFactors = FALSE, nrows=2947)

# Merge the training and testing datasets
all <- rbind(train, test)

# Read the training and testing subjects and outcome (activity) data
train_subjects <-  read.table("train/subject_train.txt", header=FALSE, 
    col.names = "subject", quote="", colClasses = "integer", 
    blank.lines.skip = TRUE, comment.char = "", stringsAsFactors = FALSE, 
    nrows=7352)
train_activities <- read.table("train/y_train.txt", header=FALSE, 
    col.names = "activity_id", quote="", colClasses = "integer", 
    blank.lines.skip = TRUE, comment.char = "", stringsAsFactors = FALSE, 
    nrows=7352)
test_subjects <-  read.table("test/subject_test.txt", header=FALSE, 
    col.names = "subject", quote="", colClasses = "integer", 
    blank.lines.skip = TRUE, comment.char = "", stringsAsFactors = FALSE, 
    nrows=2947)
test_activities <- read.table("test/y_test.txt", header=FALSE, 
    col.names = "activity_id", quote="", colClasses = "integer", 
    blank.lines.skip = TRUE, comment.char = "", stringsAsFactors = FALSE, 
    nrows=2947)

# Append the testing to the training subject and outcome datasets and
# Merge with the full dataset (row-by-row)
all <- cbind(all, rbind(train_subjects, test_subjects), 
             rbind(train_activities, test_activities))

# Read the Feature list
features <- read.table("features.txt", header=FALSE, quote="", 
    col.names = c("feature_id", "feature"),
    colClasses = c("numeric","character"), blank.lines.skip = TRUE, 
    comment.char = "", stringsAsFactors = FALSE, nrows=561)

# Identify feature indices that specify the mean and sd
mean_std_features <- filter(features, grepl("*mean\\(\\)", feature) | 
                      grepl("*std\\(\\)", feature))

# Select only the mean and std columns from the combined training 
# and testing set (include the last two columns - subject & activity)
all_mean_sd <- select(all, num_range("V", c(mean_std_features$feature_id)), 
                                     c(562,563))

# convert the Feature name into a valid R field (column) name and replace
# conesecutive "."s with a single "."; get rid of the last "."
valid_colnames <- sub("[.]+$", "", gsub("\\.{2, }", ".", 
                                    make.names(mean_std_features$feature)))

# Rename the variable names for the dataset to valid column names
names(all_mean_sd) <- c(valid_colnames, "subject", "activity_id")

# Read Activity labels
activity_labels <- read.table("activity_labels.txt", header=FALSE, 
    col.names = c("activity_id", "activity"), quote="", 
    colClasses = c("integer", "character"), blank.lines.skip = TRUE, 
    comment.char = "", stringsAsFactors = FALSE, nrows=6)

# Merge Activity labels to data set
data <- merge(all_mean_sd, activity_labels, by.x = "activity_id", 
               by.y = "activity_id")

# Drop the Activity ID variable
data <- select(data, -activity_id)

# Group the data by subject and activity
data <- group_by(data, subject, activity)

# Create a dataset by summarising each variable (using the average), 
# for each subject and Activity
summary_data <- data.frame(summarise_each(data, funs(mean)))

# Output the dataset to file
write.table(summary_data, "getdata_assess_run_analysis.txt", row.name = FALSE)