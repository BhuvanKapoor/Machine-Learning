## DECISION TREE

library(caret)
library(rpart.plot)
library(e1071)

car_df <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data", header = F)
car_df
str(car_df)
summary(car_df)

set.seed(3013)
intrain <- createDataPartition(y = car_df$V7, 
                               p=0.7, 
                               list = F)
train_data <- car_df[intrain,]
test_data <- car_df[-intrain,]

train_data
dim(train_data)
dim(test_data)

trctrl <- trainControl(method = 'cv', number = 10)
set.seed(3333)
dtree_fit <- train(V7 ~ ., 
                   data = train_data, 
                   method = 'rpart', 
                   parms = list(split = 'Information'), 
                   trControl = trctrl)
dtree_fit

test_pred <- predict(dtree_fit, test_data)
test_pred


test_data$V7
confusionMatrix(test_pred, test_data$V7)


## Using RPART
library(rpart)
library(rpart.plot)

data('iris')
head(iris)
str(iris)
summary(iris)

set.seed(33)
tree <- rpart(Species ~ ., data = iris, method = 'class')
rpart.plot(tree)

unseen <- data.frame(Sepal.Length = c(5.3, 7.2),
                     Sepal.Width = c(2.9,3.9),
                     Petal.Length = c(1.7,5.4),
                     Petal.Width = c(0.8,2.3))
unseen

predict(tree, unseen, type = 'class')
