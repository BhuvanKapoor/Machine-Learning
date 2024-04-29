## Experiment 9 : SVM

library(tidyverse)      # Data Manipulation
library(kernlab)        # SVM Methodology
library(e1071)          # SVM Methodology
library(ISLR)           # Sample Data
library(RColorBrewer)   # Customize Color

## Example 1
# Construct sample data set - completely separable
set.seed(10)
x <- matrix(rnorm(25*2), ncol = 2)
y <- c(rep(0,13), rep(1,12))
x[y==1,] = x[y==1,] + 3
data <- data.frame(x=x, y=as.factor(y))
data

# Plot Data
plot(data$x.2,data$x.1, xlab = "x2", ylab = "x1", col = data$y, pch = 4)

# Fit SVM
svmfit <- svm(y~., data = data, kernel = 'linear', scale = F)

# Plot Results
plot(svmfit, data)
svmfit$SV

## Example 2
# Construct sample data set - not completely separable
set.seed(10)
x <- matrix(rnorm(20*2), ncol = 2)
y <- c(rep(-1,10), rep(1,10))
x[y==1,] = x[y==1,] + 1
data <- data.frame(x=x, y=as.factor(y))
data

# Plot Data
plot(data$x.2,data$x.1, xlab = "x2", ylab = "x1", col = data$y, pch = 4)

# Fit SVM
svmfit_1 <- svm(y~., data = data, kernel = 'linear', scale = F, cost = 10)
svmfit_2 <- svm(y~., data = data, kernel = 'linear', scale = F, cost = 20)

# Plot Results
plot(svmfit_1, data)
plot(svmfit_2, data)