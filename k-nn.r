#install.packages("ISLR")
#install.packages("class")
#install.packages("MASS")
#install.packages("ElemStatLearn")

#https://daviddalpiaz.github.io/r4sl/k-nearest-neighbors.html

accuracy = function(actual, predicted) {
  mean(actual == predicted)
}

# Fitting K-NN to the Training set and Predicting the Test set results
library(ISLR)
library(class)
library(MASS)
y_pred = knn(train = training_set,
             test = test_set,
             cl = training_set,
             k = 5,
             prob = TRUE)

accuracy(actual = training_set,
         y_pred)


# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)

# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

