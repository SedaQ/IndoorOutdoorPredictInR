dataset = read.csv('IndoorOutdoor.csv')

dataset <- subset(dataset, select=c("userIndoorMark","latency","radioTechnology","reachableVia","altitude","wifiEnabled"))
#dataset <- subset(dataset, select=c("userIndoorMark","latency","altitude", "reachableVia"))
#dataset <- subset(dataset, select=c("userIndoorMark","latency","altitude"))

# Encoding categorical data
#dataset$userIndoorMark = as.numeric(dataset$userIndoorMark)
dataset$radioTechnology = factor(dataset$radioTechnology,
                                 levels = c('GPRS','EDGE','WCDMA','HSPDA','HSUPA','CDMA1x','CDMAEVDORev0','CDMAEVDORevA','CDMAEVDORevB','HRPD','LTE','unknown'),
                                 labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12))

dataset$wifiEnabled = factor(dataset$wifiEnabled,
                             levels = c('false','true'),
                             labels = c(0, 1))


dataset$reachableVia = factor(dataset$reachableVia,
                              levels = c('Wi-Fi', 'WWAN'),
                              labels = c(0,1))

dataset$userIndoorMark = factor(dataset$userIndoorMark,
                              levels = c('false', 'true'),
                              labels = c(0,1))

#contrasts(dataset$userIndoorMark)

dataset <- data.frame(sapply(dataset, function(x) as.numeric(as.character(x)))) #convert all data to factors
#dataset <- data.frame(sapply(dataset, function(x) as.numeric(x))) #convert all data to factors


#install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$userIndoorMark, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Feature Scaling
#training_set[2:3] = scale(training_set[2:3])
#test_set[2:3] = scale(test_set[2:3])
training_set[-1] = scale(training_set[-1])
test_set[-1] = scale(test_set[-1])

