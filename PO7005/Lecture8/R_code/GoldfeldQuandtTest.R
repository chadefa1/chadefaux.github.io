#------ Goldfeld-Quandt test ------#

#--- Generate Data
n <- 3000
x <- rnorm(n, mean=3, sd=1)
y <- x  + x*rnorm(n, mean=1)

#--- Estimate the model
formula1 <- y~x
lm1 <- lm(formula1)

#--- order the residuals according to x and plot
df1 <- data.frame(x = x, e = resid(lm1))
df1 <- df1[order(x),]
e <- df1$e

#--- split the residuals in 2
e1 <- e[1:(length(e)/2)]
e2 <- e[(length(e)/2+1):length(e)]

#--- Calculate the F statistic
Ftest1 <- sum( e2^2/length(e2) ) / sum( e1^2/length(e1) )

#--- verify with the canned version:
library(lmtest)
gqtest(formula1, point = 0.5, fraction = 0, alternative = c("greater"),
       order.by = x, data = list())

#--- Plot 
library(fields)
pdf('Figs/gqtestR.pdf')
par(mfrow=c(2,1))
plot(x,y, cex=0.5, cex.lab=1.5)
plot(df1$x, df1$e^2, cex=0.5, xlab='x', ylab='e^2', las=1, cex.lab=1.5)
xline(x[length(e)/2], col=2, lty=2, lwd=3)
dev.off()








