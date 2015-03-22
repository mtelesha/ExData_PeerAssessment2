# plot_2
# libraries
library(dplyr)
options(scipen=999) # turn off scientfic numbers

# load data files
nei <- readRDS("./data/summarySCC_PM25.rds")
scc <- readRDS("./data/Source_Classification_Code.rds")

# answer the question
question_2 <- nei %>% 
    filter(fips == "24510") %>% 
    group_by(year) %>% 
    summarise(sum = sum(Emissions))

# create the plot
png("plot_2.png")
barplot(question_2$sum, xlab = "Year", ylab = "Total Emissions (tons)",
        names.arg = unique(nei$year))
title(main = "Pollutant Yearly Totals in Baltimore, MD")
dev.off()