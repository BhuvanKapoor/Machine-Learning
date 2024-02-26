# LDA 

class_1 <- cbind(c(5,10,4,8,4),c(4,15,11,11,7))
class_1
class_2 <- cbind(c(6,10,10,14,13),c(3,3,7,6,11))
class_2

mu_1 <- cbind(mean(class_1[,1]), mean(class_1[,2]))
mu_1
mu_2 <- cbind(mean(class_2[,1]), mean(class_2[,2]))
mu_2

# Centering the data matrix
centered_class_1 <- scale(class_1, center = T, scale = F)
centered_class_1

centered_class_2 <- scale(class_2, center = T, scale = F)
centered_class_2

# Calculating the Scatter matrix
s_1 <- t(centered_class_1) %*% centered_class_1
s_1

s_2 <- t(centered_class_2) %*% centered_class_2
s_2

s_w <- s_1 + s_2
s_w

s_w_inverse <- solve(s_w)
s_w_inverse

# Optimal line direction vector
v <- s_w_inverse %*% t(mu_1 - mu_2)
v

# Projected Data
Y_1 <- t(v) %*% t(class_1)
Y_1

Y_2 <- t(v) %*% t(class_2)
Y_2