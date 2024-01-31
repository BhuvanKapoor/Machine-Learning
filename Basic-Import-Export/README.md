# Data Import Export

#### Bhuvan Kapoor

``` r
# Experiment 1 : Data Import - Export
# Objective: To import and export data using R

# Numeric Vector
a <- c(3,5,2,7,4)
a
```

    ## [1] 3 5 2 7 4

``` r
# String Vector
b <- c("str_1","str_2","str_3")
b
```

    ## [1] "str_1" "str_2" "str_3"

``` r
# Logical Vector
c <- c(F,T,F,F)
c
```

    ## [1] FALSE  TRUE FALSE FALSE

``` r
# Creating a matrix
# column-wise matrix
mat_col <- matrix(1:20,nrow = 5,ncol = 4)
mat_col
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    6   11   16
    ## [2,]    2    7   12   17
    ## [3,]    3    8   13   18
    ## [4,]    4    9   14   19
    ## [5,]    5   10   15   20

``` r
# row-wise matrix
mat_row <- matrix(1:20,nrow = 5,ncol = 4,byrow = T)
mat_row
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    2    3    4
    ## [2,]    5    6    7    8
    ## [3,]    9   10   11   12
    ## [4,]   13   14   15   16
    ## [5,]   17   18   19   20

``` r
# Matrix with labels
cells <- c(1,26,24,28)
row_names <- c("R1","R2")
col_names <- c("C1","C2")
mat <- matrix(cells,nrow = 2,ncol = 2,byrow = T,dimnames = list(row_names,col_names))
mat
```

    ##    C1 C2
    ## R1  1 26
    ## R2 24 28

``` r
# Extracting elements from the matrix
mat[1,2]  # extracting specific element
```

    ## [1] 26

``` r
mat[1,]   # extracting the row
```

    ## C1 C2 
    ##  1 26

``` r
mat[,1]   # extracting the column
```

    ## R1 R2 
    ##  1 24

``` r
# DATA FRAMES
id <- c(2,4,2,5)
colors <- c("red","white","red",NA)
passed <- c(F,T,F,T)
df <- data.frame(id,colors,passed)
df
```

    ##   id colors passed
    ## 1  2    red  FALSE
    ## 2  4  white   TRUE
    ## 3  2    red  FALSE
    ## 4  5   <NA>   TRUE

``` r
names(df) <- c("ID","Colors","Passed")  # naming the columns of df
df
```

    ##   ID Colors Passed
    ## 1  2    red  FALSE
    ## 2  4  white   TRUE
    ## 3  2    red  FALSE
    ## 4  5   <NA>   TRUE

``` r
df$Colors   # extracting a column from the df
```

    ## [1] "red"   "white" "red"   NA

``` r
# LIST
lst <- list(name = "fred", mynum = 4, mymatrix = mat, age = 5,3)
lst
```

    ## $name
    ## [1] "fred"
    ## 
    ## $mynum
    ## [1] 4
    ## 
    ## $mymatrix
    ##    C1 C2
    ## R1  1 26
    ## R2 24 28
    ## 
    ## $age
    ## [1] 5
    ## 
    ## [[5]]
    ## [1] 3

``` r
# FACTOR
gender <- c(rep("Male",20),rep("Female",20))
gender
```

    ##  [1] "Male"   "Male"   "Male"   "Male"   "Male"   "Male"   "Male"   "Male"  
    ##  [9] "Male"   "Male"   "Male"   "Male"   "Male"   "Male"   "Male"   "Male"  
    ## [17] "Male"   "Male"   "Male"   "Male"   "Female" "Female" "Female" "Female"
    ## [25] "Female" "Female" "Female" "Female" "Female" "Female" "Female" "Female"
    ## [33] "Female" "Female" "Female" "Female" "Female" "Female" "Female" "Female"

``` r
gender <- factor(gender)
summary(gender)
```

    ## Female   Male 
    ##     20     20

``` r
# Reading Excel files
#install.packages("readxl")
library(readxl)

marks_data_2023 <- read_excel("marks.xlsx")
marks_data_2023
```

    ## # A tibble: 6 × 3
    ##   Name    `Reg. No` Marks
    ##   <chr>   <chr>     <dbl>
    ## 1 Anand   23MDT1001    88
    ## 2 Bharat  23MDT1002    66
    ## 3 Mayank  23MDT1003    89
    ## 4 Parag   23MDT1004    77
    ## 5 Gautam  23MDT1005    69
    ## 6 Jessica 23MDT1006    87

``` r
# Listing the sheets of the excel sheet
excel_sheets("marks.xlsx")
```

    ## [1] "2023" "2022"

``` r
# reading data from different sheet from the same excel
marks_data_2022 <- read_excel("marks.xlsx", sheet = "2022")
marks_data_2022
```

    ## # A tibble: 6 × 3
    ##   Name    `Reg. No` Marks
    ##   <chr>   <chr>     <dbl>
    ## 1 Anand   22MDT1001    88
    ## 2 Bharat  22MDT1002    66
    ## 3 Mayank  22MDT1003    89
    ## 4 Parag   22MDT1004    77
    ## 5 Gautam  22MDT1005    69
    ## 6 Jessica 22MDT1006    87

``` r
# Create a data frame from scratch and export 
age <- c(25,30,56)
gender <- c("Male", "Female", "Male")
weight <- c(160,110,230)
person_data <- data.frame(age, gender, weight)
person_data
```

    ##   age gender weight
    ## 1  25   Male    160
    ## 2  30 Female    110
    ## 3  56   Male    230

``` r
# Exporting Data 
write.table(person_data, "Person_Data.txt", sep = "\t")
write.csv(person_data, "Person_data.csv")
```