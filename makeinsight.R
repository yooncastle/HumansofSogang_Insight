#Before reading this file, you need to go on Tools -> Global Options -> Code -> Savings -> and set the Default text encoding to UTF-8

library(readr)
library(dplyr)
library(ggplot2)

#Read Postings
postings <- read_csv("Postings2.csv")
View(postings)

reached = as.numeric(postings$'전체 기간 내 게시물 총 도달수')
postings %>% ggplot(aes(x=reached)) + geom_histogram()

date = as.Date(postings$게시일, "%m/%d/%Y %H:%M:%S")
glimpse(date)
postings %>% ggplot(aes(x=date)) +geom_histogram()

plot(date, reached, cex=1)

#Read Pageinfo
pageinfo <- read_csv("pageinfo.csv")

View(pageinfo)

reached = as.numeric(pageinfo$'전체 기간 총 좋아요 수')
date = as.Date(pageinfo$'날짜',"%Y.%M.%D")
#왜 date가 안읽힐까요..?!

pageinfo %>% ggplot(aes(x=reached)) + geom_histogram()
