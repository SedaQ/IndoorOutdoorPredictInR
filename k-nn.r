#install.packages("ISLR")
#install.packages("class")
#install.packages("MASS")
#install.packages("ElemStatLearn")
#install.packages('caret')

#https://daviddalpiaz.github.io/r4sl/k-nearest-neighbors.html

# Fitting K-NN to the Training set and Predicting the Test set results
library(ISLR)
library(class)
library(MASS)

y_pred = knn(train = training_set[,-1],
             test = test_set[,-1],
             cl = training_set[, 1],
             k = 20)

# Making the Confusion Matrix
cm = table(test_set[, 1], y_pred)

# load Caret package for computing Confusion matrix
#install.packages('caret', dependencies=TRUE)
library(caret)

confusionMatrix(cm)



