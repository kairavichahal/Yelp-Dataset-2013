#######################################################################################
#Question 2
par(mfrow=c(1,2))

reviews.useful = kde2d(review_count, useful)
plot(review_count, useful, pch=16, cex=0.4, col=4,
		 main="Usefulness of Reviews in Restaurants in Phoenix",
		 xlab="Number of Reviews", ylab="Usefulness Rating")
contour(reviews.useful, add=T, lwd=2)
#abline(v=40, col="red")

reviews.funny = kde2d(review_count, funny)
plot(review_count, funny, pch=16, cex=0.4, col=3,
		 main="'Funny'ness of Reviews in Restaurants in Phoenix",
		 xlab="Number of Reviews", ylab="'Funny'ness Rating")
contour(reviews.funny, add=T, lwd=2)

dev.off()

#######################################################################################
#Question 3b
mexican = kde2d(longitude[Mexican==1], latitude[Mexican==1], n=100)

plotMap("Density of Mexican Restaurants in Phoenix")
contour(mexican, add=T, col="blue3", lwd=2)
points(longitude[Mexican==1], latitude[Mexican==1], col="green3", cex=0.5, pch=16)


pizza = kde2d(longitude[Pizza==1], latitude[Pizza==1], n=100)

plotMap("Density of Pizza Restaurants in Phoenix")
contour(pizza, add=T, col="red3", lwd=2)
points(longitude[Pizza==1], latitude[Pizza==1], col="green3", cex=0.5, pch=16)


#plotHeatMap("Density of Mexican Restaurants in Phoenix", mexican)
#points(longitude[Mexican==1], latitude[Mexican==1], col=4, cex=0.6, pch=16)
#contour(asianfusion, add=T, col="blue3", lwd=2)

#######################################################################################
#Question 3c
new.best = kde2d(longitude[rest[5]==1 & stars>4], latitude[rest[5]==1 & stars>4])
new.worst = kde2d(longitude[rest[5]==1 & stars<2], latitude[rest[5]==1 & stars<2])

plotMap("American (New) Restaurants in Phoenix\nby Rating (1 to 5 stars)")
contour(new.best, add=T, col="blue3", lwd=2)
contour(new.worst, add=T, col="red3", lwd=2)

points(longitude[rest[5]==1 & stars>4], latitude[rest[5]==1 & stars>4], col="blue3", cex=1.2, pch=16)
points(longitude[rest[5]==1 & stars<2], latitude[rest[5]==1 & stars<2], col="red3", cex=1.2, pch=16)
points(longitude[rest[5]==1 & stars>=2 & stars<=4], latitude[rest[5]==1 & stars>=2 & stars<=4], col="green3", cex=0.5, pch=16)

legend(-112.4, 33.35, col=c("blue3", "red3", "green3"), c("Best", "Worst", "Others"), pch=16, pt.cex=c(1.2, 1.2, 0.5))


trad.best = kde2d(longitude[rest[6]==1 & stars>4], latitude[rest[6]==1 & stars>4])
trad.worst = kde2d(longitude[rest[6]==1 & stars<2], latitude[rest[6]==1 & stars<2])

plotMap("American (Traditional) Restaurants in Phoenix\nby Rating (1 to 5 stars)")
contour(trad.best, add=T, col="blue3", lwd=2)
contour(trad.worst, add=T, col="red3", lwd=2)

points(longitude[rest[6]==1 & stars>4], latitude[rest[6]==1 & stars>4], col="blue3", cex=1.2, pch=16)
points(longitude[rest[6]==1 & stars<2], latitude[rest[6]==1 & stars<2], col="red3", cex=1.2, pch=16)
points(longitude[rest[6]==1 & stars>=2 & stars<=4], latitude[rest[6]==1 & stars>=2 & stars<=4], col="green3", cex=0.5, pch=16)

legend(-112.4, 33.35, col=c("blue3", "red3", "green3"), c("Best", "Worst", "Others"), pch=16, pt.cex=c(1.2, 1.2, 0.5))