library(rgl)
BLOOD_PRESSURE=c(132,143,153,162,154,168,137,149,159,128,166)
AGE=c(52,59,67,73,64,74,59,61,65,70,72)
EXERCISE=c(10, 8, 6, 4, 5, 10, 1, 5, 5, 3, 9) 
fit=lm(BLOOD_PRESSURE ~ AGE + EXERCISE)
npp=10
plot3d(x=AGE,
       y=EXERCISE,
       z=BLOOD_PRESSURE,
       type="s",
       zlab="")
grd <- expand.grid(AGE=seq(min(AGE),max(AGE),length.out=npp),
                   EXERCISE=seq(min(EXERCISE),max(EXERCISE),length.out=npp) )
grd$pred <-predict(fit, newdata=grd)
persp3d(x=unique(grd[[1]]), y=unique(grd[[2]]), 
        z=matrix(grd[[3]],npp,npp),  color="lightgrey",alpha=0.7, lit=T, back="lines", add=TRUE)


