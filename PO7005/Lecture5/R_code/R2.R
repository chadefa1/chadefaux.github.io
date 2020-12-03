# R2
x <- rnorm(100)
y <- x + rnorm(100)
lm1 <- lm(y ~ x)

total.var.in.y <- sum((y - mean(y))^2)
variation.not.explained.by.x <- sum(residuals(lm1)^2)
R2 <- 1-( variation.not.explained.by.x / total.var.in.y)
R2

#let's check: 
summary(lm1)$r.squared
