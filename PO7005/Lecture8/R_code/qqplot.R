pdf('Figs/normality.pdf')
par(mfrow=c(2,2))
#--- normality satisfied
x <- rchisq(10000,2) # let it be clear that x need NOT be normally distributed, and neither does y!
y <- x + rnorm(10000)
lm1 <- lm(y ~ x)
hist(resid(lm1), main='normally distributed e', breaks=30)
qqPlot(resid(lm1), main='normally distributed e')

#--- normality violated
x <- rnorm(1000)
y <- x + rchisq(1000,df = 2)
hist(resid(lm1), main='chisq distributed e', breaks=30)
lm1 <- lm(y ~ x)
qqPlot(resid(lm1), main='chisq distributed e')
dev.off()