library(ggplot2)
library(data.table)

df<-fread("/Users/xuan/R/Economist_Assignment_Data.csv",drop=1)

pl <-ggplot(df,aes(x=CPI,y=HDI,color=factor(Region)))
pl2 <-pl + geom_point(size=4,shape=1)
pl3 <-pl2+geom_smooth(method="lm",formula=y~log(x),se=F,color="red")

#指定標籤國家
pointlabel<-c("Russia","Venezuela","Iraq","Myanmar","Sudan","Afghanistan","Congo",
             "Greece","Argentina","Brazil","India","China","south Africa","spane",
             "Botswana","CapeVerde","Rwanda","France","Unite States","Germany",
             "Britain","Barbados","Noway","Japan","New Zealand","Singapore")

pl4 <-pl3 +geom_text(aes(label=Country),color="gray20",data=subset(df,Country %in% pointlabel),check_overlap = T)

#設定座標區間
pl4+scale_x_continuous(breaks = 1:10,limits = c(0.9,10.5))




