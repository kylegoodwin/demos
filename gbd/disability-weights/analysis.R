# Analysis

# Set up
setwd('~/health/demos/gbd/disability-weights/')
library(dplyr)
library(tidyr)

# Load global data (disease burden in 2015, both sexes, all ages)
global.data <- read.csv('./data/prepped/global_burden.csv', stringsAsFactors = FALSE)

# Replace NA as 0 for deaths, ylls, ylds
# Thanks, SO: http://stackoverflow.com/questions/8161836/how-do-i-replace-na-values-with-zeros-in-an-r-dataframe
global.data[is.na(global.data)] <- 0

# What disease was responsible for the most burden (by each metric)?
max <- filter(global.data, dalys ==max(dalys) | ylds == max(ylds) | deaths == max(deaths) | ylls == max(ylls))

# Using prevalence and YLDs, calculate inferred disability weights (not actual weights in the study)
weights <- mutate(global.data, disability.weight = ylds/prevalence)

# See anything strange about the estimated disability weights?


# Which diseases have more YLDs than YLLs (and ylls > 0)?
big <- filter(global.data, ylls > 0 & ylds > ylls)

# How many times higher is the prevalence than the number of deaths for these diseases?


# Which disease has the most similar burden of YLLs and YLDs (where ylls > 0)?


# For the following section, keep only the cause names and disability weights


# For each cause, compute how many cases would have to have to be avoided to equal 65 YLLs
# (the equivalent of one death of a 25 year old)
