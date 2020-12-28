# Research Methods for Political Science A
# Tutorial 2 
# 13.10.2020 and 14.10.2020
# Michele McArdle mcardlmi@tcd.ie

# Topics covered today
# 1. Setting Working Directory
# 2. Installing and Loading Packages
# 3. Loading and Saving Datasets
# 4. Data Inspection Part 1

####################################################################
#################### Setting Working Directory #####################
####################################################################
## Setting WD ####
# A working directory is a folder in which you have all you're files 
# relating to a specific R project
# You must enter a folder (not a single file) as working directory
# When using paths in R make sure to use double backslash (\\),
# not single backslash (\)

setwd("C:\\Users\\folder")

## Helpful tool ####
file.choose()
# Allows you to choose a file (not a folder) 
# and will load the path into the console
# You can then copy/paste part of that path as you're working directory 
# Be sure not to copy the complete path

## TASK 1 ##
# 1. Set your working directory to the folder your R Script is in


####################################################################
################# Installing and Loading Packages ##################
####################################################################

# Packages are add-ons to are similar as you would use them in your browser 
# As R is open-source this allows all users (even you) to write their own packages, which makes R super powerful
# The package foreign for example, which we will be using in this Script, allows you to import data from different sources
# Be careful not to randomly install multiple packages as some are quite heavy and will bloat R

# Installing #
# This needs to be done only once per package
install.packages("foreign") 

# Loading #
# This needs to be done for every session
library("foreign") 
library("ggplot2")

## TASK 2 ##
#  1. Install and load the package "ggplot2"

####################################################################
################# Loading and Saving Datasets ######################
####################################################################

# Another advantage of R being open source is that it can read multiple different file types
# here are some examples

# Be aware that you will get an error message when you ruin these commands 
# unless you have a file with the geîven name in your working directory

# RData file #
df.Rdata <- load("mtcars.RData")
save(df.Rdata, file = "mtcars.RData")

# DTA (Stata) file #
df.dta <- read.dta("mtcars.dta")
write.dta(df.dta, file = "mtcars.dta")

# CSV File #
df.csv  <- read.csv("mtcars.csv") # Comma (,) as delimitor
df.csv2 <- read.csv2("mtcars2.csv") # Semi-Colon (;) as delimitor

write.csv(df.csv,   file = "mtcars.csv")
write.csv2(df.csv2, file = "mtcars2.csv")

#### TASK 3 ##
# 1. Download the "data.t2.csv" file from blackboard and load it in to R
# hint: Use file file.choose() to get the correct path to your file

my.df <- read.csv("data.t2.csv")

####################################################################
########################## Data Inspection #########################
####################################################################

# What variables are there
names(my.df)

# How does the dataframe look
head(my.df, n = 3)

#Inspecting meta data of variables
summary(my.df$X1) 

#Getting all the values of a given variable
unique(my.df$X1)

## TASK 4 ##
# 1. Choose a varible from my.df
# 2. Print the first 5 observations of that variable
# 3. Print a summary of the given variable