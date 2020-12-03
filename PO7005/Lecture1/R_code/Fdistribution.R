setwd('~/Documents/Academia/Teaching/TCD/2015-HT/Quant2/Lectures/lecture1/')
# generate random normal variables
n= 200000
for(i in 1:10){
  assign(paste("z", i, sep = ""), rnorm(n))    
}

pdf('Figs/FDistribution.pdf')
U = z1 + z2^2
V = z3^2 + z4^2 + z5^2
hist( (U/2) / (V/3), xlim=c(0,20), freq=F,breaks=100000, main='', xlab='x', ylab='Probability', cex.axis=2, cex.lab=2, )
dev.off()