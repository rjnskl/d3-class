setwd("/Users/kevin/teaching/data-visualization-with-d3/class10")

library(stringr)

data <- read.delim("all-countries.tsv")

long <- reshape(data, varying=list(2:12), v.names="cop", direction="long")

long$cutoff <- names(data)[2:12][long$time]

names(long)[3] <- "val"

long$dataset <- gsub("LIS - ", "", long$dataset)

long$year <- sapply(strsplit(long$dataset, " "), function(x) x[length(x)])

long$country <- str_trim(gsub('[0-9]', "", long$dataset))

long$val <- as.numeric(gsub(",", "", long$val))

long <- long[,-c(1,2,4

write.table(long, row.names=F, sep="\t", file="incomes.tsv")