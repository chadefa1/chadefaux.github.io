################################################
# EXAMPLES WHERE GQ does not work well
################################################

#--- First, gq might fail because var(e) is not a monotonic function of x
n <- 3000
x <- rnorm(n, mean=0, sd=1)
y <- x  + x*rnorm(n, mean=1)
gqtest(formula1, point = 0.5, fraction = 0, alternative = c("greater"),
       order.by = x, data = list())

pdf('Figs/gqtestRfail.pdf')
par(mfrow=c(2,1), pty='s')
plot(x,y, main='GQ test fails because of monotonicity')

#--- or gq might fail because of outliers
n <- 3000
x <- rnorm(n, mean=0, sd=1)
y <- x  + rnorm(n, mean=1)
y[n] <- 10*y[n]
gqtest(formula1, point = 0.5, fraction = 0, alternative = c("greater"),
       order.by = x, data = list())

plot(x,y, main='GQ test fails because of outlier')
dev.off()