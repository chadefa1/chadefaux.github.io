setwd('~/Documents/Academia/Teaching/TCD/2015-HT/Quant2/Lectures/lecture1/')
pdf('Figs/normalCDF.pdf')
#--- generate a random normal var
rnv <- rnorm(n = 1000000, mean = 0, sd = 1)

#--- Calculate the CDF manually (otherwise use ecdf)
# 1. draw empty canvass:
plot(x=c(min(rnv), max(rnv)), y=c(0,1), type='n', main = 'CDF', ylab='P(X<x)')
# 2. Calculate P(X < x) :
for(i in seq(min(random.normal.variable), max(random.normal.variable), length.out=200)){ 
  px <- length(random.normal.variable[random.normal.variable <= i]) / length(random.normal.variable)
  points(i, px)
}
dev.off()
