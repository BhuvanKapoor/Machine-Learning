# Experiment: Gradient Descent

library(grid)
library(dplyr)
library(scales)
library(ggplot2)
library(Deriv)

Formula <- function(x) {
  (x-2)**2+2
}

# visualization for the formula
ggplot(data.frame(x=c(0,4)), aes(x)) +
  stat_function(fun = Formula) +
  geom_point(data = data.frame(x = 2, y = Formula(2)), aes(x,y),
             color = "blue", size = 3) +
  ggtitle(expression((x-2)**2+2))

# finding the derivative for the Formula
derivative <- Deriv(Formula,"x")
derivative

# defining the alpha value (learning rate)
learning_rate <- 0.2

# initializing the values
xold <- 2.2
xnew <- xold - learning_rate*derivative(xold)
xnew

# define the epsilon value & maximum iterations allowed
epsilon <- 0.01
step <- 2
iter <- 10

# records the value of x & y and add the initial guess
xtrace <- list()
ytrace <- list()
xtrace[[1]] <- xold
ytrace[[1]] <- Formula(xold)
xtrace[[2]] <- xnew
ytrace[[2]] <- Formula(xnew)

delta <- abs(xold - xnew)
while (delta >= epsilon & step <= iter) {
  step <- step + 1
  xtrace[[step]] <- xtrace[[step-1]] - learning_rate*derivative(xtrace[[step-1]])
  ytrace[[step]] <- Formula(xtrace[[step]])
  delta <- abs(xtrace[[step-1]] - xtrace[[step]])  
}

record <- data.frame(x = do.call(rbind, xtrace), y = do.call(rbind, ytrace))
record
