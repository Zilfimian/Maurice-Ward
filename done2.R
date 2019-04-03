# The needed libraries, setting the workplace directory.

library(readxl)
library(stringr) # adist
library(utils)
library(fuzzywuzzyR) #

# Loading the files
mawb <- data.frame( county = c("A", "A", "B", "C", "C", "A", "B"),
                    name = c( "Lusone", "Z Dabid", "Lusine", "Lus", "David", "Par", "s Paramdajem")
                    )

ad <- data.frame( adcounty = c("A", "A", "B", "C", "C", "A", "B"),
                   adname = c( "Lusine", "David", "Lusne", "Lusine", "Dad", "Pari", "s Paem"))

ad <- ad[order(ad$adcounty),]

mawb$county <- as.character(mawb$county)
mawb$MAWB_name <- as.character(mawb$name)
ad$adcounty <- as.character(ad$adcounty)
ad$AD_name <- as.character(ad$adname)
#Understand the stucture of data

str(mawb)
str(ad)

# To make sure we are dealing with charts
typeof(ad$AD_name)
typeof(mawb$MAWB_name)


## It creates a matrix with the Standard Levenshtein distance between the name fields of both sources
dist<-adist(mawb$MAWB_name, ad$AD_name, partial = TRUE, ignore.case = TRUE)
View(dist)

distname<-dist

colnames(distname) <- ad$AD_name 
rownames(distname) <- mawb$MAWB_name  
View(distname)

#==================================================================
for(i in nrow(dist)){
  for(j in ncol(dist)){
    if( dist[i,j] < 5 ){
      dist2[i,j]<-adist(mawb$county[i], ad$adcounty[j], partial = TRUE, ignore.case = TRUE)
      
    }else{
      dist2[i,j] <- "NaNmy"
      
    }
  }
}


View(dist2)

#=================================================================


dist2<-adist(mawb$county, ad$adcounty, partial = TRUE, ignore.case = TRUE)
View(dist2)
distname2<-dist2
colnames(distname2) <- ad$adcounty 
rownames(distname2) <- mawb$county  

#==========================


# We now take the pairs with the minimum distance

minname<-apply(distname, 1, min)
View(minname)

match.s1.s2<-NULL  
for(i in 1:nrow(dist))
{
  s2.i<-match(minname[i],dist[i,])
  #stex avelacnel naxord syunery
  s1.i<-i
  match.s1.s2<-rbind(data.frame(s1.i=s1.i, s2.i=s2.i, s1name=mawb[s1.i,]$MAWB_name, s2name=ad[s2.i,]$AD_name, s2number=ad[s2.i,]$AD_account_number, adist=minname[i]),match.s1.s2)
  
}
# and we then can have a look at the results
View(match.s1.s2)

