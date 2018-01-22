dataset = read.csv('IndoorOutdoor.csv')


dataset <- subset(dataset, select=c("latency","radioTechnology","reachableVia","altitude","wifiEnabled","userIndoorMark"))

#, "radioTechnology", "reachableVia", "altitude", "horizontalAccurancy","wifiEnabled","userIndoorMark"
# Encoding categorical data
dataset$radioTechnology = factor(dataset$radioTechnology,
                                 levels = c('GPRS','EDGE','WCDMA','HSPDA','HSUPA','CDMA1x','CDMAEVDORev0','CDMAEVDORevA','CDMAEVDORevB','HRPD','LTE','unknown'),
                                 labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12))

dataset$wifiEnabled = factor(dataset$wifiEnabled,
                             levels = c('true', 'false'),
                             labels = c(1, 2))


dataset$reachableVia = factor(dataset$reachableVia,
                              levels = c('Wi-Fi', 'WWAN'),
                              labels = c(1, 2))

dataset$userIndoorMark = factor(dataset$userIndoorMark,
                              levels = c('true', 'false'),
                              labels = c(1, 2))


#Default$userIndoorMark = as.numeric(Default$userIndoorMark) - 1
#default_index = sample(nrow(Default), 5000)
#default_train = Default[default_index, ]
#default_test = Default[-default_index, ]


#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$latency, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

