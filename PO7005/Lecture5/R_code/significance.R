# A word of caution on p values
setwd('~/Documents/Academia/Teaching/TCD/2015-HT/PO7005_Quantitative_Methods_II/Lectures/lecture5/')
n <- 100000
x <- rnorm(n, sd=0.01)
y <- x + rnorm(n)
lm1 <- lm(y ~ x)
summary(lm1)

sample1 <- sample(1:n, size = 1000, replace=FALSE)
pdf('Figs/significance.pdf')
plot(x[sample1], y[sample1], xlab='x', ylab='y', cex.lab=2, las=1)
abline(lm1, col=2, lwd=2, lty=2)
dev.off()