setwd("/Users/divyasuryakumar/Documents/PracticalMachineLearning")
getwd()
list.files()
library(ElemStatLearn)
library(caret)
library(rpart)
library(randomForest)
set.seed(357)

trainset <- read.csv("pml-training.csv", header=TRUE, sep=",", na.strings=c("NA",""))
testset <- read.csv("pml-testing.csv", header=TRUE, sep=",", na.strings=c("NA",""))

trainset <- trainset[,-1] #unwanted id column 
inTrain = createDataPartition(trainset$classe, p=0.60, list=FALSE)
training = trainset[inTrain,]
validating = trainset[-inTrain,]

sum((colSums(!is.na(training[,-ncol(training)])) < 0.6*nrow(training)))
Keep <- c((colSums(!is.na(training[,-ncol(training)])) >= 0.6*nrow(training)))
training   <-  training[,Keep]
validating <- validating[,Keep]

model <- randomForest(classe~.,data=training)
print(model)

importance(model)
confusionMatrix(predict(model,newdata=validating[,-ncol(validating)]),validating$classe)
accurancy<-c(as.numeric(predict(model,newdata=validating[,-ncol(validating)])==validating$classe))
accurancy<-sum(accurancy)*100/nrow(validating)

plot(model, log ="y", lwd = 2, main = "Random forest accuracy")

testset <- testset[,-1] # Remove the first column that represents a ID Row
testset <- testset[ , Keep] # Keep the same columns of testing dataset
testset <- testset[,-ncol(testset)] # Remove the problem ID

# Coerce testing dataset to same class and strucuture of training dataset 
testing <- rbind(training[100, -59] , testset) 
# Apply the ID Row to row.names and 100 for dummy row from testing dataset 
row.names(testing) <- c(100, 1:20)

predictions <- predict(model,newdata=testing[-1,])
print(predictions)
length(predictions)

# true accuracy of the predicted model
p2 <- predict(model, validating)
outOfSampleError.accuracy <- sum(p2 == validating$classe)/length(p2)
outOfSampleError.accuracy

# out of sample error and percentage of out of sample error
outOfSampleError <- 1 - outOfSampleError.accuracy
outOfSampleError

e <- outOfSampleError * 100
paste0("Out of sample error estimation: ", round(e, digits = 2), "%")

write_files <- function(x) {
  n <- length(x)
  for (i in 1:n) {
    filename <- paste0("problem_id", i, ".txt")
    write.table(x[i], file=filename, quote=FALSE, row.names=FALSE,col.names=FALSE)
  }
}

write_files(predictions)
