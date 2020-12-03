setwd('~/Documents/Academia/Teaching/TCD/2015-HT/POTBD_Quantitative_Methods_II/Lectures/lecture1/')

#--- generate x ~ N[0,1]:
x <- rnorm(10000, mean = 0, sd = 1)
#--- Calculate confidence interval for mean of x:
# first, calculate estimated standard error of the mean
esem <- sd(x)/sqrt(length(x))
# calculate confidence interval
ci.h <- mean(x) + 1.96*esem
ci.l <- mean(x) - 1.96*esem

#--- Alternatively, using bootstrap:
# sample over and over from x, and calculate the mean each time
mean.x <- NULL
for(i in 1:10000){
  x1 <- x[sample(1:length(x), size = length(x), replace = T)]
  mean.x <- c(mean.x,mean(x1))
}

mean.x <- mean.x[order(mean.x)]
ci.boot.h <- mean.x[length(mean.x)*97.5/100]
ci.boot.l <- mean.x[length(mean.x)*2.5/100]

#--- plot the bootstrap results
pdf('Figs/bootstrap.pdf')
library(fields)
hist(mean.x, breaks=50)
xline(ci.h, col=2, lty=2, lwd=2)
xline(ci.l, col=2, lty=2, lwd=2)
xline(ci.boot.h, col=4, lty=2, lwd=2)
xline(ci.boot.l, col=4, lty=2, lwd=2)
legend('topright', legend = c('estimated ci', 'bootstrap ci'), lty=c(2,2), col=c(2,4), cex=1)
dev.off()
