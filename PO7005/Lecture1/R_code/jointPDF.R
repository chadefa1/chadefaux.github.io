setwd('~/Documents/Academia/Teaching/TCD/2015-HT/Quant2/Lectures/lecture1/')
pdf('Figs/jointPDF.pdf')
#--- Generate random normal variable
xy <- data.frame(x = rnorm(n = 1000000, mean = 0, sd = 1),
            y = rnorm(n = 1000000, mean = 0, sd = 1))
xy <- round(xy, 1)
xy <- xy[order(xy$x, xy$y),]

outer(xy$x, xy$y, FUN=function(x),nrow(x))

density <- expand.grid(x=seq(min(xy$x),max(xy$x),length.out=40), 
                       y=seq(min(xy$y),max(xy$y),length.out=40))
density <- round(density,1)
density <- density[order(density$x, density$y),]



for(i in 2:nrow(density)){
density$z <- nrow(xy[round(xy$x,1) == density$x[i] &  round(xy$y,1) == density$y[i],])
}

#--- Plot it
library(plot3D)
plot(density(rnv),
     main = 'Normal PDF',
     ylab='probability density', xlab = 'x' )
dev.off()