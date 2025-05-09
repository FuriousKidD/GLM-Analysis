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

#Getting the summary of the linear model that we fit
summary(carb_full_mlr)

#Fitting a model were we remove the age variable since it is not significant to the fitted model
carb_reduced_mlr <- lm(calories_obtained~ weight + protein, data = carbohydratesData)

#Getting the summary of the model we fit
summary(carb_reduced_mlr)

#Evaluating the difference between the two models fit, to see which model is the better fit
#We want to see if the removal of the age variable significantly affects the model
#We asses this using Analysis of Variance
anova(carb_full_mlr, carb_reduced_mlr)

#Checking the adequecy of the linear model(See if it violates assumptions of a linear regression model)
