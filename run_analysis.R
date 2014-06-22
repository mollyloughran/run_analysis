#first dataset:
        feat <- read.table("./UCI HAR Dataset/features.txt", col.names=c("id","featname"))
        feat2 <- feat[grep("std|mean", feat[[2]]),]
        feat3 <- tolower(gsub("[[:punct:]]","",feat2$featname))
        acts <- read.table("./UCI HAR Dataset/features_info.txt", col.names=c("id","actname"))
                # reads the features and activities indexes for naming
        xtestdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
        xtestdata2 <- xtestdata[feat2$id]
        colnames(xtestdata2) <- feat3
        ytestdata <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names="labels")
        subtestdata <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="sub")
        testdata <- cbind(subtestdata, ytestdata, xtestdata2)
                #reads test data sets and concatenates sets
        xtraindata <- read.table("./UCI HAR Dataset/train/X_train.txt")
        xtraindata2 <- xtraindata[feat2$id]
        colnames(xtraindata2) <- feat3
        ytraindata <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names="labels")
        subtraindata <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="sub")
        traindata <- cbind(subtraindata, ytraindata, xtraindata2)
                #reads train data sets and concatenates sets
        mergeset <- rbind(testdata,traindata) #creates mergeset
        write.table(mergeset, file = "mergeset.txt", sep=" ") #writes dataset
#second dataset: 
        meltset <- melt(mergeset,id=c("sub","labels"),measure.vars=feat3)        
        subjectset <- dcast(meltset, sub ~ variable,mean)
        activityset <- dcast(meltset, labels ~ variable,mean)      
        activityset$labels <- acts$actname #assigns activity names to activity labels
        tidyset <- rbind(subjectset,activityset) #creates tidy set
        write.table(mergeset, file = "tidyset.txt", sep=" ")
