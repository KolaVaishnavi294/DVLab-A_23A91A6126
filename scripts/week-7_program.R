#load and understand the haireye color dataset
#load dataset
data(HairEyeColor)

#Check structure
str(HairEyeColor)
View(HairEyeColor)
?HairEyeColor

#very basic mosaic plot
mosaicplot(HairEyeColor)

#add titles and colors
mosaicplot(HairEyeColor,main="Mosai Plot: Hair,Eye Color and Sex",
           color=TRUE)

#Two variable mosaic plot
HairEye2D<-margin.table(HairEyeColor,c(1,2))
mosaicplot(HairEye2D,main="Hair vs Eye Color mosaic Plot",color=TRUE)

#mosaic plot by sex
par(mfrow=c(1,2))
mosaicplot(HairEyeColor[,,"Male"],main="male",color=TRUE)
mosaicplot(HairEyeColor[,,"Female"],main="Female",color=TRUE)
par(mfrow=c(1,1))

#Custom colors
mosaicplot(HairEye2D,col=c("brown","black","red","yellow"),
           main='hair vs Eye Color(Custom palatte')

#Advanced mosaic plot using 'vcd'
install.packages("vcd")
library(vcd)
mosaic(HairEyeColor,shade=TRUE,legend=TRUE,
       main="shaded mosaic Plot(vcd)")

#convert dataset to data frame(for ggplot)
hair_eye_df<-as.data.frame(HairEyeColor)
head(hair_eye_df)

#ggplot alternative(Proportional mosaic-style plot)
library(ggplot2)
ggplot(hair_eye_df,aes(x=Hair,y=Freq,fill=Eye))+
  geom_bar(stat="identity",position="fill")+
  facet_wrap(~Sex)+
  labs(
    title="Proportional Distribution of Eye Color by Hair",
    y="proportion")+
  theme_minimal()

#advanced mosaic with residual shading
mosaic(~hair+Eye+Sex,data=hair_eye_df,shade=TRUE,legend=TRUE)