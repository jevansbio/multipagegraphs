testdata=data.frame(cat1=rep(c("A1","B2"),c(90,110)),cat2=rep(c("A","B","C","D"),c(80,50,40,30)),var1=rnorm(200),var2=rnorm(200))
testdata$id=paste(testdata$cat2,unlist(sapply(c(80,50,40,30),function (x) sample(c("AA","BB","CC","DD","EE","FF","GG","HH","II","JJ","KK","LL","MM","NN"),x,replace=T))))
testdata2=data.frame(cat1=rep(c("B1","A2"),c(90,110)),cat2=rep(c("A","B","C","D"),c(80,50,40,30)),var1=rnorm(200),var2=rnorm(200))
testdata2$id=paste(testdata2$cat2,unlist(sapply(c(80,50,40,30),function (x) sample(c("AA","BB","CC","DD","EE","FF","GG","HH","II","JJ","KK","LL","MM","NN"),x,replace=T))))
testdata3=data.frame(cat1=rep(c("C1","D2"),c(90,110)),cat2=rep(c("A","B","C","D"),c(80,50,40,30)),var1=rnorm(200),var2=rnorm(200))
testdata3$id=paste(testdata3$cat2,unlist(sapply(c(80,50,40,30),function (x) sample(c("AA","BB","CC","DD","EE","FF","GG","HH","II","JJ","KK","LL","MM","NN"),x,replace=T))))
testdata4=data.frame(cat1=rep(c("C1","C1"),c(90,110)),cat2=rep(c("E","F","G","H"),c(80,50,40,30)),var1=rnorm(200),var2=rnorm(200))
testdata4$id=paste(testdata4$cat2,unlist(sapply(c(80,50,40,30),function (x) sample(c("AA","BB","CC","DD","EE","FF","GG","HH","II","JJ","KK","LL","MM","NN"),x,replace=T))))
testdata5=data.frame(cat1=rep(c("D2","D2"),c(90,110)),cat2=rep(c("H","I","J","K"),c(80,50,40,30)),var1=rnorm(200),var2=rnorm(200))
testdata5$id=paste(testdata5$cat2,unlist(sapply(c(80,50,40,30),function (x) sample(c("OO","PP","QQ","RR","SS","TT","UU","VV","WW","XX","YY","ZZ"),x,replace=T))))

testdata=rbind(testdata,testdata2,testdata3,testdata4,testdata5)
testdata$id=paste(testdata$id,testdata$cat1)

numcols=3;numrows=5 #number of plots on a page - trying to push beyond these default values will likely require fiddling with the margin values
dataf=testdata # dataframe of data to be plotted
cat1=testdata$cat1 #first separator varible, used to organise position of graphs on pages
cat2=testdata$cat2 #second separator variable, assumed to be nested within cat1.
idvar=testdata$id #the individual identifier, each will be a separate graph
graphcode="plot(var1~var2,data=currd);lines(var1~var2,col='blue',data=currd)" # this can be any sort of plot, have attemped to make the code generic using this method, but you could also go in and modify the loop! Important thing is that the data is set to currd - the individual subset of dataf generated within the code

Multipagegraph(dataf,cat1,cat2,idvar,graphcode,numcols=3,numrows=5)
