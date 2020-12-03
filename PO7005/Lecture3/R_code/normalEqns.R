#--- Input data
x = c(10, 42, 39, 30,80)
y = c(2,3,7,1,9)

#--- calculate b0 and b1 using the normal equations
numerator <- sum((x - mean(x))  *  (y - mean(y)))
denominator <- sum((x - mean(x))^2)
b1 <- numerator / denominator

b0 <- mean(y) - b1 * mean(x)
print(c(b0,b1))
