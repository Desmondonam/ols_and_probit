set.seed(42)

# Making a variable for number of observations 
# is helpful if we want to change our dataset
# in the future
N <- 100

x <- round(runif(N, 0,1),2)

# Simulate potential outcomes 
# We will assume constant treatment effect
y0 <- round(rnorm(N, mean = x),2)
y1 <- y0 + 0.35 
z <- sample(0:1, 100, replace = T, prob = c(0.5, 0.5))
y <- ifelse(z, y1, y0)

# To demonstrate missing data handling 
# generate missing data 
miss <- sample(0:1,100, replace = T, prob = c(0.1, 0.9))
x_miss <- ifelse(miss, NA, x)

# Bring it all together in one data frame
dat <- data.frame(x,y0, y1, z, y, x_miss)
head(dat)