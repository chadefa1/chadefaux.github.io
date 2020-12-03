setwd('~/Documents/Academia/Teaching/TCD/2015-HT/POTBD_Quantitative_Methods_II/Lectures/lecture1/')
pdf('Figs/dependence.pdf')
par(mfrow=c(1,3), pty='s', paper='a4r')

#--- Linear dependence
plot(c(0,2), c(0,4), type='n', xlab='x1', ylab='x2', main = 'Linearly dependent vectors' )
# plot v2
arrows(0,0,2,4, col=2) 
# plot v1
arrows(0,0,1,2)
# add labels
text(x=0.5, y=1.2, labels="v1")
text(x=1.5, y=3.3, labels="v1", col=2)
cor(c(2,4), c(1,2))

#--- Linear Independence
plot(c(0,2), c(0,4), type='n', xlab='x1', ylab='x2', main='Linearly independent vectors' )
# plot v2
arrows(0,0,2,4, col=2) 
# plot v1
arrows(0,0,1,4)
# add labels
text(x=0.5, y=2.4, labels="v1")
text(x=1.5, y=3.3, labels="v1", col=2)
plot(c(2,1,4), c(1,1,4))



#--- Orthogonality
plot(c(-4,3), c(0,5), type='n', xlab='x1', ylab='x2' , las=1, main='Orthogonal vectors')
# plot v2
arrows(0,0,2,4, col=2) 
# plot v1
arrows(0,0,-4,2)
# add labels
text(x=-2, y=1.5, labels="v1")
text(x=1.3, y=1.4, labels="v2", col=2)
dev.off()
