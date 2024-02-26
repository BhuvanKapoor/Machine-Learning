# Linear Discriminant Analysis

#### Bhuvan Kapoor 

``` r
class_1 <- cbind(c(5,10,4,8,4),c(4,15,11,11,7))
class_1
```

    ##      [,1] [,2]
    ## [1,]    5    4
    ## [2,]   10   15
    ## [3,]    4   11
    ## [4,]    8   11
    ## [5,]    4    7

``` r
class_2 <- cbind(c(6,10,10,14,13),c(3,3,7,6,11))
class_2
```

    ##      [,1] [,2]
    ## [1,]    6    3
    ## [2,]   10    3
    ## [3,]   10    7
    ## [4,]   14    6
    ## [5,]   13   11

``` r
mu_1 <- cbind(mean(class_1[,1]), mean(class_1[,2]))
mu_1
```

    ##      [,1] [,2]
    ## [1,]  6.2  9.6

``` r
mu_2 <- cbind(mean(class_2[,1]), mean(class_2[,2]))
mu_2
```

    ##      [,1] [,2]
    ## [1,] 10.6    6

``` r
# Centering the data matrix
centered_class_1 <- scale(class_1, center = T, scale = F)
centered_class_1
```

    ##      [,1] [,2]
    ## [1,] -1.2 -5.6
    ## [2,]  3.8  5.4
    ## [3,] -2.2  1.4
    ## [4,]  1.8  1.4
    ## [5,] -2.2 -2.6
    ## attr(,"scaled:center")
    ## [1] 6.2 9.6

``` r
centered_class_2 <- scale(class_2, center = T, scale = F)
centered_class_2
```

    ##      [,1] [,2]
    ## [1,] -4.6   -3
    ## [2,] -0.6   -3
    ## [3,] -0.6    1
    ## [4,]  3.4    0
    ## [5,]  2.4    5
    ## attr(,"scaled:center")
    ## [1] 10.6  6.0

``` r
# Calculating the Scatter matrix
s_1 <- t(centered_class_1) %*% centered_class_1
s_1
```

    ##      [,1] [,2]
    ## [1,] 28.8 32.4
    ## [2,] 32.4 71.2

``` r
s_2 <- t(centered_class_2) %*% centered_class_2
s_2
```

    ##      [,1] [,2]
    ## [1,] 39.2   27
    ## [2,] 27.0   44

``` r
s_w <- s_1 + s_2
s_w
```

    ##      [,1]  [,2]
    ## [1,] 68.0  59.4
    ## [2,] 59.4 115.2

``` r
s_w_inverse <- solve(s_w)
s_w_inverse
```

    ##             [,1]        [,2]
    ## [1,]  0.02675809 -0.01379714
    ## [2,] -0.01379714  0.01579471

``` r
# Optimal line direction vector
v <- s_w_inverse %*% t(mu_1 - mu_2)
v
```

    ##            [,1]
    ## [1,] -0.1674053
    ## [2,]  0.1175684

``` r
# Projected Data
Y_1 <- t(v) %*% t(class_1)
Y_1
```

    ##            [,1]       [,2]      [,3]        [,4]      [,5]
    ## [1,] -0.3667531 0.08947236 0.6236307 -0.04599047 0.1533573

``` r
Y_2 <- t(v) %*% t(class_2)
Y_2
```

    ##            [,1]      [,2]       [,3]      [,4]      [,5]
    ## [1,] -0.6517267 -1.321348 -0.8510745 -1.638264 -0.883017