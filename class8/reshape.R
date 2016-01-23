setwd("/Users/kevin/teaching/data-visualization-with-d3/class8")

data <- read.delim("pdsi.tsv")

d <- reshape(data, idvar = "id", varying = list(2:120),
        v.names = "X", direction = "long")


d$year <- gsub("X", "", names(data)[2:120][d$time])

zz <- data.frame(id=d$id, val=d$X, year=d$year)

write.csv(zz, file="tidy-drought-data.csv", row.names=F)




# raw <- read.delim("http://www1.ncdc.noaa.gov/pub/data/cirs/climdiv/climdiv-pdsidv-v1.0.0-20150706", sep="\t")