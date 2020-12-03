setwd('~/Documents/Academia/Teaching/TCD/2015-HT/Quant2/Lectures/lecture1/')
pdf('Figs/normalPDF.pdf')
#--- Generate random normal variable
rnv <- rnorm(n = 1000000, mean = 0, sd = 1)
#--- Plot it
plot(
	density(rnv),
     main = 'Normal PDF',
     ylab='probability density', xlab = 'x' )
dev.off()