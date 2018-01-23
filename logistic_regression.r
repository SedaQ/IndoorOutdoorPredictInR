#Fitting logistic Regression to the Training set
classifier = glm(formula = userIndoorMark ~ .,
                 family = binomial,
                 data = training_set)

#Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata = test_set[-1]) #-1 means without 1. column
y_pred = ifelse(prob_pred > 0.5, 1, 0) #prevede na 1 nebo 0 podle toho jestli je ta sance vetsi nez 0.5, ze si koupi neco

#Making the confusion Matrix
cm = table(test_set[,1],y_pred) #test set with real results vs y_pred with predicted results