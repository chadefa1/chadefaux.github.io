education <- rnorm(n =100, mean=10, sd=2)
gender <- sample(x = c(0,1),size = 100, replace=TRUE)
income <- education + gender + education * 10*gender + rnorm(100, mean=10, sd=10)

lm1 <- lm(income ~ education)
lm2 <- lm(income ~ education + gender + education*gender)

pdf('Figs/interaction.pdf')
plot(education, income)
abline(lm1)
abline(coef(lm2)[1], coef(lm2)[2] + coef(lm2)[4], lty=2)
abline(coef(lm2)[1], coef(lm2)[2], lty=2)
dev.off()



