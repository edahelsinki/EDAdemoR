## executed before application launch

require("shiny")
source("demoR.R")

## load data
datafiles <- list.files("data/",pattern=".*\\.rds$")
if(length(datafiles)<1) stop("global.R: no rds file found.")
data <- preprocess(readRDS(sprintf("data/%s",datafiles[1]))) # use the first rds file

cat(sprintf("global.R: file %s, %d rows, %d factor%s, %d real attributes.\n",
            datafiles[1],dim(data$r)[1],length(data$f),
            if(length(data$f)==1) "" else "s",dim(data$r)[2]))

## make the initial plot
initcurrent <- function(data) {
  a <- dopca(data$r)
  list(s=c(),w=a$w,v=a$v)
}

current <- initcurrent(data)
