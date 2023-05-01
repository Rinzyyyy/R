v<-c(1,2,3,4,3,4,1,4)
n<-0
f<-function(x,v){
  for (va in v) {
    if (x == va){
      n<-n+1
    }
    #print(paste(va,n))
  }
  return(paste(x,n))
}

ff<-function(x){
   a<-(x%/%5)+1
   print(paste("5kg:",x%/%5))
   return(a)
   
}

fff<-function(var){
  sum<-0
  for (n in var){
    if(n%%3!=0){ 
      sum=sum+n
    }
  }
  return(sum)
}

Prime<-function(v){
  count<-0
  for(n in seq(2,v,1)){
    if (v!=n & v%%n==0){
      return("FALSE")
    }
  }
    return("TURE")
 
}

  
  
  
