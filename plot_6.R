# plot #6
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
# make subplot of Baltimore and Los Angels
cities_data <- nei %>% 
    filter(fips == "24510" | fips == "06037") %>% 
    mutate(city = (ifelse(fips == "24510", "Baltimore", "LA")))

# left join the two datasets
question_6_data <- left_join(vehicles_scc, cities_data, by = "SCC")

# summary of the year totals
question_6 <- question_6_data %>% 
    group_by(year, city) %>% 
    summarise(sum = sum(Emissions)) %>% 
    na.omit()

# plot for question 5
ggplot(data = question_6, aes(x = year, y = sum, group = city, color = city)) +
    geom_line(size = 1.2) +
    geom_point(size = 5) +
    ggtitle("Vehcile Emisions Compare Baltimore to LA") +
    xlab("Year") +
    ylab("Emisions in Tons")

# save the last plot
ggsave("plot_6.png")