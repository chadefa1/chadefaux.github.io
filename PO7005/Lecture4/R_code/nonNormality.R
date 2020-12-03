     setwd('~/Documents/Academia/Teaching/TCD/PO7005_Quantitative_Methods_II/2016-HT/Lectures/lecture4/')
     n <- 1000
     
     #Define a plotting function:
     #plot the results
     plotTheDistributionOfResiduals <- function(x, y, errorDist, xDist){
          plot.title <- paste('x distributed ', xDist, '\n Errors distributed ', errorDist)
          plot(x, y, cex=0.5, pch='.', col='gray',
               main=plot.title, las = 1, cex.axis=1.5)
          abline(lm1, col=2, lty=2, lwd=2)
          hist(resid(lm1), breaks=100, main = 'Distribution of residuals')
          par(new = TRUE)
          plot(density(resid(lm1)),
               xlab='', ylab='', xaxt='n', main = '', lwd=2)
     }
     
     
     #------------------------------------------------------------------
     #--- Normally distributed error term
     pdf('Figs/normalityWithR.pdf')
     par(mfrow=c(4,2))
     # Case 1: x and errors are normally distributed
     x <- rnorm(n) 
     y <- x + rnorm(n)
     lm1 <- lm(y ~ x)
     plotTheDistributionOfResiduals(x, y, errorDist = 'normal', xDist = 'normal')     
     
     
     # Case 2: x is normally distributed , but errors are distributed exponential     
     x <- rnorm(n) 
     y <- x + rexp(n, rate = 1) 
     lm1 <- lm(y ~ x)
     plotTheDistributionOfResiduals(x, y, errorDist = 'exponential', xDist = 'normal')
     
     
     # Case 3: x is NOT normally distributed, but errors are     
     x <- rexp(n, rate = 1) 
     y <- x + rnorm(n) 
     lm1 <- lm(y ~ x)
     plotTheDistributionOfResiduals(x, y, errorDist = 'normal', xDist = 'exponential')
     
     
     
     # Case 4: Neither x nor the errors are normally distributed
     x <- rexp(n, rate = 1) 
     y <- x + rexp(n, rate = 1) 
     lm1 <- lm(y ~ x)
     plotTheDistributionOfResiduals(x, y, errorDist = 'exponential', xDist = 'exponential')
     
     
     dev.off()
