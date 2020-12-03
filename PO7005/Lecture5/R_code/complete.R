x <- c(1,2,3)
X <- cbind(1,x)
y <- c(2,4,5)
n <- length(x)
k <- 2
lm1 <- lm(y ~ x)

# First, calculate b:
XprimeXinv <- solve(t(X)%*%X)
Xprimey <- t(X)%*%y
b <- XprimeXinv %*% Xprimey

# Calculate se(b)
e <- y - X%*%b
s2 <- as.numeric(t(e)%*%e)/ (n-k)
se.b <- diag(sqrt(s2 * XprimeXinv))

# Calculate t-value and p-value
t.value <- b/se.b
p.value <- 2*pt(t.value, df=1, lower=FALSE)

# Calculate residual standard error
eprimee <- t(e)%*%e
sqrt(eprimee)

# calcualte R2
R2 <-  1 - (eprimee / sum((y - mean(y))^2))
R2.adj <- 1 - ((eprimee/(n-k)) / (sum((y - mean(y))^2)/(n-1)))

# Calculate F-statistic and p-value
RSS1 <- eprimee
lm2 <- lm(y ~ 1)
RSS2 <- sum(residuals(lm2)^2)
num <- (RSS2 - RSS1) / 1
denom <- RSS1 / 1
f <- as.numeric(num / denom)
pf(f, df1 = 1, df2=1, lower.tail=FALSE)

#calculate 95% confidence interval of b_1
b[2] + qt(0.975, df=n-2)*se.b[2]
b[2] - qt(0.975, df=n-2)*se.b[2]
#check: 
confint(lm1)


# Predict y^0 for x^0  = 0, and calculate confidence interval and prediction interval
x0 <-  matrix(c(1,0), nrow=2)
yhat0 <- t(x0)%*%b 
var.b <- s2 * XprimeXinv
se.e0 <- sqrt(s2/(n-k) + t(x0)%*%var.b%*%x0)
x0varbx0 <- sqrt(t(x0)%*%var.b%*%x0)
t <- qt(0.975, 1)
pi.home.made <- c(yhat0 -t*se.e0, yhat0 +t*se.e0)
ci.home.made <- c(yhat0 -t*x0varbx0, yhat0 +t*x0varbx0)
#check
predict(lm1, newdata=data.frame(x=0), interval = 'predict')
predict(lm1, newdata=data.frame(x=0), interval = 'confidence')




