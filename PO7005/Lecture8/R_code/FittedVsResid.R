x1 <- rnorm(100)
x2 <- rnorm(100)
y <- 4*x1 +6*x2 + rnorm(100)
y[50] <- y[50] +20

pdf('Figs/residuals1.pdf')
library(car)
scatterplot.matrix(~x1+x2+y)
dev.off()

pdf('Figs/residuals2.pdf')
lm1 <- lm(y ~ x1 + x2)
plot(predict(lm1), resid(lm1))
points(predict(lm1)[resid(lm1)>10], resid(lm1)[resid(lm1)>10], col=2, cex=3, lwd=2)
dev.off()
