load("arizona2010.RData")
load("phoenix-exam.RData")
library(MASS)

par(oma=c(0,0,0,0))

rest = exam.rest
attach(rest)

#color = c("chartreuse", "chocolate", "brown", "cyan",
#					"darkorchid1", "deeppink", "darkgreen", "hotpink",
#					"limegreen", "orangered", "palegreen", "steelblue",
#					"yellow", "violetred")

color = c(1,2,3,4,5,6,7,8,"chocolate")

plotMap = function(string)
{
	plot(arizona.tract10, 
			 xlim=c(-112.4, -111.6),
			 ylim=c(33.2, 33.8),
			 #xlim=c(min(longitude), max(longitude)),
			 #ylim=c(min(latitude), max(latitude)),
			 col="beige", border="bisque4",
			 yaxt="n", xaxt="n")
	title(string)
	abline(v=c(-112.4, -112.2, -112, -111.8, -111.6), 
				 h=c(33.2, 33.35, 33.5, 33.65, 33.8), col="lightpink")
	axis(1, at=c(-112.4, -112.2, -112, -111.8, -111.6), 
			 labels=c(-112.4, -112.2, -112, -111.8, -111.6),
			 tick=F, line=F)
	axis(2, at=c(33.2, 33.35, 33.5, 33.65, 33.8), 
			 labels=c(33.2, 33.35, 33.5, 33.65, 33.8),
			 tick=F, line=F)
}

plotHeatMap = function(string, kde)
{
	plot(arizona.tract10, 
			 xlim=c(-112.4, -111.6),
			 ylim=c(33.2, 33.8),
			 #xlim=c(min(longitude), max(longitude)),
			 #ylim=c(min(latitude), max(latitude)),
			 col=image(kde, yaxt="n", xaxt="n", bty="n"), border="black",
			 yaxt="n", xaxt="n", bty="n")
	title(string)
}