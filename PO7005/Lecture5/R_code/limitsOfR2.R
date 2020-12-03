# Limits of R2
n <- 100
x1 <- rnorm(n)
x2 <- x1 + rnorm(n, sd=0.1)
y <- x1 + rnorm(n)
plot(x1, y)

#Adding a variable increases R2, even if that variable is unrelated to y. But it also affects t_{b1}
lm1 <- lm(y ~ x1 )
summary(lm1)$r.squared
summary(lm1)

lm2 <- lm(y ~ x1 + x2)
summary(lm2)$r.squared
summary(lm2)
# notice how the t-value of x1 has decreased?


