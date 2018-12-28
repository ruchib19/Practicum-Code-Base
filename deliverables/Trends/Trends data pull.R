#load required libraries
library(gtrendsR)
library(maps)
library(ggplot2)
library(lettercase)
library(viridis)
library(pals)
library(scico)
library(ggrepel)
library(tidyverse)

#fetch data for required terms
term1 <- gtrends("digital india", time = "all", gprop = "web", geo = c("IN"))
term2 <- gtrends("digitalization", time = "all", gprop = "web", geo = c("IN"))
term3 <- gtrends("make in india", time = "all", gprop = "web", geo = c("IN"))
term4 <- gtrends("pmkvy", time = "all", gprop = "web", geo = c("IN"))
term5 <- gtrends("skill india", time = "all", gprop = "web", geo = c("IN"))
term6 <- gtrends("Pradhan Mantri Kaushal Vikas", time = "all", gprop = "web", geo = c("IN"))
term7 <- gtrends("beti bachao beti padhao", time = "all", gprop = "web", geo = c("IN"))
term8 <- gtrends("connect to PM", time = "all", gprop = "web", geo = c("IN"))
term9 <- gtrends("narendra modi", time = "all", gprop = "web", geo = c("IN"))
term10 <- gtrends("youth empowerment", time = "all", gprop = "web", geo = c("IN"))

#combine the data for required KPIs
interest_over_time = rbind(term1$interest_over_time,term2$interest_over_time,term3$interest_over_time,term4$interest_over_time,term5$interest_over_time,term6$interest_over_time,term7$interest_over_time,term8$interest_over_time,term9$interest_over_time,term10$interest_over_time)
related_queries = rbind(term1$related_queries,term2$related_queries,term3$related_queries,term4$related_queries,term5$related_queries,term6$related_queries,term7$related_queries,term8$related_queries,term9$related_queries,term10$related_queries)
interest_by_region = rbind(term1$interest_by_region,term2$interest_by_region,term3$interest_by_region,term4$interest_by_region,term5$interest_by_region,term6$interest_by_region,term7$interest_by_region,term8$interest_by_region,term9$interest_by_region,term10$interest_by_region)

#write data to CSV
write.csv(interest_over_time, "interest_over_time.csv", row.names = FALSE, sep = ",")
write.csv(related_queries, "related_queries.csv",row.names = FALSE, sep = ",")
write.csv(interest_by_region, "interest_by_region.csv",row.names = FALSE, sep = ",")