setwd('~/Documents/Academia/Teaching/TCD/2015-HT/PO7005_Quantitative_Methods_II/Lectures/lecture7/')
library(gdata)
dat <- read.xls('Data/xm501bwa.xls')
par(mfrow=c(1,1))
pdf('Figs/BoxplotSalaryGender.pdf')
boxplot(dat$SALARY ~ dat$GENDER, xlab='Gender', ylab='Salary')
dev.off()

sd(dat$SALARY[dat$GENDER==1])
sd(dat$SALARY[dat$GENDER==0])

pdf('Figs/scatterSalaryGender.pdf')
plot(dat$GENDER,dat$SALARY)
dev.off()

pdf('Figs/scatterSalaryEduc.pdf')
plot(dat$EDUC,dat$SALARY)
dev.off()
