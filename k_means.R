library(DBI)
library(tidyverse)
library(dbplyr)
library(RPostgreSQL)
library(readr)
library(stringr)
library(modeldb)

connection <- dbConnect(
  RPostgreSQL::PostgreSQL(),
  dbname   = 'public_usage',
  host     = 'drenr.com',
  port     = 5432,
  user     = "linkedin",
  password = "linkedin"
)

db_flights = tbl(connection, in_schema('public', 'flights'))

km <- db_flights %>%
  simple_kmeans_db(dep_time, distance)


dbDisconnect(connection)
