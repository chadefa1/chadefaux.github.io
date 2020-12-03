#--- Omitted Variable Bias

setwd('~/Documents/Academia/Teaching/TCD/2015-HT/PO7005_Quantitative_Methods_II/Lectures/lecture6/')
library(gdata)
dat <- read.xls('Data/xm501bwa.xls')

# Unrestricted model : 
unrestricted.formula <- SALARY ~ EDUC + SALBEGIN + GENDER + MINORITY

# restricted model:
restricted.formula <- SALARY ~ EDUC

lm.unrestricted <- lm(unrestricted.formula, data = dat)
# 1 additional year of education -> + 970$ / year in salary, HOLDING EVERYTHING ELSE CONSTANT
lm.restricted <- lm(restricted.formula, data = dat)
# 1 additional year of education -> +3909$/year in salary. 
  