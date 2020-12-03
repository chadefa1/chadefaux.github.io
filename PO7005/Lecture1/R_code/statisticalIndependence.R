setwd('~/Documents/Academia/Teaching/TCD/2015-HT/POTBD_Quantitative_Methods_II/Lectures/lecture1/')

pdf('Figs/independence_and_correlation.pdf')
par(mfrow=c(2,2))
# 2 independent rv:
x1 <- rnorm(1000)
x2 <- rnorm(1000)
plot(x1,x2, main='independent and uncorrelated rv')

length(x1[x2>0])
length(x1[x2<0])

# 2 correlated dependent rv :
x1 <- rnorm(10000)
x2 <- x1 + rnorm(10000)
plot(x1,x2, main = 'dependent and correlated')
cor(x1,x2)

# 2 uncorrelated dependent rv :
#e.g. 1:
x1 <- rnorm(10000)
x2 <- x1 *rnorm(10000)
plot(x1,x2, main = 'dependent and uncorrelated')
cor(x1,x2)

#e.g. 2:
x1 <- rnorm(10000)
x2 <- x1^2
plot(x1,x2, main='dependent and uncorrelated')
cor(x1,x2)

dev.off()