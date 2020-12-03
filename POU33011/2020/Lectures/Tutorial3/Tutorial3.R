# Research Methods for Political Science A
# Tutorial 3
# 20.10.2020 and 21.10.2020
# Michele McArdle mcardlmi@tcd.ie

# Topics covered today
# 1. Data Inspection Part 2
# 2. Data Manipulation

####################################################################
#################### Data Inspection Part 2 ########################
####################################################################
## Creating a tiny data set to work with ####
x <- c(1,2,3,4,5)
y <- c(10,20,30,40,50)
z <- c(3,6,7,4,7)
r <- c(12,14,16,18,20)
xy <- as.data.frame(rbind(x, y, z, r))

## Inspecting a specific part of your data frame ####
# xy[row, column]
# Make sure to also include a comma
xy[1,] #first row
xy[,1] # first column
xy[2,3] #second row, third column

# This also works for vectors
z[3] #third object in vector x

# We can also use names rather than column numbers
xy[, "V4"] #Column "V4"


## Variable Statistics ###
#for overall statistics you can use 
summary(xy$V4)

# Mean (aka. average)
mean(xy$V2)

# Minimum and Maximum
min(xy$V2)
max(xy$V3)

# Standard Deviation
sd(xy$V1)

# Number of rows
nrow(xy)

### Task 1 ####
# Show the maximum of V1
# How many rows does xy have
# What is the observation of the fourth row second column of xy

####################################################################
#################### Data Manipulation #############################
####################################################################
## Adding and Deleting Variables ####
# Adding Variable to a dataframe 
xy$Z <- "Z"

# Changing value of a variable (recoding)
xy$Z <- "a"

# Changing value of a variable conditionally
xy$V3b[xy$V3 == 3] <- "c"
xy$V3b[xy$V3 >  3] <- "d"
xy$V3b[xy$V3 <  3] <- "e"

# Deleting Variable
xy$Z <- NULL

### Task 2 ####
# 1. Add a variable call myvar to the dataframe xy and give it the value "TCD"
# 2. Change the value to "UCD"

## Sorting Data ####
xy.sorted <- xy[order(xy$V1, decreasing = TRUE),]

## Aggregating Data ####
# This will change your data set aggregating your data by a specific variable
# Be sure not to overwrite your original dataset
xy2 <- aggregate(V2 ~ V3b, data = xy, FUN = mean)

### Task 3 ####
# 1. Sort xy  in ascending order by V1
# 2. Aggregate V1  by V3b 

## Combining variables ####
xy$combo <- paste(xy$V1, xy$V2)

#Combining a string with a variable
sentence <- "Hallo World"
paste(sentence, xy[1,5])

### Task 4 ####
# Write a sentence with the value of the third cell in row four of xy
