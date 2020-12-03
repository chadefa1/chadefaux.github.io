pdf('Figs/outliersAndInfluentials.pdf')
par(mfrow=c(1,2))
#Outlier that is not influential
x <- rnorm(100)
y <- x + rnorm(100)
plot(x,y, xlim=c(-3,10), ylim=c(-3,10), main='outlier that is not influential')
lm1 <- lm(y~x)
abline(lm1, col='grey')

x[50] <- 10
y[50] <- x[50]
points(x[50], y[50], col=2, lwd=2)
lm2 <- lm(y~x)
abline(lm2, lty=2)

#influential but not outlier
x <- rnorm(100)
y <- x + rnorm(100)
plot(x,y, xlim=c(-3,10), ylim=c(-3,10), main='influential but not outlier')
lm1 <- lm(y~x)
abline(lm1, col='grey')

x[50] <- 5
y[50] <- 0
points(x[50], y[50], col=2, lwd=2)
lm2 <- lm(y~x)
abline(lm2, lty=2)
dev.off()



