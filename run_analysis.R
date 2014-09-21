run_analysis <- function() {
        ## working directory = UCI HAR Dataset folder
        
        ## read all relevant data into working space.
        
        ## startng with "overall" data
        features <- read.table("./features.txt")
        activity_labels <- read.table("./activity_labels.txt")
        
        ## then with test data
        x_test <- read.table("./test/X_test.txt")
        y_test <- read.table("./test/y_test.txt")
        subjects_test <- read.table("./test/subject_test.txt")
        body_acc_x_test <- read.table("./test/Inertial Signals/body_acc_x_test.txt")
        body_acc_y_test <- read.table("./test/Inertial Signals/body_acc_y_test.txt")
        body_acc_z_test <- read.table("./test/Inertial Signals/body_acc_z_test.txt")
        body_gyro_x_test <- read.table("./test/Inertial Signals/body_gyro_x_test.txt")
        body_gyro_y_test <- read.table("./test/Inertial Signals/body_gyro_y_test.txt")
        body_gyro_z_test <- read.table("./test/Inertial Signals/body_gyro_z_test.txt")
        total_acc_x_test <- read.table("./test/Inertial Signals/total_acc_x_test.txt")
        total_acc_y_test <- read.table("./test/Inertial Signals/total_acc_y_test.txt")
        total_acc_z_test <- read.table("./test/Inertial Signals/total_acc_z_test.txt")
        
        ## then with training data
        x_train <- read.table("./train/X_train.txt")
        y_train <- read.table("./train/y_train.txt")
        subjects_train <- read.table("./train/subject_train.txt")
        body_acc_x_train <- read.table("./train/Inertial Signals/body_acc_x_train.txt")
        body_acc_y_train <- read.table("./train/Inertial Signals/body_acc_y_train.txt")
        body_acc_z_train <- read.table("./train/Inertial Signals/body_acc_z_train.txt")
        body_gyro_x_train <- read.table("./train/Inertial Signals/body_gyro_x_train.txt")
        body_gyro_y_train <- read.table("./train/Inertial Signals/body_gyro_y_train.txt")
        body_gyro_z_train <- read.table("./train/Inertial Signals/body_gyro_z_train.txt")
        total_acc_x_train <- read.table("./train/Inertial Signals/total_acc_x_train.txt")
        total_acc_y_train <- read.table("./train/Inertial Signals/total_acc_y_train.txt")
        total_acc_z_train <- read.table("./train/Inertial Signals/total_acc_z_train.txt")
        
        ## name columns in respective datasets appropriately
        names(x_test) <- features[,2]
        names(x_train) <- features[,2]
        names(subjects_test) <- "Subject_ID"
        names(subjects_train) <- "Subject_ID"
        names(y_test) <- "Posture_ID"
        names(y_train) <- "Posture_ID"
        names(activity_labels) <- c("Posture_ID", "Posture")
        
        ## prep datasets for merging
                
        y_test <- merge(y_test, activity_labels)
        test_posture <- as.data.frame(y_test[,2])
        y_train <- merge(y_train, activity_labels)
        train_posture <- as.data.frame(y_train[,2])
        
        names(test_posture) <- "Posture"
        names(train_posture) <- "Posture"

        
        ## merge test data
        test_data <- cbind(subjects_test, test_posture, x_test)
        
        ## merge train data
        train_data <- cbind(subjects_train, train_posture, x_train)
        
        ## merge both test and train data
        full_data <- rbind(test_data, train_data)
        std_index <- grep("-std()", names(full_data))
        mean_index <- grep("-mean()", names(full_data))
        
        full_data_mean_std <- cbind(full_data[1:2], full_data[std_index], full_data[mean_index])
        
}
