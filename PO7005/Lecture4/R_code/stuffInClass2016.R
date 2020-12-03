x1 <- rnorm(100)
y <- x1 + rnorm(100)
X <- cbind(1, x1)

b <- inv(t(X)%*%X)%*%t(X)%*%y
plot(x1, y)
abline(a = -0.11, b=0.95, lwd=2)

e <- y - X%*%b
sigma2 <- (t(e)%*%e)/(100 - 2)

var.b <- as.numeric(sigma2) * inv(t(X)%*%X)
sd.b <- diag(sqrt(var.b))

lm1 <- lm(y ~ x1)
summary(lm1)

t <- b/sd.b
