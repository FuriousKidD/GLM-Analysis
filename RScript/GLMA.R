library(ggplot2)
getwd()
#get current directory
current_dir <- getwd()

#change current directory to parent directory then go into sibling directory data
data_dir <- file.path(current_dir, "data")
data_dir
current_dir <- setwd(data_dir)

#read the csv file into a variable
carbohydratesData <- read.csv("Carbohydrate.csv", header = TRUE)

#Transform the data into a data frame
carbohydratesData <- data.frame(carbohydratesData)

#Check the first 6 rows of the data to get insights of the kind of variables we will work with
head(carbohydratesData)

library(tidyverse)#for cleaning the data

#Cleaning the data by removing any missing values that may exist
clean_data <- na.omit(carbohydratesData)

#Extracting the variables

#Response Variable
calories_obtained <- clean_data$Carbohydrate
#Explanatory Variables
weight <- clean_data$Weight
protein <- clean_data$Protein
age <- clean_data$Age


#Fitting a multiple linear model(Full model)  
