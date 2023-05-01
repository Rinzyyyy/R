data<-mpg
data %>%
  mutate(legend=factor(drv,levels=c("f","4","r"))) %>%
  ggplot(aes(x=class,fill=legend))+
  geom_bar(position="dodge")+coord_flip()
pl<-ggplot(mpg,aes(x=class,fill=drv))
pl+geom_bar(position="dodge")+coord_flip()