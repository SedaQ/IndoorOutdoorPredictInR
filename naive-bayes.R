# Fitting SVM to the Training set
#install.packages('e1071', dependencies=TRUE)
library(e1071)
classifier = naiveBayes(x = training_set[-1],
                        y = training_set$userIndoorMark)
# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-1])

# Making the Confusion Matrix
cm = table(test_set[, 1], y_pred)

# load Caret package for computing Confusion matrix
library(caret)
confusionMatrix(cm)
