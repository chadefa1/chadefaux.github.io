setwd('~/Documents/Academia/Teaching/TCD/2015-HT/PO7005_Quantitative_Methods_II/Lectures/lecture5/')
n <- 100
x <- rnorm(n, mean = mean1, sd = sd1)
Y <- x + rnorm(n)


lm1 <- function(n1 = 100, mean1 = 0, sd1 =1){
  samp <- sample(x = 1:n, size = n1, replace = T)
  x.sample <- x[samp]
  y.sample <- Y[samp]
  lm1 <- lm(y.sample ~ x.sample)
  abline(lm1)
  return(summary(lm1)$coefficients[2,3])
}

# WHAT IF....?
    # ...we change the number of observation?
    pdf(file = 'Figs/nobs.pdf')
    par(mfrow=c(1,2), pty='s')
    plot(x, Y, pch=19, main = 'Few obs')
    t.low <- replicate(n = 20, lm1(n1 = 5) )
    mean(t.low)

    plot(x, Y, pch=19, main = 'Many obs')
    t.high <- replicate(n = 20, lm1(n1 = 100) )
    mean(t.high)
    dev.off()

# ...we include another variable that is correlated with x?
pdf(file = 'Figs/sd_x.pdf')
par(mfrow=c(1,2), pty='s')
plot(x, Y, pch=19, main = 'low SD')
t.low <- replicate(n = 50, lm1(sd1 = 0.1) )
mean(t.low)

plot(x, Y, pch=19, main = 'High SD')
t.high <- replicate(n = 50, lm1(sd1 = 4) )
mean(t.high)
dev.off()
