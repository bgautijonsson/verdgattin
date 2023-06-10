library(targets)
source("R/functions.R")
tar_option_set(
    packages = c(
        "dplyr",
        "tidyr",
        "lubridate",
        "rjson",
        "rvest",
        "readr",
        "stringr"
    ) 
)

list(
    tar_target(data, get_data())
)




