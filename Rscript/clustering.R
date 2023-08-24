rm(list = ls())

#########################################
## import data and pre-processing them
#########################################
raw_data <- read.csv("data/npp2000.csv", sep = ";")
head(raw_data)
new_data <- na.omit(raw_data)
head(new_data)
dt <- as.data.table(new_data, TRUE)
print (is.data.table(dt))
######################################
## Spatial clustering using SOM
######################################
library(somspace)
str(owda)
inp <- sominp(owda)
str(inp)
str(new_data)
input <- sominp(new_data)
str(input)
