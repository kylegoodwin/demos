# Analysis: is there more expansion or compression?

# Set up
library(tidyr)
library(dplyr)
setwd('~/health/demos/gbd/hale/')

# Load data
hale.data <- read.csv('./data/prepped/hale-le-data.csv', stringsAsFactors = FALSE)
wide.data <- read.csv('./data/prepped/hale-le-data-wide.csv', stringsAsFactors = FALSE)

# Are HALE and life expectancy correlated (visually, statistically)?
cor(hale.data$le, hale.data$hale)
plot(hale.data$le, hale.data$hale)

# As life expectancy increases, at what rate does hale increase?
fit <- lm(hale.change ~ le.change, data=wide.data)
fit

# Compute change in life expectancy, change in hale
wide.data <- wide.data %>% 
              mutate(hale.change = hale.2015 - hale.1990, le.change = le.2015 - le.1990)

# Assess relationship between change
plot(wide.data$le.change, wide.data$hale.change)
lm(hale.change ~ le.change, data=wide.data)

#There is a regression slope greater than 1, noted by the upward slopeing line, this means 
#that we are seeing compression, as the health years lived increases 
#( denoted by the positivily sloped line upwards)

# What is the distribution in the ratios of le to hale?
hist(wide.data$le.change / wide.data$hale.change)
