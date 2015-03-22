# plot-1 R code
# Question #1 Have total emissions from PM2.5 decreased in the United States
# from 1999 to 2008? Using the base plotting system, make a plot showing the
# total PM2.5 emission from all sources for each of the years 1999, 2002, 2005,
# and 2008.
# libraries
library(dplyr)
options(scipen=999) # turn off scientfic numbers

# load data files
nei <- readRDS("./data/summarySCC_PM25.rds")
scc <- readRDS("./data/Source_Classification_Code.rds")

# answer the question
question_1 <- nei %>% 
    group_by(year) %>% 
    summarise(sum = sum(Emissions))

# create the plot
png("plot_1.png")
barplot(question_1$sum, xlab = "Year", ylab = "Total Emissions (tons)",
        names.arg = unique(nei$year))
title(main = "Pollutant Yearly Totals in United States")
dev.off()

