#Here we will fit a multiple linear regression model and then test its
#prediction accuracy. 
#We try to see how well and accurate this model is at predicting with new
#unseen data

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

#Viewing the summary statistics of the clean data
summary(clean_data)

#Extracting the variables
#Response Variable
calories_obtained <- clean_data$Carbohydrate
#Explanatory Variables
weight <- clean_data$Weight
protein <- clean_data$Protein
age <- clean_data$Age

#Fitting a multiple linear model(Full model)
#We use the general linear model
carb_full_mlr <- lm(calories_obtained~ weight + protein + age, data = clean_data)

#Installing and loading the cvTools library to conduct CV prediction error
install.packages("cvTools")
library("cvTools")

#Calculating the CV prediction error
#We add 5 folds and choose that they are all each repeated 10 times
#The lower the CV value, the better the model will be at prediction
cvFit(carb_full_mlr, data = carbohydratesData, K = 5, R = 10,
      y = calories_obtained)
warnings()


