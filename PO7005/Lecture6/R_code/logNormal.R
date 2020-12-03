#generate data from a log-normal distribution
n <- 5000
x1 <- rnorm(n)
hist(x1, breaks=n/10)
y <- x1 + rlnorm(n, mean=10)
plot(x1,y)
lm1 <- lm(y ~ x1)
plot(resid(lm1))

plot(x1,log(y))
lm1 <- lm(log(y) ~ x1)
plot(resid(lm1))


