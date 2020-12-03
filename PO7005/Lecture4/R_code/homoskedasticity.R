setwd('~/Documents/Academia/Teaching/TCD/2015-HT/PO7005_Quantitative_Methods_II/Lectures/lecture4/')
pdf('homosk.pdf')
par(mfrow=c(1,2))
n <- 2000
#Heteroskedasticity
income <- rnorm(n, mean = 30000, sd=10000)
spending <- income +(0.8)*rnorm(n, mean=10000, sd=2000)
plot(income, spending, main='Homoskedasticity')
# Now compare the variance at the bottom of the income scale to the top
var(spending[income > mean(income)]) 
var(spending[income < mean(income)])
# Not really different.

#Homoskedasticity
income <- rnorm(n, mean = 30000, sd=10000)
spending <- income *(0.8)*rnorm(n, mean=0.5, sd=0.2)
plot(income, spending, main='Heteroskedasticity')
# Now compare the variance at the bottom of the income scale to the top
var(spending[income > mean(income)]) 
var(spending[income < mean(income)])
# very different
dev.off()



