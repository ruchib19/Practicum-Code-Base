#load libraries
if (!require(sentimentr)) {install.packages("Sentiment An.R")} # ensure java is up to date!
library(sentimentr)
library(dplyr)
library(tidytext)
library(tidyverse)

#read the data to be analysed
final = read.csv("C:/CBAcontent/Practicum/data collection/twitter data/combined data.csv")
textdf = data_frame(text = as.character(final$text)) 

#get sentiment for each of the word token 
new_senti = as.vector(final$text) %>% get_sentences() %>% sentiment()

#get average sentiment per tweet
senti_per_tweet = new_senti  %>% select(element_id,sentiment) %>%group_by(element_id) %>% summarise_all(funs(mean))
write.csv(senti_per_tweet, "senti_per_tweet.csv")
