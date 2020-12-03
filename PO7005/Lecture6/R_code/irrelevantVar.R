#--- Adding an irrelevant variable:
setwd('~/Documents/Academia/Teaching/TCD/2015-HT/PO7005_Quantitative_Methods_II/Lectures/lecture6/')
library(gdata)
dat <- read.xls('Data/xm501bwa.xls')

# Unrestricted model : 
unrestricted.formula <- SALARY ~ EDUC + SALBEGIN + GENDER + MINORITY
# model with irrelevant variable
irrelevant.var <- rnorm(nrow(dat))
irrelevant.formula <- SALARY ~ EDUC + SALBEGIN + GENDER + MINORITY + irrelevant.var


lm.unrestricted <- lm(unrestricted.formula, data = dat)
lm.irrelevant <- lm(irrelevant.formula, data = dat)
# We lost one degree of freedom, and all the SE have increased (though very slightly)
