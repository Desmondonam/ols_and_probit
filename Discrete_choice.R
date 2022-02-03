library(dplyr)
library(AER)
library(mlogit)

data("TravelMode", package = "AER") #load the data
head(TravelMode) #see the head of the data
nrow(TravelMode) #number of rows

length(unique(TravelMode$individual)) #how many individuals?

table(is.na(TravelMode)) #is there any missing data

theta = c(1,2,3,-0.001,-0.003,-0.005) #generate one set of parameters
sample<-filter(TravelMode,individual==1)  #filter one individual
sample$constant<-0
sample$constant[sample$mode=="air"] = theta[1]
sample$constant[sample$mode=="train"] = theta[2]
sample$constant[sample$mode=="bus"] = theta[3]
sample$utility = theta[4]*sample$gcost+theta[5]*sample$wait+theta[6]*sample$travel+sample$constant 
sample