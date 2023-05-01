pl<-ggplot(mtcars,aes(x=factor(cyl),y=mpg,fill=factor(cyl)))
pl+geom_boxplot()+theme_bw()