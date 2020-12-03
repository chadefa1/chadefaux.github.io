y <- c(2,-1, 4, 3, 7)
x1 <- c(3.2,0.1, 1, 2, 8)
x2 <- c(5.2,3.6, 1, 1, 9)
X <- cbind(rep(1,length(y)),x1,x2)

lm1 <- lm(y ~ x1 + x2)
plot(x1,y)

#--- Find the predicted values yhat
# Compute hat matrix
hat <- X%*%solve(t(X)%*%X)%*%t(X)
# Calculate predicted values (y hat)
Haty <- hat%*%y
#check with canned function:
Haty
predict(lm1)

#--- Find residuals
# Compute residual maker
M <- diag(length(y)) - hat
# Compute the residuals:
My <- M%*%y
# check with canned results:
resid(lm1)

A <- matrix(rnorm(ncol(X)^2), nrow=ncol(X))
X <- X%*%A
hat%*%y #same results!
M%*%y # same results!
lm(y ~ X2)


