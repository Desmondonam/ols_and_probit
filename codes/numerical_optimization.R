f <- function(x) exp(-0.5*x) * sin(10*pi*x)
f(0.5)
#> [1] 4.768779e-16

result <- optimize(f, interval = c(0, 1), tol = 0.0001)
result
#> $minimum
#> [1] 0.3494978
#> 
#> $objective
#> [1] -0.8395633
str(result)
#> List of 2
#>  $ minimum  : num 0.349
#>  $ objective: num -0.84

# let's plot something
curve(f, 0, 1, n = 200, col = 4); grid()
points(result$minimum, result$objective, pch = 20, col = "red", cex = 1.5)