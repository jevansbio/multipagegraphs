Multipagegraph=function(dataf,cat1,cat2,idvar,graphcode,numcols=3,numrows=5,marvals=c(3.7, 3.6, 2.5, 1) + 0.1,startpage=1,filename="indivplots.pdf"){
	notdup=!duplicated(idvar)

	convar=dataf[,which(sapply(dataf2,is.numeric))[1]][notdup] # just get any continuous variable

	totals=aggregate(convar~cat1[notdup]*cat2[notdup],FUN=length)
	totals$pagenums=ceiling(totals[,3]/(numcols*numrows))#number of pages required for each category

	defaultoptions=pdf.options()
	currpagenum=startpage-1
	pdf(file=filename,width=8.27,height=11.69)
	for(k in unique(cat1)){
		for (j in unique(cat2[cat1==k])){
			dataf2=dataf[cat2==j&cat1==k,]
			idvar2=idvar[cat2==j&cat1==k]
			idvar3=as.factor(as.character(idvar2))
				levels(idvar3)=c(1:length(unique(idvar3)))
				idvar3=as.numeric(idvar3)
				dataf2=dataf2[order(idvar3),]
			idvar3=idvar3[order(idvar3)]
				currbreaks=seq(0,totals$pagenums[totals$cat1==k&totals$cat2==j]*(numcols*numrows),(numcols*numrows))
				pagenum=cut(idvar3,currbreaks)
			levels(pagenum)=1:length(levels(pagenum))
			pagenum=as.numeric(pagenum)
			for (currpage in 1:max(pagenum)){
					currpagenum=currpagenum=currpagenum+1
				while(!par('page')){
					plot.new()

				}
				par(mfrow=c(numrows,numcols),mar=marvals,omi=c(0.4,0.5,0.5,0.5))
				for (i in 1:length(unique(idvar2[pagenum==currpage]))){
					currindiv=unique(idvar2[pagenum==currpage])[i]
					currd=dataf2[idvar2==currindiv,]
					eval(parse(text=graphcode))
					mtext(currindiv,side=3,adj=1,cex=0.5)
						if(i==2){
							text(3,11.5,paste(j,k),xpd=T,cex=1.75)
							mtext(currpagenum,side=1,padj=77)
						}
				}

			}
		}
	}

	dev.off()
	return()
}
