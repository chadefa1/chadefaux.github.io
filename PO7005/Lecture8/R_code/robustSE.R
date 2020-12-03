n <- 3000
x <- rnorm(n, mean=3, sd=1)
X <- cbind(1, x)
y <- x  + x*rnorm(n, mean=1)
plot(x,y)

#--- First estimate the model using regular OLS
lm1 <- lm(y ~ x)
summary(lm1)
e <- resid(lm1)

# now calculate robust SE manually
bread <- solve(t(X)%*%X)
eprimee <- e%*%t(e)
# we need to remove the non-diagonal elements, as we assumed they are 0
eprimeediag <- diag(nrow(eprimee))
diag(eprimeediag) <- diag(eprimee)
meat <- t(X)%*%eprimeediag%*%X
# degrees of freedom correction:
dfc <- n/(n-ncol(X))
se.b <- sqrt(dfc*bread %*% meat %*% bread)
se.b

#--- Now calculate robust SE and associated t and p-values using canned function
library("sandwich")
library("lmtest")
se.b.canned <- sqrt(vcovHC(lm1)); se.b.canned

