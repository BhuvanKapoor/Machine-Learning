# Experiment 1 : Data Import - Export
# Objective: To import and export data using R

# Numeric Vector
a <- c(3,5,2,7,4)
a

# String Vector
b <- c("str_1","str_2","str_3")
b

# Logical Vector
c <- c(F,T,F,F)
c


# Creating a matrix
# column-wise matrix
mat_col <- matrix(1:20,nrow = 5,ncol = 4)
mat_col

# row-wise matrix
mat_row <- matrix(1:20,nrow = 5,ncol = 4,byrow = T)
mat_row

# Matrix with labels
cells <- c(1,26,24,28)
row_names <- c("R1","R2")
col_names <- c("C1","C2")
mat <- matrix(cells,nrow = 2,ncol = 2,byrow = T,dimnames = list(row_names,col_names))
mat

# Extracting elements from the matrix
mat[1,2]  # extracting specific element
mat[1,]   # extracting the row
mat[,1]   # extracting the column


# DATA FRAMES
id <- c(2,4,2,5)
colors <- c("red","white","red",NA)
passed <- c(F,T,F,T)
df <- data.frame(id,colors,passed)
df
names(df) <- c("ID","Colors","Passed")  # naming the columns of df
df

df$Colors   # extracting a column from the df


# LIST
lst <- list(name = "fred", mynum = 4, mymatrix = mat, age = 5,3)
lst

# FACTOR
gender <- c(rep("Male",20),rep("Female",20))
gender
gender <- factor(gender)
summary(gender)


# Reading Excel files
#install.packages("readxl")
library(readxl)

marks_data_2023 <- read_excel("marks.xlsx")
marks_data_2023

# Listing the sheets of the excel sheet
excel_sheets("marks.xlsx")

# reading data from different sheet from the same excel
marks_data_2022 <- read_excel("marks.xlsx", sheet = "2022")
marks_data_2022

# Create a data frame from scratch and export 
age <- c(25,30,56)
gender <- c("Male", "Female", "Male")
weight <- c(160,110,230)
person_data <- data.frame(age, gender, weight)
person_data

# Exporting Data 
write.table(person_data, "Person_Data.txt", sep = "\t")
write.csv(person_data, "Person_data.csv")

