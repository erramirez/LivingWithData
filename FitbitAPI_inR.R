cookie <- login(email="er.ramirez@gmail.com", password="diablos")  
# 15_min_data "what" options: "steps", "distance", "floors", "active-minutes", "calories-burned"   
df <- get_intraday_data(cookie, what="steps", date="2016-01-21")  
library("ggplot2")  
library("scales")
ggplot(df, aes(x=time, y=steps, fill=data)) + geom_point()

                        
                        
 
  xlab("") +ylab("steps") + 
  theme(axis.ticks.x=element_blank(), 
        panel.grid.major.x = element_blank(), 
        panel.grid.minor.x = element_blank(), 
        panel.grid.minor.y = element_blank(), 
        panel.background=element_blank(), 
        panel.grid.major.y=element_line(colour="gray", size=.1), 
        legend.position="none") 

df.daily <- get_daily_data(cookie, what="steps", start_date="2015-01-01", end_date="2015-12-31")  
  ggplot(df.daily) + geom_point(aes(x=time, y=steps)) + geom_smooth()
  
  
### Calling Fitbit API from R using OAuth2 ###

install.packages("devtools")  
library(devtools)
install_github("hadley/httr")
library(httr)
  
# 1. Set up credentials
fitbit_endpoint <- oauth_endpoint(
  request = "https://api.fitbit.com/oauth2/token",
    authorize = "https://www.fitbit.com/oauth2/authorize",
    access = "https://api.fitbit.com/oauth2/token")
myapp <- oauth_app(
    appname = "AccessR",
    key = "227PSZ", 
    secret = "4c141b683a70daf7d8361647d601ca66")
  
# 2. Get OAuth token
  scope <- c("sleep","activity", "weight")  # See dev.fitbit.com/docs/oauth2/#scope
  fitbit_token <- oauth2.0_token(fitbit_endpoint, myapp,
                                 scope = scope, use_basic_auth = TRUE)
  
# 3. Make API requests
  max.steps <- GET(url = "https://api.fitbit.com/1/user/-/activities/steps/date/today/max.json", config(token = fitbit_token))
  intraday2 <- content(intraday)

  steps1 <- content(max.steps)

library(plyr)
max.steps2 <- lapply(steps1, rbind)
  

# convert JSON to a dataframe:
  data = NULL
  for (i in 1:length(content(steps)$`activities-steps`)) {
    x = c(content(steps)$`activities-steps`[i][[1]]$dateTime,content(steps)$`activities-steps`[i][[1]]$value)
    data = cbind(data,x)
  }
  data = t(data)
  colnames(data) = c("date","steps")
  data = as.data.frame(data,row.names=1)
  
  # extract step counts and convert to numeric:
  data$steps = as.numeric(as.character(data$steps))
  
str(data)

cafile <- system.file("CurlSSL", "cacert.pem", package = "RCurl")

intraday.steps <- GET(url = "https://api.fitbit.com/1/user/-/activities/steps/date/today/1d.json", config(token = fitbit_token))
  content(intraday.steps)
  
data2 = NULL
for (i in 1:length(content(steps)$`activities-steps`)) {
  x = c(content(steps)$`activities-steps`[i][[1]]$dateTime,content(intraday.steps)$`activities-steps`[i][[1]]$value)
  data2 = cbind(data2,x)
}
data2 = t(data2)
colnames(data2) = c("date","steps")
data2 = as.data.frame(data2,row.names=1)

install.packages("rjson")
library(rjson)

steps.data <- fromJSON(resp)
install.packages("jsonlite")
