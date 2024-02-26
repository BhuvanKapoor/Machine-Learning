# Logistic Regression

#### Bhuvan Kapoor 

``` r
library(mlbench)
library(MASS)
library(pROC)
```

    ## Type 'citation("pROC")' for a citation.

    ## 
    ## Attaching package: 'pROC'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     cov, smooth, var

``` r
data(PimaIndiansDiabetes2)
head(PimaIndiansDiabetes2)
```

    ##   pregnant glucose pressure triceps insulin mass pedigree age diabetes
    ## 1        6     148       72      35      NA 33.6    0.627  50      pos
    ## 2        1      85       66      29      NA 26.6    0.351  31      neg
    ## 3        8     183       64      NA      NA 23.3    0.672  32      pos
    ## 4        1      89       66      23      94 28.1    0.167  21      neg
    ## 5        0     137       40      35     168 43.1    2.288  33      pos
    ## 6        5     116       74      NA      NA 25.6    0.201  30      neg

``` r
# Descriptive Statistics
summary(PimaIndiansDiabetes2)
```

    ##     pregnant         glucose         pressure         triceps     
    ##  Min.   : 0.000   Min.   : 44.0   Min.   : 24.00   Min.   : 7.00  
    ##  1st Qu.: 1.000   1st Qu.: 99.0   1st Qu.: 64.00   1st Qu.:22.00  
    ##  Median : 3.000   Median :117.0   Median : 72.00   Median :29.00  
    ##  Mean   : 3.845   Mean   :121.7   Mean   : 72.41   Mean   :29.15  
    ##  3rd Qu.: 6.000   3rd Qu.:141.0   3rd Qu.: 80.00   3rd Qu.:36.00  
    ##  Max.   :17.000   Max.   :199.0   Max.   :122.00   Max.   :99.00  
    ##                   NA's   :5       NA's   :35       NA's   :227    
    ##     insulin            mass          pedigree           age        diabetes 
    ##  Min.   : 14.00   Min.   :18.20   Min.   :0.0780   Min.   :21.00   neg:500  
    ##  1st Qu.: 76.25   1st Qu.:27.50   1st Qu.:0.2437   1st Qu.:24.00   pos:268  
    ##  Median :125.00   Median :32.30   Median :0.3725   Median :29.00            
    ##  Mean   :155.55   Mean   :32.46   Mean   :0.4719   Mean   :33.24            
    ##  3rd Qu.:190.00   3rd Qu.:36.60   3rd Qu.:0.6262   3rd Qu.:41.00            
    ##  Max.   :846.00   Max.   :67.10   Max.   :2.4200   Max.   :81.00            
    ##  NA's   :374      NA's   :11

``` r
# Removing missing values
new_data <- na.omit(PimaIndiansDiabetes2)
summary(new_data)
```

    ##     pregnant         glucose         pressure         triceps     
    ##  Min.   : 0.000   Min.   : 56.0   Min.   : 24.00   Min.   : 7.00  
    ##  1st Qu.: 1.000   1st Qu.: 99.0   1st Qu.: 62.00   1st Qu.:21.00  
    ##  Median : 2.000   Median :119.0   Median : 70.00   Median :29.00  
    ##  Mean   : 3.301   Mean   :122.6   Mean   : 70.66   Mean   :29.15  
    ##  3rd Qu.: 5.000   3rd Qu.:143.0   3rd Qu.: 78.00   3rd Qu.:37.00  
    ##  Max.   :17.000   Max.   :198.0   Max.   :110.00   Max.   :63.00  
    ##     insulin            mass          pedigree           age        diabetes 
    ##  Min.   : 14.00   Min.   :18.20   Min.   :0.0850   Min.   :21.00   neg:262  
    ##  1st Qu.: 76.75   1st Qu.:28.40   1st Qu.:0.2697   1st Qu.:23.00   pos:130  
    ##  Median :125.50   Median :33.20   Median :0.4495   Median :27.00            
    ##  Mean   :156.06   Mean   :33.09   Mean   :0.5230   Mean   :30.86            
    ##  3rd Qu.:190.00   3rd Qu.:37.10   3rd Qu.:0.6870   3rd Qu.:36.00            
    ##  Max.   :846.00   Max.   :67.10   Max.   :2.4200   Max.   :81.00

``` r
# Train-Test Split
set.seed(12)
data_1 <- sort(sample(nrow(new_data), nrow(new_data)*0.7)) 
data_1    # containing the row index which have been selected for the training data set
```

    ##   [1]   1   2   3   8  10  12  13  14  15  16  17  20  22  23  26  29  30  31
    ##  [19]  32  34  35  38  39  40  41  42  43  44  45  46  48  49  50  51  54  55
    ##  [37]  57  58  61  62  63  64  66  67  68  69  70  71  72  73  74  75  77  78
    ##  [55]  79  81  82  83  84  85  87  88  89  91  93  94 100 103 104 105 106 108
    ##  [73] 109 110 112 113 114 116 117 118 119 120 121 124 125 127 128 129 131 133
    ##  [91] 134 136 138 139 140 141 144 147 151 152 153 154 155 156 157 158 159 160
    ## [109] 161 163 164 165 166 167 168 169 170 171 173 174 176 179 180 181 182 183
    ## [127] 184 186 187 188 189 191 192 194 196 198 199 200 201 202 203 204 205 206
    ## [145] 207 208 211 212 215 216 217 218 219 220 223 224 225 226 227 228 230 231
    ## [163] 233 234 236 237 239 240 243 244 245 246 247 249 250 251 252 253 254 260
    ## [181] 263 264 265 266 267 268 269 271 274 275 276 278 281 282 283 284 285 286
    ## [199] 287 288 289 292 293 294 297 298 299 300 303 305 306 307 308 309 310 311
    ## [217] 313 314 316 317 318 320 321 323 324 326 327 328 329 332 333 335 336 337
    ## [235] 339 340 342 343 344 345 346 347 348 349 351 352 354 356 358 359 360 361
    ## [253] 364 367 369 370 372 373 375 376 377 378 381 382 383 384 385 386 387 388
    ## [271] 389 390 391 392

``` r
# Training data set
train <- new_data[data_1,]

# Testing data set
test <- new_data[-data_1,]

# Dimensions of the train-test data set
dim(train)
```

    ## [1] 274   9

``` r
dim(test)
```

    ## [1] 118   9

``` r
# Creating the Logistic Regression Model
log_model <- glm(diabetes~., data = train, family = binomial(link = "logit"))
summary(log_model)
```

    ## 
    ## Call:
    ## glm(formula = diabetes ~ ., family = binomial(link = "logit"), 
    ##     data = train)
    ## 
    ## Coefficients:
    ##               Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept) -1.144e+01  1.624e+00  -7.042 1.90e-12 ***
    ## pregnant     1.574e-01  7.027e-02   2.240  0.02507 *  
    ## glucose      4.709e-02  7.716e-03   6.103 1.04e-09 ***
    ## pressure     4.441e-03  1.460e-02   0.304  0.76098    
    ## triceps     -3.783e-04  2.178e-02  -0.017  0.98614    
    ## insulin     -2.705e-03  1.835e-03  -1.474  0.14049    
    ## mass         9.749e-02  3.434e-02   2.839  0.00452 ** 
    ## pedigree     1.350e+00  5.558e-01   2.429  0.01515 *  
    ## age          5.317e-03  2.252e-02   0.236  0.81335    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for binomial family taken to be 1)
    ## 
    ##     Null deviance: 342.49  on 273  degrees of freedom
    ## Residual deviance: 222.19  on 265  degrees of freedom
    ## AIC: 240.19
    ## 
    ## Number of Fisher Scoring iterations: 5

``` r
# To predict using Logistic Regression model, probabilities obtained
log_pred <- predict(log_model, test, type = "response")
head(log_pred, 10)
```

    ##         9        14        15        17        20        25        40        41 
    ## 0.6103279 0.3488212 0.6423715 0.3158652 0.1727611 0.7723145 0.4883689 0.8047388 
    ##        51        54 
    ## 0.0258812 0.8710553

``` r
# Classifying the data set
log_pred_rd <- ifelse(log_pred > 0.5, 1, 0)
head(log_pred_rd)
```

    ##  9 14 15 17 20 25 
    ##  1  0  1  0  0  1