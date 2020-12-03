# Prediction Interval
n <- 20
x <- rnorm(n)
X <- cbind(rep(1,n), x)
#z <- rnorm(100)
y <- 2*x  + rnorm(n)

lm1 <- lm(y ~ 1 + x)

#--- canned solution
newx <- data.frame(x=seq(min(x), max(x), length.out=n))
pdf('Figs/pi.pdf')
plot(x, y)
ci1 <- predict(lm1, interval="predict", newdata = newx)
lines(newx$x, ci1[,1], lty=1, col=2)
lines(newx$x, ci1[,2], lty=2, col=2)
lines(newx$x, ci1[,3], lty=2, col=2)
dev.off()
# Calculate the ci for a specific value of x:
ci.canned <- predict(lm1, interval="predict", newdata = data.frame(x=x[1]), se.fit=T)

#--- let's get the same thing manually:
xprimex <- t(X)%*%X
b <- solve(xprimex) %*% t(X)%*%y
yhat <- X%*%b
e <- yhat - y
s2 <- as.numeric(t(e)%*%e) / (n-2)
var.b <- s2 * solve(xprimex)
se.e0 <- sqrt(s2 + t(X[1,])%*%var.b%*%X[1,])
t <- qt(0.975, n-2)
ci.home.made <- c(yhat[1] -t*se.e0, yhat[1] +t*se.e0)
#same result as in ci.canned


# Note: how about the CONFIDENCE interval?
se <- sqrt(t(X[1,])%*%var.b%*%X[1,])
t <- qt(0.975, n-2)
ci.home.made <- c(yhat[1] -t*se, yhat[1] +t*se)
ci.canned <- predict(lm1, interval="confidence", newdata = data.frame(x=x[1]), se.fit=T)
pdf('Figs/ci.pdf')
plot(x, y)
ci1 <- predict(lm1, interval="confidence", newdata = newx)
lines(newx$x, ci1[,1], lty=1, col=2)
lines(newx$x, ci1[,2], lty=2, col=2)
lines(newx$x, ci1[,3], lty=2, col=2)
dev.off()



