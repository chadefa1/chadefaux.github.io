
par(mfrow=c(3,2))
# No autocorrelation:
x <- 1:1000
y <- x +rnorm(1000, mean=500^2, sd=200^2)
plot(x,y, type='l', main='No autocorrelation')

lm1 <- lm(y ~ x)
abline(lm1, col=2, lty=2, lwd=3)

plot(resid(lm1), type='l', main='residuals without autocorrelation')


# No autocorrelation:
x <- 1:1000
y <- x^2 +rnorm(1000, mean=500^2, sd=200^2)
plot(x,y, type='l', main='Autocorrelation')

lm1 <- lm(y ~ x) 
abline(lm1, col=2, lty=2, lwd=3)

plot(resid(lm1), type='l', main='residuals with autocorrelation')



#--- autocorrelation
x <- 1:1000
y <- cumsum(rnorm(1000))
plot(x,y, type='l', main='Autocorrelation')

lm1 <- lm(y ~ x)
abline(lm1, col=2, lty=2, lwd=3)

plot(resid(lm1), type='l', main='residuals with autocorrelation')
