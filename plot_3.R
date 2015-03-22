# plot #3
# libraries
library(dplyr)
library(ggplot2)
options(scipen=999) # turn off scientfic numbers

# load data files
nei <- readRDS("./data/summarySCC_PM25.rds")
scc <- readRDS("./data/Source_Classification_Code.rds")

# answer the question
question_3 <- nei %>% 
    filter(fips == "24510") %>% 
    group_by(year, type) %>% 
    summarise(sum = sum(Emissions))

# create the plot
question_3_plot <- ggplot(data = question_3, aes(x = year, y = sum, group = type, color = type)) +
    geom_line(size = 1.2) +
    geom_point(size = 5)
# save the last plot
ggsave("plot_3.png")