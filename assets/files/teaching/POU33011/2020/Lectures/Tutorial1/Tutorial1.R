#### Basic Functions ####
# Basic Maths
1 + 1
2 - 1
2 * 3
9 / 3
3^2
sqrt(9) 

####  Defining Variables ####
x <- 9
y = 2

# Boolean Algebra
# Equal
x == y

#Unequal
x != y

#Greater Than
x > y # >= 

#Lesser Than
x < y # <=

# AND
#Only give me observations of people who live in Dublin AND in Ireland
#Both conditions must be met
2 > 1 & 2 > 3

# OR
#Only give me observations of people who live in Kerry OR Carlow
#Only one condition must be met
2 > 1 | 2 > 3

#### Types of Objects ####
# Varibles
x <- 1
y <- 2
z <- 3
# Variables are useful especially when you need to use something multiple times.

# Dataframes
a <- c( 1, 2, 3, 4, 5)
b <- c(11,12,13,14,15)
c <- c(21,22,23,24,25)

matrix <- rbind(a,b,C)
df <- as.data.frame(matrix)

# List 
# Is a container of other objects
list <- as.list(df, a, b)

#### Types of Variables ####
# Character (String)
a <- "Hallo World"

# Numeric
x <- 1

# Factors
county <- c("Dublin", "Carlow", "Kerry", 
            "Dublin", "Carlow", "Kerry",
            "Dublin", "Carlow", "Kerry")
            
   
# Converting Objects
# You can convert objects by using as.factor, as.character etc.
county <- as.factor(county)
county <- as.character(county)

#Testing Objects 
# You can test whether your object has the desired format by using is.
is.factor(county)
is.character(county)


