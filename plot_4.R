# plot_4
# libraries
library(dplyr)
library(ggplot2)

# load data files
nei <- readRDS("./data/summarySCC_PM25.rds")
scc <- readRDS("./data/Source_Classification_Code.rds")

# make sub set of coal fuel sources
coal_fuel <- scc %>% 
    filter(grepl("Coal", EI.Sector)) %>% 
    select(SCC)

# make new data frame from joining both data frames
question_4_data <- left_join(coal_fuel, nei, by = "SCC")

# make the sum data frame
question_4 <-  question_4_data %>% 
    group_by(year) %>% 
    summarise(sum = sum(Emissions))%>% 
    na.omit()

# make the plot for question 4
question_4_plot <- 
    ggplot(data = question_4, aes(x = year, y = sum)) +
    geom_line(color = "blue", size = 1.2) +
    geom_point(color = "blue", size = 5) +
    ggtitle("Coal Emisions in United States") +
    xlab("Year") +
    ylab("Emisions in Tons")

# save the last plot
ggsave("plot_4.png", width = 4, height = 3)
