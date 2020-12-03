#--- Input data
x = c(10, 42, 39, 30, 80)
y = c(2,3,7,1,9)

#--- plot scatterplot and the regression line
lm1 <- lm(y ~ x)
plot(x, y, xlim=c(0,100), ylim=c(0,10))
abline(a = 0.007755, b = 0.109260, col=2) #note: this is easier and does the same thing: abline(lm1)

# calculate residuals and predicted values
res <- signif(residuals(lm1), 2)
fit <- predict(lm1)

# plot distances between points and the regression line
segments(x, y, x, fit, col="red")

# add labels (res values) to points
library(calibrate)
textxy(x, y, res, cex=2)
