# Experiment 3
# Aim: Multi-dimensional Scaling 

n <- 4
P <- rbind(c(0,93,82,133),c(93,0,52,60),c(82,52,0,111),c(133,60,111,0))

# Proximity Matrix
P_2 <- P**2
P_2
J <- diag(n) - ((1/n) * matrix(1, nrow = n, ncol = n))
J

# Double Centering Matrix
B <- (-1/2) * J %*% P_2 %*% J
B

eigen_B <- eigen(B)
eigen_B

eigen_B_values <- eigen_B$values[1:2]
eigen_B_values

eigen_B_vectors <- eigen_B$vectors[,1:2]
eigen_B_vectors

Lambda_matrix <- diag(sqrt(eigen_B_values))
Lambda_matrix

X <- eigen_B_vectors %*% Lambda_matrix
X

plot(X, pch = 19, xlim = range(X[,1])+c(0,20), ylim = range(X[,2])+c(0,20), main = "MDS Map")
city_names <- c("cph", "aar", "ode", "aal")
text(X[,1],X[,2],pos = 4, labels = city_names)
abline(v=0,h=0)
