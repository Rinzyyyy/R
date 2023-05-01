df<-read.csv("/Users/xuan/R/student-mat.csv",sep=";")

#預測G3成績
Num.col<-sapply(df,is.numeric)

#相關係數data-df[row,colum]
cor.data<-cor(df[,Num.col])

library(corrgram)
library(corrplot)

corrplot(cor.data,method = 'color')
corrgram(df,order=T,upper.panel=panel.shade,lower.panel=panel.pie,text.panel=panel.txt)

#G3
pl<-ggplot(df,aes(x=G3))
pl+geom_bar()

library(caTools)
sample<-sample.split(df$G3,SplitRatio = 0.7)
train<-subset(df,sample==T)
test<-subset(df,sample==F)

#train
model<-lm(G3~.,data=train)
summary(model)

#殘差表現
res<-residuals(model)
ress<-as.data.frame(res)
ppl<-ggplot(ress,aes(res))
ppl+geom_histogram(fill="blue",alpha=0.5)

#predic
G3.prediction<-predict(model,test)
result<-cbind(round(G3.prediction,0),test$G3)
colnames(result)<-c("pred","real")
result


#誤差
result<-as.data.frame(result)
mse<-mean((result$real-result$pred)^2)

remse<-mse^0.5

#R value
SSE<-sum((result$pred-result$real)^2)
SST<-sum((mean(df$G3)-result$real)^2)
R2<-1-SSE/SST
R2

