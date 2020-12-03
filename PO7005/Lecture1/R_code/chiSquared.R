setwd('~/Documents/Academia/Teaching/TCD/2015-HT/Quant2/Lectures/lecture1/')
# generate random normal variables
n= 100000
for(i in 1:10){
  assign(paste("z", i, sep = ""), rnorm(n))    
}

pdf('Figs/chisquared.pdf')
Z2 = z1^2 + z2^2
Z5 = z1^2 + z2^2 + z3^2 + z4^2 + z5^2 
Z10 = z1^2 + z2^2 + z3^2 + z4^2 + z5^2 + z6^2 +z7^2 + z8^2 +z9^2 + z10^2
plot(density(Z2), main='', xlab='x', ylab='Probability', cex.axis=2, cex.lab=2)
lines(density(Z5), lty=2)
lines(density(Z10), lty=3)
legend('topright',legend = c('df = 2', 'df = 5', 'df = 10'), lty=c(1,2,3), cex=3)
dev.off()