#--- Input data
x = c(10, 42, 39, 30, 80)
y = c(2,3,7,1,9)

#--- run the regression
lm(y ~ x)

#--- Plot it
plot(x, y)
abline(a = 0.007755, b = 0.109260, col=2)

fitted(lm(y ~ x))
