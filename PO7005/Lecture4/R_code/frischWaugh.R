# Frisch-Waugh theorem
# Setup the data and model
x1 <- rnorm(100)
x2 <- rnorm(100)
b1 <- 2.1
b2 <- 5.3
e <- rnorm(100, sd=5)  
y <- b1*x1 + b2*x2 + e
X <- cbind(1, x1, x2)

# estimate regression the normal way:
b <- solve(t(X)%*%X) %*% t(X)%*%y
b

# estimate it the Frisch-Waugh way:
#1. first, reg y~x1 and get the residuals
X1 <- X[,1:2]
resid1 <- residuals(lm(y ~ X1))

#2. regress x2 on x1
X2 <- X[,c(1,3)]
resid2 <- residuals(lm(x2 ~ x1))

coef(lm(resid1 ~ resid2))[2]

# Just to make sure it's all correct:
lm1 <- lm(y ~ x1 + x2)
summary(lm1)


