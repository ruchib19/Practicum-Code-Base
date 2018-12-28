#loading library

library(rtweet)

#twitter authentication
twitter_token <- create_token(
  app = "socialNM",
  consumer_key = "XmV6T42a2RembSjcDvMwN4fWk",
  consumer_secret = "LSyo6zcm9s17zv6fexhKsDZJKDiUeDnnCBIT5ZqiOthOAi9afm")

#data pull for multiple keywords
digitalization <- search_tweets(q= "#digitalization", n=1000, 
                      geocode = "20.593684,78.962880,1000mi")

digitalization1 <- search_tweets(q= "#digitalindia", n=1000, 
                                geocode = "20.593684,78.962880,1000mi")

makeinIndia <- search_tweets(q= "#makeinindia", n=1000, 
                                geocode = "20.593684,78.962880,1000mi")

pmkvy <- search_tweets(q= "#PradhanMantriKaushalVikasYojana OR #pmkvy", n=1000, 
                             geocode = "20.593684,78.962880,1000mi")

skillindia <- search_tweets(q= "#skillindia OR #PMKK", n=2000, 
                       geocode = "20.593684,78.962880,1000mi")

betibachao <- search_tweets(q= "#betibachaobetipadhao", n=1000, 
                     geocode = "20.593684,78.962880,1000mi")

education <- search_tweets(q= "narendramodi+education", n=1000, 
                           geocode = "20.593684,78.962880,1000mi")

youth <- search_tweets(q= "narendramodi+youth", n=1000, 
                        geocode = "20.593684,78.962880,1000mi")


employment <- search_tweets(q= "narendramodi+employment", n=1000, 
                        geocode = "20.593684,78.962880,1000mi")

sheet1 = rbind(digitalization,digitalization1)

# labelling data with topic
sheet1$Topic= "digitalization"
betibachao$Topic= "betibachao"
education$Topic= "education"
employment$Topic= "employment"
makeinIndia$Topic= "makeinIndia"
pmkvy$Topic= "pmkvy"
skillindia$Topic= "skillindia"
youth$Topic= "youth"

#combining all the dataframes and writing to CSV
final = rbind(digitalization,betibachao,education,employment,makeinIndia,pmkvy,youth,skillindia)
write.csv(final, "combined data.csv")
