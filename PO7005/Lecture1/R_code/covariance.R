n <- 100000

x <- rnorm(n) 
y <- x +rnorm(n) 
cov(x,y) # returns ~1

x <- x *2
y <- y *2
cov(x,y) # returns ~4

