setwd('~/Documents/Academia/Teaching/TCD/PO7005_Quantitative_Methods_II/2016-HT/Lectures/lecture4/')
n <- 15
#unbiasedness
library(fields)
pdf('Figs/unbiasedness.pdf')
par(mfrow=c(6,5), mar=c(2,1,1.5,0))
#generate population variables
x <- rnorm(n)
y <- x + rnorm(n)
lm1 <- lm(y ~ x)
plot(x, y, main = paste('Population parameter: ', c('a = ','b = '),round(coef(lm1),2)), pch='.', col=3, cex.main=0.75)
abline(lm1, col=2, lty=2, lwd=2)
summary(lm1) # This is my true population parameters
true.coef <- coef(lm1)

#But I don't observe the true population. What I observe is a sample of x and y
sample.coefs <- NULL
for(i in 1:28){ # generate random samples from the true population
  samplei <- sample(x = 1:length(x), size = n/2, replace = TRUE)
  x.sample <- x[samplei]
  y.sample <- y[samplei]  
  lm1.sample <- lm(y.sample ~ x.sample)
  plot(x, y, 
       main = paste(c('b0 = ','b1 = '), round(coef(lm1.sample),2)),
       col=4, cex.main=0.75,
       xaxt='n', yaxt='n', xlab='', ylab='')
  abline(lm1.sample, col=2, lty=2, lwd=2)
  sample.coefs <- c(sample.coefs, coef(lm1.sample)[2])
}

hist(sample.coefs, main= 'Histogram of sample coefficients', breaks=15)
xline(true.coef, col=2, lty=2, lwd=3)
xline(mean(sample.coefs), col=3, lty=3, lwd=3)
par(new=T)
plot(density(sample.coefs), col=2, xaxt='n', yaxt='n', xlab='', ylab='')

dev.off()
