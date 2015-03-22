# plot #5
# libraries
library(dplyr)
library(ggplot2)

# load data files
nei <- readRDS("./data/summarySCC_PM25.rds")
scc <- readRDS("./data/Source_Classification_Code.rds")

# make sub set to answer question of motor vehicles in Baltimore
vehicles_scc <- scc %>% 
    filter(grepl("Vehicles", EI.Sector)) %>% 
    select(SCC)
# make subplot of Baltimore
baltimore <- nei %>% 
    filter(fips == "24510")

# left join the two datasets
question_5_data <- left_join(vehicles_scc, baltimore, by = "SCC")

# summary of the year totals
question_5 <- question_5_data %>% 
    group_by(year) %>% 
    summarise(sum = sum(Emissions)) %>% 
    na.omit()

# plot for question 5
    ggplot(data = question_5, aes(x = year, y = sum)) +
    geom_line(color = "blue", size = 1.2) +
    geom_point(color = "blue", size = 5) +
    ggtitle("Vehcile Emisions in Baltimore") +
    xlab("Year") +
    ylab("Emisions in Tons")

# save the last plot
ggsave("plot_5.png", width = 4, height = 3)
