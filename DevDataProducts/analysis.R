library(mlbench)
library(caret)
library(tree)
data(BostonHousing2)
set.seed(145)
inTrain <- createDataPartition(y=BostonHousing2$cmedv, p=0.7, list=FALSE)
training <- BostonHousing2[inTrain,]
testing <- BostonHousing2[-inTrain,]
#delete medv (predicting with adjusted cmedv), tract (year of data collection),
#and town name (as we have the longitude and latitude coordinates)
training <- subset(training, select = -c(medv, tract, town)) 
testing <- subset(testing, select =-c(medv, tract, town))

#Regression tree
treeMod = tree(cmedv ~., data = training)
summary(treeMod)
#used variables:
#"rm"    "lstat" "nox"   "crim" 
plot(treeMod)
text(treeMod ,pretty=0)
pred1 = predict(treeMod, newdata= testing)
mean((pred1 - testing$cmedv)^2)

#Random Forest
rfMod <- randomForest(cmedv ~., data = training)
pred3 = predict(rfMod, newdata= testing)
mean((pred3 - testing$cmedv)^2)
varImpPlot (rfMod)
importance (rfMod)

#Visualization
library(ggmap)
lstatq <- cut2(training$lstat, g = 5)
crimq <- cut2(training$crim, g = 5)
rmq <- cut2(training$rm, g = 5)
map <- get_map(location = c(lon = -71, lat = 42.2), zoom = 11, col = 'bw')
ggmap(map) + geom_point(aes(x = training$lon, y = training$lat, col=crimq,
                            shape = rmq,
                            size = round(training$cmedv), alpha = .5)) +
    scale_colour_discrete(name  ="Crime rate") +
    scale_shape_discrete(name ="Avg. number of rooms") +
    scale_size_continuous(name="Price of house") +
    scale_alpha_continuous(guide = FALSE) +
    theme(legend.position = 'left') +
    xlab("") + ylab("")
dev.copy(png, file = "plot1.png", width = 550, height = 550,
         bg="transparent")
dev.off()


