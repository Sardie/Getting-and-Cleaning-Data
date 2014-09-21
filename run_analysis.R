run_analysis <- function() {
        ## working directory = UCI HAR Dataset folder
        
        ## read all relevant data into working space.
        
        ## startng with "overall" data
        features <- read.table("./features.txt")
        activity_labels <- read.table("./activity_labels.txt")
        
        ## then test data
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
        
        ## then training data
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
        
        type_test <- rep("test", times=nrow(x_test))
        type_test <- as.data.frame(type_test)
        type_train <- rep("train", times=nrow(x_train))
        type_train <- as.data.frame(type_train)
        names(type_test) <- "Type"
        names(type_train) <- "Type"

        col_num <- 1:128
        
        test_element <- rep("body_acc_x E", times=ncol(body_acc_x_test))
        test_elements <- paste(test_element, col_num, sep="")
        names(body_acc_x_test) <- test_elements
        
        test_element <- rep("body_acc_y E", times=ncol(body_acc_y_test))
        test_elements <- paste(test_element, col_num, sep="")
        names(body_acc_y_test) <- test_elements
        
        test_element <- rep("body_acc_z E", times=ncol(body_acc_z_test))
        test_elements <- paste(test_element, col_num, sep="")
        names(body_acc_z_test) <- test_elements
        
        test_element <- rep("body_gyro_x E", times=ncol(body_gyro_x_test))
        test_elements <- paste(test_element, col_num, sep="")
        names(body_gyro_x_test) <- test_elements
        
        test_element <- rep("body_gyro_y E", times=ncol(body_gyro_y_test))
        test_elements <- paste(test_element, col_num, sep="")
        names(body_gyro_y_test) <- test_elements
        
        test_element <- rep("body_gyro_z E", times=ncol(body_gyro_z_test))
        test_elements <- paste(test_element, col_num, sep="")
        names(body_gyro_z_test) <- test_elements
        
        test_element <- rep("total_acc_x E", times=ncol(total_acc_x_test))
        test_elements <- paste(test_element, col_num, sep="")
        names(total_acc_x_test) <- test_elements
        
        test_element <- rep("total_acc_y E", times=ncol(total_acc_y_test))
        test_elements <- paste(test_element, col_num, sep="")
        names(total_acc_y_test) <- test_elements
        
        test_element <- rep("total_acc_z E", times=ncol(total_acc_z_test))
        test_elements <- paste(test_element, col_num, sep="")
        names(total_acc_z_test) <- test_elements
        
        
        
        train_element <- rep("body_acc_x E", times=ncol(body_acc_x_train))
        train_elements <- paste(train_element, col_num, sep="")
        names(body_acc_x_train) <- train_elements
        
        train_element <- rep("body_acc_y E", times=ncol(body_acc_y_train))
        train_elements <- paste(train_element, col_num, sep="")
        names(body_acc_y_train) <- train_elements
        
        train_element <- rep("body_acc_z E", times=ncol(body_acc_z_train))
        train_elements <- paste(train_element, col_num, sep="")
        names(body_acc_z_train) <- train_elements
        
        train_element <- rep("body_gyro_x E", times=ncol(body_gyro_x_train))
        train_elements <- paste(train_element, col_num, sep="")
        names(body_gyro_x_train) <- train_elements
        
        train_element <- rep("body_gyro_y E", times=ncol(body_gyro_y_train))
        train_elements <- paste(train_element, col_num, sep="")
        names(body_gyro_y_train) <- train_elements
        
        train_element <- rep("body_gyro_z E", times=ncol(body_gyro_z_train))
        train_elements <- paste(train_element, col_num, sep="")
        names(body_gyro_z_train) <- train_elements
        
        train_element <- rep("total_acc_x E", times=ncol(total_acc_x_train))
        train_elements <- paste(train_element, col_num, sep="")
        names(total_acc_x_train) <- train_elements
        
        train_element <- rep("total_acc_y E", times=ncol(total_acc_y_train))
        train_elements <- paste(train_element, col_num, sep="")
        names(total_acc_y_train) <- train_elements
        
        train_element <- rep("total_acc_z E", times=ncol(total_acc_z_train))
        train_elements <- paste(train_element, col_num, sep="")
        names(total_acc_z_train) <- train_elements
                
        
        ## Merge all 128-vector-columns variables
        elements_test_data <- cbind(body_acc_x_test, body_acc_y_test, body_acc_z_test, body_gyro_x_test, body_gyro_y_test, body_gyro_z_test, total_acc_x_test, total_acc_y_test, total_acc_z_test)
        
        elements_train_data <- cbind(body_acc_x_train, body_acc_y_train, body_acc_z_train, body_gyro_x_train, body_gyro_y_train, body_gyro_z_train, total_acc_x_train, total_acc_y_train, total_acc_z_train)
                
        ## averages and stores value in each of the 128 vector columns type data
        
        
        ## merge test data
        test_data <- cbind(subjects_test, test_posture, x_test, type_test, elements_test_data) ## 
        
        ## merge train data
        train_data <- cbind(subjects_train, train_posture, x_train, type_train, elements_train_data)  ## )
        
        ## merge both test and train data
        full_data <- rbind(test_data, train_data)
        std_index <- grep("-std()", names(full_data))
        mean_index <- grep("-mean()", names(full_data))
        
        full_data_mean_std <- cbind(full_data[1:2], full_data[std_index], full_data[mean_index])
        
}
