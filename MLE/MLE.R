## Experiment 10 : MLE
library(tidyverse)
library(EnvStats)
library(dplyr)

# Binomial Distribution
set.seed(33)
heads <- rbinom(1,100,0.5)
heads
ebinom(heads, size = 100, method = 'mle')

# Poisson Distribution
set.seed(33)
data_pois <- rpois(100, lambda = 5)

df_pois <- data.frame(data_pois)

df_pois %>%
  ggplot(aes(x = data_pois)) +
  geom_histogram(bins = 20) + 
  labs(title = "Poisson Distribution",
       subtitle = 'lambda = 5',
       x = 'data',
       y = 'count') +
  theme_bw()

epois(data_pois, method = 'mle')

# Normal Distribution
set.seed(33)
x <- rnorm(100, mean = 3, sd = 2)
mean(x)
sd(x)
data.frame(x=x) %>%
  ggplot(aes(x=x)) +
  geom_histogram(bins = 20, color = 'blue', fill = 'lightblue') +
  theme_bw(base_size = 16) +
  xlab("Data")

enorm(x, method = 'mle')
