#--- Nonlinearities?

setwd('~/Documents/Academia/Teaching/TCD/2015-HT/PO7005_Quantitative_Methods_II/Lectures/lecture6/')
library(gdata)
dat <- read.xls('Data/xm501bwa.xls')

library(fpp)
library(fields) # to draw vertical lines
pdf('Figs/logTransform.pdf')
par(mfrow=c(2,2))
data(fuel)

lm1 <- lm(fuel$Carbon ~ fuel$City)
plot(fuel$City, fuel$Carbon, xlab = 'City (mpg)', ylab = 'Carbon Footprint (tonnes per year)')
abline(lm1, lty=2, col=2)
plot(fuel$City, resid(lm1))
yline(0)


lm2 <- lm(log(fuel$Carbon) ~ log(fuel$City))
plot(log(fuel$City), log(fuel$Carbon), xlab = 'City (mpg)', ylab = 'Carbon Footprint (tonnes per year)')
abline(lm2, lty=2, col=2)
plot(fuel$City, resid(lm2))
yline(0)
dev.off()
