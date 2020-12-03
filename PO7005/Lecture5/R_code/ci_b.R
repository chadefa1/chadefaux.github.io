# confidence.interval of b
setwd('~/Documents/Academia/Teaching/TCD/2015-HT/PO7005_Quantitative_Methods_II/Lectures/lecture5/')
library(fields)
# import previous code
source('tstat.R')

#---------- CALCULATE b's confidence interval -------
#--- Calculate b's confidence interval manually:
conf.up <- b[2]+qt(0.975, df=n-2) * se.b[2,2]
conf.low <- b[2]-qt(0.975, df=n-2) * se.b[2,2]

#--- Check with R's canned method
confint(lm1)

#---------------- INTERPRETATION ---------------------
#Suppose that we regressed y on x and calculated the confidence interval of b.
#We get, say, $b \in [1.88, 2.22]$. What does it mean?
#It means that if we drew a random sample from our population over and over, 
#regressed y on x and collect b for each, 95\% of the time we'd get $b \in [1.88, 2.22]$. The code below
# shows that this is the case by plotting the distribution of the resulting $b$s.

#Define true population
n <- 100
x <- rnorm(n)
y <- 2* x + rnorm(n)
ci <- confint(lm(y ~ x)) # this tells me that 95% of the time this interval should contain the true parameter (which here is 2)

#Let's see if that is true. I.e., 95% of the time, we should get b in [1.83, 2.23]
# create a function to regress y on x and collect b1:
lm1 <- function(){  
  sampl <- sample(1:n, size = n, replace=T)
  return(as.numeric(coef(lm(y[sampl] ~ x[sampl]))[2]))
}

# Collect the coefs 
list.of.coefs <- replicate(n = 10000, expr = lm1())

# Plot the distribution
pdf('Figs/confint.pdf')
hist(list.of.coefs, breaks=50, xlab='b as estimated from sample')
legend('topleft', legend = 'True pop confidence interval', lty = 2, col=2)
xline(ci[2,1], col=2, lty=2); xline(ci[2,2], col=2, lty=2)
length(list.of.coefs[list.of.coefs > ci[2,1] & list.of.coefs < ci[2,2]])
# In this case, I get 9709 cases within the confidence interval of the true population values. Not exactly the 9750 expected, but close...
dev.off()