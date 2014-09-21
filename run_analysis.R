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
        names(y_test) <- "Activity_ID"
        names(y_train) <- "Activity_ID"
        names(activity_labels) <- c("Activity_ID", "Activity")
        
        ## prep datasets for merging
        y_test <- merge(y_test, activity_labels)
        test_activity <- as.data.frame(y_test[,2])
        y_train <- merge(y_train, activity_labels)
        train_activity <- as.data.frame(y_train[,2])
        
        names(test_activity) <- "Activity"
        names(train_activity) <- "Activity"
        
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
        #/
        
        ## merge test data
        test_data <- cbind(subjects_test, test_activity, x_test, type_test, elements_test_data) ## 
        
        ## merge train data
        train_data <- cbind(subjects_train, train_activity, x_train, type_train, elements_train_data)  ## 
        
        ## merge both test and train data
        full_data <- rbind(test_data, train_data)
        std_index <- grep("-std()", names(full_data))
        mean_index <- grep("-mean()", names(full_data))
        
        full_data_mean_std <- cbind(full_data[1:2], full_data[std_index], full_data[mean_index])
        
        full_data_mean_std$SubjectAct <- paste(full_data_mean_std$Subject_ID, full_data_mean_std$Activity, sep="-")
        
        full_data_mean_std <- full_data_mean_std[,3:ncol(full_data_mean_std)]
        library(reshape2)
        full_data_mean_std_melt <- melt(full_data_mean_std, id=c("SubjectAct"))
        full_data_mean_std_melt <- dcast(full_data_mean_std_melt, SubjectAct~variable, mean)
        library(tidyr)
        full_data_mean_std_melt <- separate(full_data_mean_std_melt, SubjectAct, c("Subject_ID", "Activity"), sep="-")
        full_data_mean_std_melt$Subject_ID <- as.numeric(full_data_mean_std_melt$Subject_ID) 
        full_data_mean_std_melt <- full_data_mean_std_melt[order(full_data_mean_std_melt$Subject_ID, full_data_mean_std_melt$Activity),]
        write.table(full_data_mean_std_melt, "./Tidy_data.txt", row.name = FALSE)
        
        
}
