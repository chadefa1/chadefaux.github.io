education.women <- 10 + rnorm(n =100, mean = 10, sd =10)
women <- education.women * 10000 +rnorm(n=100, mean=100000, sd = 100000)

education.men <- rnorm(n =100, mean = 10, sd =10)
men <- 1000000 + education.men * 10000 +rnorm(n=100, mean=100000, sd = 100000)

education <- c(education.women, education.men)
observed.income <- c(women, men)
male <- c(rep(0, 100), rep(1,100))

#regression without dummy
lm1 <- lm(observed.income ~ education)
#regression with dummy
lm2 <- lm(observed.income ~ education + male)

pdf('Figs/dummy.pdf')
par(mfrow=c(1,1))
plot(education, observed.income)
abline(lm1, lty=2, col=2)
abline(coef(lm2)[1], coef(lm2)[2], lty=3, col=2, lwd=2)
abline(coef(lm2)[1] + coef(lm2)[3], coef(lm2)[2] , lty=3, col=2, lwd=2)
text(0, 1250000, 'male')
text(0, 220000, 'female')
dev.off()

pdf('Figs/dummyResid.pdf')
plot(education, residuals(lm1))
plot(education, residuals(lm2))
dev.off()