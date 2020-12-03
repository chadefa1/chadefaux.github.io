par(mfrow=c(2,2))
x <- rnorm(1000)
x[500] <- 100
X <- cbind(1,x)
y <- x + rnorm(1000)
lm1 <- lm(y ~ x)
plot(lm1)

H <- X %*% solve( t(X) %*% X ) %*% t(X) 
h <- diag(H) 
sum(h)

max(h) 




x <- model.matrix(lm1)
lev <- hat(x)
lev2 <- predict(lm1)

plot(lev)
sum(lev)

