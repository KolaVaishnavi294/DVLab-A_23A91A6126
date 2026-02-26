#load and understand the dataset
data(diamonds)
data(package=.packages(all.available=TRUE))
library(ggplot2)
data(diamonds)
str(diamonds)
dim(diamonds)
?diamonds

#verify basic scatter
plot(diamonds$carat,diamonds$price)

#improved scatter
plot(diamonds$carat,diamonds$price,col=rgb(0,0,1,0.1),pch=16,
     main="Scatter Plot:Carat vs price")

#hexbin using base r
install.packages('hexbin')
library(hexbin)
hb->hexbin(diamond$carat,diamond$price,xbins=40)
plot(hb,main="Hexbin Plot")

#Basic Hexbin
ggplot(diamonds,aes(x=carat,y=price))+geom_hex()