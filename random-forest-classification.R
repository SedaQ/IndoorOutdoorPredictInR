# Fitting Random Forest Classification to the Training set
#install.packages('randomForest')
library(randomForest)
set.seed(123)
classifier = randomForest(x = training_set[-1],
                          y = training_set$userIndoorMark,
                          ntree = 500)
# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-1])

# Making the Confusion Matrix
cm = table(test_set[, 1], y_pred)


# load Caret package for computing Confusion matrix
#install.packages('caret', dependencies=TRUE)
library(caret)
confusionMatrix(cm)

