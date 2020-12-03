setwd('~/Documents/Academia/Teaching/TCD/2015-HT/PO7005_Quantitative_Methods_II/Lectures/lecture5/')
# Set up the data
n <- 100
x <- rnorm(n)
Y <- x + 2*rnorm(n)

# Ask R to estimate the model
lm1 <- lm(Y ~ x)
summary(lm1)

#------- Let's do it all manually --------#
const <- rep(1, length(x))
X <- cbind(const, x)
XprimeXinv <- solve(t(X)%*%X)
XprimeY <- t(X)%*%Y
b = XprimeXinv %*% XprimeY

# find residuals
e <- Y - X%*% b

# sum of squared residuals:
eprimee <- t(e) %*% e

# estimated variance of residuals:
s2 <- as.numeric(eprimee / (length(x) -2) )

# variance of b:
var.b <- s2 *diag(2) %*% XprimeXinv
se.b <- sqrt(var.b)

# calculate t stat:
t <- b / diag(se.b)

# is this significantly different from 0?
# to do this manually (and approximately: this is just for intuition), generate many values drawn from a t-distribution with n-k df
random.t <- sort(rt(10000, df = n-2))
pdf('Figs/t_test.pdf')
hist(random.t, breaks=100, xlim=c(-max(abs(t)),max(abs(t))))
#draw a line at the minimum significance level, 97.5
xline(random.t[9750], lwd=2)
xline(random.t[250], lwd=2)
xline(t, col=2, lty=2)
axis(side = 1, at = t, labels = c('t0','t1'), cex.axis=2)
dev.off()




