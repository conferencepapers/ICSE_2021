library(irr)
## To compute the IRR, we need an input data ("agrement.csv") that we pass to the function that call kappa
dat=read.csv("./agreement.csv",header=T)
intvscode=apply(dat,1,function(x){x[c(5:36)]}) #yields data frame with interviewees as rows (odd = r1, even = r2) and codes as columns
intvscode=apply(intvscode,c(1,2),function(x){as.numeric(x)}) #convert strings to numbers
## intvscode = as.data.frame(lapply(intvscode, as.numeric))
## print(intovscode[,14])
## print("=====")
intvscode_r1=intvscode[c(T,F),]
intvscode_r2=intvscode[c(F,T),]
## print(intvscode_r1[,14])
## print(intvscode_r2[,14])
## print(kappa2(data.frame(intvscode_r1[,14],intvscode_r2[,14]),"unweighted"))
## print("=====")

get_agreement=function(raterones,ratertwos,weight_scheme){
  res=c()
  for(i in c(1:ncol(raterones))){ #for each code, get kappa
    res=c(res,kappa2(data.frame(raterones[,i],ratertwos[,i]), weight_scheme)$value)
    ## print(dat[i,c(1:4)])
    ## print(kappa2(data.frame(intvscode_r1[,i],intvscode_r2[,i]), "unweighted")$value)
  }
  return(res)
}

## res=data.frame(dat[,c(1:4)],res)
intvscode=data.frame(unweighted=get_agreement(intvscode_r1,intvscode_r2,"unweighted"),equal=get_agreement(intvscode_r1,intvscode_r2,"equal"),squared=get_agreement(intvscode_r1,intvscode_r2,"squared"),dat)
## We write the output result of IRR to a `csv` file that we name: "agreement_with_kappa.csv"
write.csv(intvscode,"agreement_with_kappa.csv")
head(intvscode)
