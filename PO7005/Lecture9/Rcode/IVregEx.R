library(foreign)
hsng2 <- read.dta("http://www.stata-press.com/data/r11/hsng2.dta")
#regress median monthly rents (rent) of census divisions on the share
#of urban population (pcturban) and the median housing value (hsngval)
#Housing values are likely endogeneous and therefore instrumented by median
#family income (faminc):

#--- OLS estimate:
lm.ols <- lm(rent ~ hsngval + pcturban, data=hsng2)
summary(lm.ols)

#--- IV estimation by 2SLS
#- first stage:
iv1 <- lm(hsngval ~ pcturban + faminc, data=hsng2)
x.hat <- fitted(iv1)
#- second stage:
iv2 <- lm(rent ~ pcturban + x.hat, data=hsng2)
summary(iv2)

#--- IV estimation, canned version, including heteroskedasticity corrected SEs
library(AER)
iv.canned <- ivreg(rent~hsngval+pcturban|pcturban+faminc,
      data = hsng2)
library(sandwich)
library(lmtest)
coeftest(iv.canned, vcov=sandwich)