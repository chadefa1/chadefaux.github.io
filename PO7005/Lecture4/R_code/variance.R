#variance of b

setwd('~/Documents/Academia/Teaching/TCD/2015-HT/PO7005_Quantitative_Methods_II/Lectures/lecture4/')
pdf('Figs/variance.pdf')
par(mfrow=c(2,1))
#generate population variables
x <- rnorm(1000)
y <- x + rnorm(1000)

# draw samples from pop
sample.coefs <- NULL
for(i in 1:2000){ # generate 500 random samples from the true population
  samplei <- sample(x = 1:length(x), size = 100, replace = FALSE)
  x.sample <- x[samplei]
  y.sample <- y[samplei]  
  lm1.sample <- lm(y.sample ~ x.sample)  
  sample.coefs <- c(sample.coefs, coef(lm1.sample)[2])
}
hist(sample.coefs, breaks=100, xlim=c(0,2), main='y ~ N[0,3]')

#Now do the same thing, but with higher variance for y (and hence the residuals)
#generate population variables
x <- rnorm(1000)
y <- x + rnorm(1000, sd=3)

# draw samples from pop
sample.coefs <- NULL
for(i in 1:2000){ # generate 500 random samples from the true population
  samplei <- sample(x = 1:length(x), size = 100, replace = FALSE)
  x.sample <- x[samplei]
  y.sample <- y[samplei]  
  lm1.sample <- lm(y.sample ~ x.sample)  
  sample.coefs <- c(sample.coefs, coef(lm1.sample)[2])
}
hist(sample.coefs, breaks=100, xlim=c(0,2), main='y ~ N[0,3]')
dev.off()