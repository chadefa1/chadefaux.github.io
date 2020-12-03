setwd('~/Documents/Academia/Teaching/TCD/2015-HT/Quant2/Lectures/lecture1/')
# generate random normal variables
n= 100000
for(i in 1:10){
  assign(paste("z", i, sep = ""), rnorm(n))    
}

pdf('Figs/tDistribution.pdf')
Z = z1
U = z2^2 + z3^2
hist(Z/sqrt(U/2), freq=F,breaks=10000, main='', xlab='x', ylab='Probability', cex.axis=2, cex.lab=2, xlim=c(-5,5))
par(new=T)
lines(density(Z),col=2)
legend('topright', c('t-distribution\n df = 2', 'Normal dist\n(for comparison)'), lty=c(1,1), col=c(1,2), cex=1.5)
dev.off()