#Demographic data table creation. For use in Results.One.rmd
demographics.table <- read.csv("~/Dropbox/Dissertation.Data/Data/Demographics.csv")

FitbitType <- read.csv("~/Dropbox/Dissertation.Data/Data/FitbitType.csv", header = FALSE)

demographics.table$Fitbit.Device <- FitbitType$V1

colnames(demographics.table)[7] <- 'Marital Status'
colnames(demographics.table)[8] <- 'Employment Status'
colnames(demographics.table)[9] <- 'Household Income'
colnames(demographics.table)[10] <- 'Fitbit Type'

save(demographics.table, file="~/Dropbox/Dissertation.Data//Data/demographics.table.rdata")


#User length statistics
fitbit.dates <- read.csv("~/Dropbox/Dissertation.Data/Data/FitbitDatesData.csv")
colnames(fitbit.dates)

summary(fitbit.dates)
sd(fitbit.dates$fitbituserlength)

load("~/Dropbox/Dissertation.Data/FitbitData/ProcessedData/Daily.Activity.Final.rdata")


Daily.Activity.Final$ValidDay.Steps <- ifelse(Daily.Activity.Final$TotalSteps > 0 , 1, 0)
sum(Daily.Activity.Final$ValidDay.Steps)
save(Daily.Activity.Final, file="~/Dropbox/Dissertation.Data/FitbitData/ProcessedData/Daily.Activity.Final.rdata")

#Weartable creation. For use in Results.One.rmd

load("~/Dropbox/Dissertation.Data/FitbitData/ProcessedData/Daily.Activity.Final.rdata")
library(plyr)
wear.days.table <- ddply(Daily.Activity.Final, c("id"), summarise, 'Initial Available Days'=length(id),
                         'Valid Days (Steps)'=sum(ValidDay.Steps),      
                         'Valid Days (MET Processing)'=sum(ValidDay.Counts), 
                         'Valid Days (Censured)'=sum(ValidDay.Censured), 
                         'Valid Days (Final)'=sum(Valid.Final)
)


wear.days.table$'Valid Days (Final) Percent' <- wear.days.table$`Valid Days (Final)`/wear.days.table$`Initial Available Days`

save(wear.days.table, file="~/Dropbox/Dissertation.Data/Data/wear.days.table.rdata")

#Ploting valid days for each participant
ggplot(Daily.Activity.Final, aes(x=Date, y=Valid.Final)) +
  geom_bar(stat="identity") +
  scale_y_continuous(breaks=NULL, labels = NULL) +
  facet_grid(id ~.)
                              
#Consistency Calculations

library(ggplot2)
ggplot(wear.days.table, aes(x=`Initial Available Days`, y=`Valid Days (Final)`, label = id)) + geom_point() + geom_text(vjust = 0, nudge_y = 3.0, check_overlap = TRUE)
library(plyr)
userwear.variability <- ddply(Daily.Activity.Final, c("id"), summarise,
                              'Valid Days (Final)'=sum(Valid.Final),
                              'Mean' = mean(Valid.Final),
                              'Use Variability (SD)' = sd(Valid.Final)
)
#calculate coefficient of variation on valid days 
userwear.variability$CV <- (userwear.variability$`Use Variability (SD)`/userwear.variability$Mean)*100

#find quartile ranges
summary(userwear.variability$CV)

#create quartile variable
userwear.variability$CV.quart <- ifelse(userwear.variability$CV <= 14.56, 1, 
                                       (ifelse(userwear.variability$CV <= 34.870 , 2,
                                               ifelse(userwear.variability$CV <= 75.08, 3, 4))))
userwear.variability$CV.quart <- as.factor(userwear.variability$CV.quart)

ggplot(userwear.variability, aes(x=id, y=CV, colour=CV.quart)) + geom_point()


#Weartime streaks
library(accelerometry)

ParticipantValidDaysList <- split(Daily.Activity.Final, Daily.Activity.Final$id)


#Function for appending the ID from initial data frame to the new data frame created through rle2.
my.rle <- function(x) {
  final <- as.data.frame(rle2(x$Valid.Final))
  final$id <- unique(x$id)
  
  return(final)
}

WearStreaksList<- lapply(ParticipantValidDaysList,  my.rle)

AllParticipants.WearStreaks <- do.call(rbind, WearStreaksList)

#Creat valid/non-wear time streak table
library(plyr)
StreakTable <- ddply(AllParticipants.WearStreaks, c("id", "values"), summarise, 
                     'Min Streak Length' = min(lengths),
                     'Max Streak Length' = max(lengths),
                     'Mean Streak Length' = mean(lengths),
                     'SD Streak Length' = sd(lengths)
)

#calculate overall streak mean for al participants. 
OveralStreakMean <- ddply(AllParticipants.WearStreaks, c("values"), summarise, 
                          'Mean Streak Length' = mean(lengths),
                          'SD Streak Length' = sd(lengths)
)
                                                  
StreakTable$values <- ifelse(StreakTable$values == 0, 'Non-Wear Days', 'Valid Wear Days')
StreakTable$values <- as.factor(StreakTable$values)

save(StreakTable, file="~/Dropbox/Dissertation.Data/Data/StreakTable.rdata")


#Physical Activity Data Descriptives
load("~/Dropbox/Dissertation.Data/FitbitData/ProcessedData/Daily.Activity.Final.rdata")


##   Summarizes data.
##   Gives count, sum,  mean, standard deviation, standard error of the mean, min, and max values
##   data: a data frame.
##   measurevar: the name of a column that contains the variable to be summariezed
##   groupvars: a vector containing names of columns that contain grouping variables
##   na.rm: a boolean that indicates whether to ignore NA's - (set to TRUE to ignore NAs in dataset)
summarySE <- function(data=NULL, measurevar, groupvars=NULL, na.rm=TRUE,
                      conf.interval=.95, .drop=TRUE) {
  library(plyr)
  
  # New version of length which can handle NA's: if na.rm==T, don't count them
  length2 <- function (x, na.rm=TRUE) {
    if (na.rm) sum(!is.na(x))
    else       length(x)
  }
  
  # This does the summary. For each group's data frame, return a vector with
  # N, mean, and sd
  datac <- ddply(data, groupvars, .drop=.drop,
                 .fun = function(xx, col) {
                   c(N    = length2(xx[[col]], na.rm=na.rm),
                     sum  = sum    (xx[[col]], na.rm=na.rm),
                     mean = mean   (xx[[col]], na.rm=na.rm),
                     sd   = sd     (xx[[col]], na.rm=na.rm),
                     min  = min    (xx[[col]], na.rm=na.rm),
                     max  = max    (xx[[col]], na.rm=na.rm)
                   )
                 },
                 measurevar
  )
  
  
  datac$se <- datac$sd / sqrt(datac$N)  # Calculate standard error of the mean
  
  # Confidence interval multiplier for standard error
  # Calculate t-statistic for confidence interval: 
  # e.g., if conf.interval is .95, use .975 (above/below), and use df=N-1
  #ciMult <- qt(conf.interval/2 + .5, datac$N-1)
  #datac$ci <- datac$se * ciMult
  
  return(datac)
}

#Create tables for each measures activity variable
StepDescriptives <- summarySE(Daily.Activity.Final, measurevar="TotalSteps", groupvars=c("id", "Valid.Final"))
DistanceDescriptives <- summarySE(Daily.Activity.Final, measurevar = "TotalDistance", groupvars=c("id", "Valid.Final"))
VeryActiveMinutesDescriptives <- summarySE(Daily.Activity.Final, measurevar = "VeryActiveMinutes", groupvars=c("id", "Valid.Final"))
FairlyActiveMinutesDescriptives <- summarySE(Daily.Activity.Final, measurevar = "FairlyActiveMinutes", groupvars=c("id", "Valid.Final"))
LightActiveMinutesDescriptives <- summarySE(Daily.Activity.Final, measurevar = "LightlyActiveMinutes", groupvars=c("id", "Valid.Final"))
SedentaryMinutesDescriptives <- summarySE(Daily.Activity.Final, measurevar = "SedentaryMinutes", groupvars=c("id", "Valid.Final"))
CaloriesDescriptives <- summarySE(Daily.Activity.Final, measurevar = "Calories", groupvars=c("id", "Valid.Final"))

#Generate participant level data table for only valid days - Steps

Daily.Valid.Days <- Daily.Activity.Final[ which(Daily.Activity.Final$Valid.Final == 1),]
DailySteps.Valid.Days.Table <- summarySE(Daily.Valid.Days, measurevar = "TotalSteps")

StepDescriptives.Valid <- StepDescriptives[ which(StepDescriptives$Valid.Final == 1), ]
StepDescriptives.Valid$Valid.Final <- NULL
colnames(DailySteps.Valid.Days.Table)[1] <- "id"
DailySteps.Valid.Days.Table[1,1] <- "All Participants"
StepDescriptives.Valid.Table <- rbind(StepDescriptives.Valid, DailySteps.Valid.Days.Table)
save(StepDescriptives.Valid.Table, file="~/Dropbox/Dissertation.Data/Data/StepDescriptives.Valid.Table.rdata")

#Distance
DailyDistance.Valid.Days.Table <- summarySE(Daily.Valid.Days, measurevar = "TotalDistance")

DistanceDescriptives.Valid <- DistanceDescriptives[ which(DistanceDescriptives$Valid.Final == 1), ]
DistanceDescriptives.Valid$Valid.Final <- NULL
colnames(DailyDistance.Valid.Days.Table)[1] <- "id"
DailyDistance.Valid.Days.Table[1,1] <- "All Participants"
DistanceDescriptives.Valid.Table <- rbind(DistanceDescriptives.Valid, DailyDistance.Valid.Days.Table)
save(DistanceDescriptives.Valid.Table, file="~/Dropbox/Dissertation.Data/Data/DistanceDescriptives.Valid.Table.rdata")

#Activity Intensity - Light
LightActivity.Valid.Days.Table <-summarySE(Daily.Valid.Days, measurevar = "LightlyActiveMinutes")

LightActiveMinutesDescriptives.Valid <- LightActiveMinutesDescriptives[ which(LightActiveMinutesDescriptives$Valid.Final == 1), ]
LightActiveMinutesDescriptives.Valid$Valid.Final <- NULL
colnames(LightActivity.Valid.Days.Table)[1] <- "id"
LightActivity.Valid.Days.Table[1,1] <- "All Participants"
LightActiveMinutesDescriptives.Valid.Table <- rbind(LightActiveMinutesDescriptives.Valid, LightActivity.Valid.Days.Table)
save(LightActiveMinutesDescriptives.Valid.Table, file="~/Dropbox/Dissertation.Data/Data/LightActiveMinutesDescriptives.Valid.Table.rdata")

#Activity Intensity - Fairly (Moderate)
FairlyActivity.Valid.Days.Table <-summarySE(Daily.Valid.Days, measurevar = "FairlyActiveMinutes")

FairlyActiveMinutesDescriptives.Valid <- FairlyActiveMinutesDescriptives[ which(FairlyActiveMinutesDescriptives$Valid.Final == 1), ]
FairlyActiveMinutesDescriptives.Valid$Valid.Final <- NULL
colnames(FairlyActivity.Valid.Days.Table)[1] <- "id"
FairlyActivity.Valid.Days.Table[1,1] <- "All Participants"
FairlyActiveMinutesDescriptives.Valid.Table <- rbind(FairlyActiveMinutesDescriptives.Valid, FairlyActivity.Valid.Days.Table)
save(FairlyActiveMinutesDescriptives.Valid.Table, file="~/Dropbox/Dissertation.Data/Data/FairlyActiveMinutesDescriptives.Valid.Table.rdata")

#Activity Intensity - Very Active (Vigorous)
VeryActivity.Valid.Days.Table <-summarySE(Daily.Valid.Days, measurevar = "VeryActiveMinutes")

VeryActiveMinutesDescriptives.Valid <- VeryActiveMinutesDescriptives[ which(VeryActiveMinutesDescriptives$Valid.Final == 1), ]
VeryActiveMinutesDescriptives.Valid$Valid.Final <- NULL
colnames(VeryActivity.Valid.Days.Table)[1] <- "id"
VeryActivity.Valid.Days.Table[1,1] <- "All Participants"
VeryActiveMinutesDescriptives.Valid.Table <- rbind(VeryActiveMinutesDescriptives.Valid, VeryActivity.Valid.Days.Table)
save(VeryActiveMinutesDescriptives.Valid.Table, file="~/Dropbox/Dissertation.Data/Data/VeryActiveMinutesDescriptives.Valid.Table.rdata")

#Calories 
#library(dplyr)
#ZeroDays <- subset(Daily.Activity.Final, Daily.Activity.Final$TotalSteps == 0)
#RestingCalories <- summarise(group_by(ZeroDays, id), 
#                             meanMET = mean(Calories),
#                             sdMET   = sd(Calories),
#                             minMet  = min(Calories),
#                             maxMet  = max(Calories)
#)

#Calories.Valid.Days.Table <-summarySE(Daily.Valid.Days, measurevar = "Calories")

#CaloriesDescriptives.Valid <- CaloriesDescriptives[ which(CaloriesDescriptives$Valid.Final == 1), ]
#CaloriesDescriptives.Valid$Valid.Final <- NULL
#colnames(Calories.Valid.Days.Table)[1] <- "id"
#Calories.Valid.Days.Table[1,1] <- "All Participants"
#CaloriesDescriptives.Valid.Table <- rbind(CaloriesDescriptives.Valid, Calories.Valid.Days.Table)
#save(CaloriesDescriptives.Valid.Table, file="~/Dropbox/Dissertation.Data/Data/CaloriesDescriptives.Valid.Table.rdata")

#PA Guidelines - 150min MVPA
Daily.Valid.Days <- Daily.Activity.Final[ which(Daily.Activity.Final$Valid.Final == 1),]

#Calculate MVPA
Daily.Valid.Days$MVPA <- as.numeric(Daily.Valid.Days$FairlyActiveMinutes + Daily.Valid.Days$VeryActiveMinutes)

#Categorical Variable: 0-29minMVPA = 0, 30-59 = 1, 60+ = 2
Daily.Valid.Days$MVPAGuidelines <- ifelse(Daily.Valid.Days$MVPA < 30, 0, 
                                          ifelse(Daily.Valid.Days$MVPA < 60, 1, 2)
)

#create Guidelines Table
library(dplyr)
MVPA.Guidelines.Table <- as.data.frame(summarise(group_by(Daily.Valid.Days, id, MVPAGuidelines),
                                   Days = length(id),
                                   MeanMVPA = mean(MVPA),
                                   sdMVPA   = sd(MVPA)
))


load("~/Dropbox/Dissertation.Data/Data/wear.days.table.rdata")
MVPA.Guidelines.Table <- merge(MVPA.Guidelines.Table, wear.days.table, by=c("id"))
MVPA.Guidelines.Table$`Initial Available Days` <- NULL
MVPA.Guidelines.Table$`Valid Days (Steps)` <- NULL
MVPA.Guidelines.Table$`Valid Days (MET Processing)` <- NULL
MVPA.Guidelines.Table$`Valid Days (Censured)` <- NULL
MVPA.Guidelines.Table$`Valid Days (Final) Percent`  <- NULL

#calculate percent of valid days in each guideline category
MVPA.Guidelines.Table$Percent <- (MVPA.Guidelines.Table$Days / MVPA.Guidelines.Table$`Valid Days (Final)`)

#use data.table / dcast to recast guidelines table to wide format
library(data.table)
MVPA.Guidelines.Table2 <- dcast(setDT(MVPA.Guidelines.Table), id ~ MVPAGuidelines, value.var=c("Days", "MeanMVPA", "sdMVPA", "Percent"))

#turn back into data frame and order columns
MVPA.Guidelines.Table2 <- setDF(MVPA.Guidelines.Table2)
MVPA.Guidelines.Table2 <- MVPA.Guidelines.Table2[, c(1, 2, 5, 8, 11, 3, 6, 9, 12, 4, 7, 10, 13)]

MVPA.Guidelines.Table.All <- as.data.frame(summarise(group_by(Daily.Valid.Days, MVPAGuidelines),
                                                 Days = length(id),
                                                 MeanMVPA = mean(MVPA),
                                                 sdMVPA   = sd(MVPA)
))

MVPA.Guidelines.Table.All$Percent <- (MVPA.Guidelines.Table.All$Days / 15941)
MVPA.Guidelines.Table.All$id <- "All Participants"
MVPA.Guidelines.Table.All <- MVPA.Guidelines.Table.All[, c(6,1:5)]
MVPA.Guidelines.Table.All2 <- dcast(setDT(MVPA.Guidelines.Table.All), id ~ MVPAGuidelines, value.var=c("Days", "MeanMVPA", "sdMVPA", "Percent"))
MVPA.Guidelines.Table.All2 <- setDF(MVPA.Guidelines.Table.All2)
MVPA.Guidelines.Table.All2 <- MVPA.Guidelines.Table.All2[, c(1, 2, 5, 8, 11, 3, 6, 9, 12, 4, 7, 10, 13)]

MVPA.Guidelines.Table.Final <- rbind(MVPA.Guidelines.Table2, MVPA.Guidelines.Table.All2)

save(MVPA.Guidelines.Table.Final, file="~/Dropbox/Dissertation.Data/Data/MVPA.Guidelines.Table.Final.rdata")

#Step Categories Calculations (Tudor-Locke categories)
Daily.Valid.Days$StepCategory <- ifelse(Daily.Valid.Days$TotalSteps < 5000, "Sedentary", 
                                       ifelse(Daily.Valid.Days$TotalSteps < 7500, "Low Activity", 
                                              ifelse(Daily.Valid.Days$TotalSteps < 10000, "Somewhat Active", 
                                                     ifelse(Daily.Valid.Days$TotalSteps < 12500, "Active", "Very Active")
                                                     )
                                              )
)
Daily.Valid.Days$StepCategory <- factor(Daily.Valid.Days$StepCategory, levels = c("Sedentary", "Low Activity", "Somewhat Active", "Active", "Very Active"))

ggplot(Daily.Valid.Days, aes(Date, TotalSteps, fill=StepCategory)) + geom_bar(stat="identity") + facet_grid(id ~.)

#Create percentages
StepCategories <- with(Daily.Valid.Days, table(id, StepCategory))
StepCategories.Percent <- as.data.frame(prop.table(StepCategories, 1))

ggplot(StepCategories.Percent, aes(id, Freq, fill=StepCategory)) + geom_bar(stat="identity")

##frequency for each category
StepCategories.All <- (table(Daily.Valid.Days$StepCategory))/ 15941

StepCategories.All

