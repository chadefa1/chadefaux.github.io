# Compute variance covariance matrix of coefficients manually:
X <- cbind(const = rep(1,100), x= rnorm(100))
y <- X[,2] + rnorm(100)
lm1 <- lm(y ~ 1 + X[,2])

# calculate coefficients manually (because why not?)
solve(t(X)%*%X) %*% t(X)%*%y

# now calculate b's standard error manually
e <- resid(lm1)
ee <- (t(e) %*% e) / (100 - 2)
var.b <- as.numeric(ee) * solve(t(X)%*%X)
se.b <- sqrt(var.b)
se.b

#Compare to canned version 
summary(lm1)
