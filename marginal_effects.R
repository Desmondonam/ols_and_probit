library("margins")
x <- lm(mpg ~ cyl * hp + wt, data = mtcars)
(m <- margins(x))