#Before reading this file, you need to go on Tools -> Global Options -> Code -> Savings -> and set the Default text encoding to UTF-8
library(readr)
library(dplyr)
library(ggplot2)
library(lubridate)

#Read Postings
postings <- read_csv("Postings2.csv")
View(postings)

reached = as.numeric(postings$'전체 기간 내 게시물 총 도달수')
postings %>% ggplot(aes(x=reached)) + geom_histogram()

date = as.Date(postings$게시일, "%m/%d/%Y %H:%M:%S")
glimpse(date)
postings %>% ggplot(aes(x=date)) +geom_histogram()

plot(date, reached, cex=1)

pageinfo <- read_csv("pageinfo.csv")

#pageinfo <- pageinfo %>% select(-1)
#column 삭제하기

View(pageinfo)

reached = as.numeric(pageinfo$'전체 기간 총 좋아요 수')
date <- lubridate::parse_date_time(pageinfo$'날짜',"%Y.%m.%d")

pageinfo %>% 
  ggplot(aes(x=reached)) + geom_histogram()

pageinfo %>%
  ggplot(aes(reached)) + geom_histogram() + 
  geom_hline(yintercept=30, col='red')

pageinfo %>%
  ggplot(aes(date, reached)) + geom_histogram() + 
  geom_hline(yintercept=30, col='red')
#왜안될까요?

plot(date, reached, cex=1)





