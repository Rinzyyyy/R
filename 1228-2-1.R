pl<- ggplot(mtcars,aes(x=wt,y=mpg,size=hp,color=cyl))
pl+geom_point(shape=1)+
  scale_color_gradient(low="red",high="green")+
  ggtitle("cars")+xlab("wt")+ylab("mpg")+
  geom_text((aes(label=gear)))+
  geom_smooth(method="lm",se=F,size=1.2,color="purple")