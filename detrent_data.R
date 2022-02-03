require(pracma)

#Create data frame with country data:
df <- data.frame(
  "country1"=c(50,69,75,77,60,81,67,96,81,81,51,91,100,102,69,96,
               103,98,106,111,95),
  "country2"=c(52,79,84,87,81,99,83,103,104,84,82,115,118,106,96,
               107,95,62,105,136,97))

#Transpose data frame, making a matrix in the process:
df <- t(df)

#Add dates as column names:
colnames(df) <- c(1960,1961,1962,1963,1964,1965,1966,1967,1968,1969,
                  1970,1971,1972,1973,1974,1975,1976,1977,1978,1979,1980)

#Apply detrend:
data.detrend <- detrend(df, tt = 'linear')

#Apply time series:
data.detrend <- ts(as.numeric(data.detrend),
                   start=c(1960,1), frequency=2)
str(data.detrend) #check date range

#Plot:
plot.ts(data.detrend)