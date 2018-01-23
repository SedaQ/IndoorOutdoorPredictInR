#install.packages('e1071')
library(e1071)

classifier = svm(formula = userIndoorMark ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'polynomial')
#kernel could be: 'linear', 'polynomial', 'radial basis', 'sigmoid'

y_pred = predict(classifier, newdata = test_set[,-1])
# Making the Confusion Matrix
cm = table(test_set[, 1], y_pred)

#accuracy(actual = test_set, as.numeric(y_pred))
