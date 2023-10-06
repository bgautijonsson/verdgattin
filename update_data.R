library(tidyverse)
library(rvest)
library(jsonlite)
source("R/functions.R")


d <- get_data()

d |> 
    write_csv("output/verdgattin_data.csv")
