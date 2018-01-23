#install.packages('rpart')

library(rpart)
classifier = rpart(formula = userIndoorMark ~ .,
                   data = training_set)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-1], type = 'class')

# Making the Confusion Matrix
cm = table(test_set[, 1], y_pred)


# load Caret package for computing Confusion matrix
#install.packages('caret', dependencies=TRUE)
library(caret)

confusionMatrix(cm)
