################################################
##            Pirate Problems 
################################################
library(tidyverse)
library(stringr)
gamedata <- read_csv("pirates.csv", col_names = c("p1","p2","p3","r1","r2","r3"))
gameSol <- read_csv("piratesSolved.csv", col_names = c("B1","B2","B3","ExpVal"))
gameSol
gamedata
