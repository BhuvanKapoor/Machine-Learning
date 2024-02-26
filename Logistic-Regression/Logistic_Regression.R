# Experiment 4: Logistic Regression

library(mlbench)
library(MASS)
library(pROC)

data(PimaIndiansDiabetes2)
head(PimaIndiansDiabetes2)

# Descriptive Statistics
summary(PimaIndiansDiabetes2)

# Removing missing values
new_data <- na.omit(PimaIndiansDiabetes2)
summary(new_data)

# Train-Test Split
set.seed(12)
data_1 <- sort(sample(nrow(new_data), nrow(new_data)*0.7)) 
data_1    # containing the row index which have been selected for the training data set

# Training data set
train <- new_data[data_1,]

# Testing data set
test <- new_data[-data_1,]

# Dimensions of the train-test data set
dim(train)
dim(test)

# Creating the Logistic Regression Model
log_model <- glm(diabetes~., data = train, family = binomial(link = "logit"))
summary(log_model)

# To predict using Logistic Regression model, probabilities obtained
log_pred <- predict(log_model, test, type = "response")
head(log_pred, 10)

# Classifying the data set
log_pred_rd <- ifelse(log_pred > 0.5, 1, 0)
head(log_pred_rd)

