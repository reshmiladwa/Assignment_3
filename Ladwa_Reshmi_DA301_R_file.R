# Install the necessary packages.
install.packages('tidyverse')
install.packages('skimr')
install.packages('DataExplorer') 

# The whole tidyverse package.
library(tidyverse)
# Import and read CSV file.
library(readr)
# Data wrangling.
library(dplyr)
# Data wrangling.
library(tidyr)
# Create statistical summaries.
library(skimr)
# Create a report as an HTML file.
library(DataExplorer)

#Import the turtle sales file 
turtlesales<-read.csv(file.choose(), header=TRUE)

#View data in spreadsheet format 
View(turtlesales)

#View first five rows of the data 
head(turtlesales)

#View dimensions of data set 
dim(turtlesales)

#View column names 
colnames(turtlesales)

#Due diligence one on data 
str(turtlesales)

#Due diligence two on data 
glimpse(turtlesales)

#Due diligence three on data 
as_tibble(turtlesales)

#New subset excluding ranking,year,genre and publisher
turtlesales_2 <- select (turtlesales, -Ranking, -Year, -Genre, -Publisher)

#View first five rows of the new data set 
head(turtlesales_2)

#View summary descriptive statistics of turtlesales_2
summary (turtlesales_2) 
dim (turtlesales_2)
as_tibble(turtlesales_2)

# Scatterplot for global sales x product 
qplot(Product,Global_Sales, data=turtlesales_2,geom=c('point', 'smooth'))

#Specify 
qplot(age, data=wages_plots)

#Boxplot for pr
qplot( Global_Sales ,Platform, data=turtlesales_2, geom='boxplot')

#Aggregate function to determine product vs sales
agg_turtle_ <-aggregate(Product~Global_Sales+EU_Sales+NA_Sales, data = turtlesales_2, FUN = sum)

#Summary of aggreated data frame 
summary (agg_turtle_)

# Specify the qqnorm function.
# Draw a qqplot using the aggregated data.
qqnorm(agg_turtle_$Product,
       col='blue',
       xlab="z value",
       ylab='Product')

# Specify the qqline function.
# Add a reference line to the qqplot.
qqline(agg_turtle_$Product,
       col='red',
       lwd=2) 

#Install moments and tidyverse
library (tidyverse)
install.packages("moments")
library (moments)

# Run a Shapiro-Wilk test:
shapiro.test(turtlesales_2$Product)

# Specify the skewness and kurtosis functions.
skewness(turtlesales_2$Product) 
kurtosis(turtlesales_2$Product)

#Data frame for model
turtlesales_3 <- select (turtlesales_2, -Platform)
summary(turtlesales_3)
dim(turtlesales_2)

#Model for sales figures
cor(turtlesales_3)
plot(model1$residuals)
