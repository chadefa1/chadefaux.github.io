#--- v1 and v2 linearly dependent:
v1 = c(1,2,3,4)
v2 = c(2,4,6,8)
v3 = rnorm(4)
v4 = rnorm(4)
A <- matrix(c(v1,v2,v3,v4), nrow=4)
solve(A)

#--- dummy variable version:
v1 = c(1,1,1,1)
v2 = c(1,0,1,0)
v3 = c(0,1,0,1)
A <- matrix(c(v1,v2,v3), nrow=4)
#now try to calculate (A'A) inverse
solve(t(A)%*%A)