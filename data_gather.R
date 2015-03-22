# data script
url_data <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
dir.create("data")
download.file(url_data, destfile = "./data/file.zip")
unzip("./data/file.zip", exdir = "./data")
