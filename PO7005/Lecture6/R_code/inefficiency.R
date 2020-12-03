library(rgl)

n <- 100
x <- rnorm(n)
y <- x + rnorm(n, sd=0.1)
z <- x+y + rnorm(100, sd=1)



cor(x,y)
pairs(~z+x+y, lower.panel=NULL)
plot3d(x, y, z, col="red", size=20)

lm1 <- lm(z ~ x + y)
summary(lm1)
planes3d(a=lm1$coefficients[2], b=lm1$coefficients[3], c=-1 , d= lm1$coefficients[1], alpha=0.3)
planes3d(a=lm1$coefficients[3], b=lm1$coefficients[2], c=-1 , d= lm1$coefficients[1], alpha=0.3, col=3         )


