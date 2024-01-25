install.packages("opendatatoronto")

library(tidyverse)
library(janitor)
library(knitr)
library(lubridate)
library(opendatatoronto)

library(opendatatoronto)
packages <- list_packages(limit = 10)
packages

crimes<- search_packages("crime")
crimes


toronto_crimes <-
  list_package_resources("police-annual-statistical-report-reported-crimes") |>
  filter(name == "Reported Crimes.csv") |>
  get_resource()

head(toronto_crimes)

write_csv(
  x = toronto_crimes,
  file = "toronto_crimes.csv"
)

