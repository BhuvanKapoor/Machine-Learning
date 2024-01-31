# Experiment 2: Dimensionality Reduction
# Aim: To reduce the dimension using PCA and SVD

# Principal Component Analysis
iris_data <- iris[,1:4]   # Leaving the class label for evaluation
iris_data
iris_data_scaled <- scale(iris_data, center = T, scale = T)   # Scaling the data
iris_data_scaled

# Evaluating the covariance matrix
cor_matrix <- cor(iris_data_scaled)
cor_matrix

# Finding the Eigen value and vectors for the covariance matrix
eigen <- eigen(cor_matrix)
eigen

# Evaluating the projected data before dimension reduction
projected_data_before <- iris_data_scaled %*% eigen$vectors
projected_data_before

# Finding the variance capture by each eigen value
variance_captured <- 0
for (i in 1:length(eigen$values)) {
  variance_captured <- variance_captured + eigen$values[i]/sum(eigen$values)
  cat("Variance captured upto", eigen$values[i], ":", variance_captured, "\n")
}
# Evaluating the projected data 
projected_data <- iris_data_scaled %*% eigen$vectors[,1:2]
projected_data

# Using the inbuilt function
iris_pca <- prcomp(iris_data, center = T, scale = T, rank = 2)
iris_pca
summary(iris_pca)


# Singular Value Decomposition
# A <- rbind(c(1,4),c(2,5),c(3,6))
A <- cbind(c(1,2,3),c(4,5,6))
A

# Using the in-build function
svd_A <- svd(A)
svd_A

calc_A <- svd_A$u %*% diag(svd_A$d) %*% t(svd_A$v)
calc_A

# Using the traditional method
# A = U*Sigma*V_t

# Using A*A_t
A_At <- A %*% t(A)
A_At_eigen <- eigen(A_At)
sigma_matrix <- diag(sqrt(A_At_eigen$values))
sigma_matrix

u_matrix <- A_At_eigen$vectors / sqrt(colSums(A_At_eigen$vectors**2))
u_matrix
v_matrix <- matrix(NA,nrow = ncol(A), ncol = ncol(sigma_matrix))
for(i in 1:ncol(v_matrix)) {
  v_matrix[,i] <- (1/sigma_matrix[i,i]) * t(A) %*% u_matrix[,i]
}
v_matrix

# verify A = U*Sigma*V_t
u_matrix %*% sigma_matrix %*% t(v_matrix)

# Using A_t*A
At_A <- t(A) %*% A
At_A_eigen <- eigen(At_A)
sigma_matrix <- diag(sqrt(At_A_eigen$values))
sigma_matrix

v_matrix <- At_A_eigen$vectors / sqrt(colSums(At_A_eigen$vectors**2))
v_matrix

u_matrix <- matrix(NA,nrow = nrow(A), ncol = ncol(sigma_matrix))
for(i in 1:ncol(u_matrix)) {
  u_matrix[,i] <- (1/sigma_matrix[i,i]) * A %*% v_matrix[,i]
}
u_matrix
# verify A = U*Sigma*V_t
u_matrix %*% sigma_matrix %*% t(v_matrix)


# Frobenius Norm
B_sigma <- as.matrix(diag(svd_A$d))[1,1]
B_sigma
B_u <- as.matrix(svd_A$u[,1])
B_u
B_v <- as.matrix(svd_A$v[,1])
B_v
B <- B_u %*% B_sigma %*% t(B_v)
B
norm <- sqrt(sum((A-B)**2))
norm
