pdf('Figs/typesOfOutliers.pdf')
par(mfrow=c(1,2))
#extreme x-value
x <- rnorm(100)
y <- x + rnorm(100)
plot(x,y, xlim=c(-3,10), ylim=c(-3,10))
lm1 <- lm(y~x)
abline(lm1, col='grey')

x[50] <- 10
points(x[50], y[50], col=2, lwd=2)
lm2 <- lm(y~x)
abline(lm2, lty=2)


#extreme y-value
x <- rnorm(100)
y <- x + rnorm(100)
plot(x,y, xlim=c(-3,10), ylim=c(-3,10))
lm1 <- lm(y~x)
abline(lm1, col='grey')

y[50] <- 10
points(x[50], y[50], col=2, lwd=2)
lm2 <- lm(y~x)
abline(lm2, lty=2)
dev.off()


