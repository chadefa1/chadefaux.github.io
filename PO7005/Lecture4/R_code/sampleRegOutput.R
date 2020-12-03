# A quick look at a sample regression output
x <- rnorm(100)
y <- x + rnorm(100, sd=5)  
lm1 <- lm(y ~ x)
summary(lm1)
