#--- Input data
x0 = c(1,1,1,1,1)
x1 = c(10, 42, 39, 30,80)
X <- cbind(x0,x1)
y = c(2,3,7,1,9)

# Calculate (X'X)^{-1}X'y
XprimeX <- t(X)%*%X
XprimeXinverse <- solve(XprimeX)
Xprimey <- t(X)%*%y

XprimeXinverse %*% Xprimey

# or the equivalent, in one line:
solve(t(X)%*%X) %*% t(X)%*%y
