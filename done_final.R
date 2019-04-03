# The needed libraries, setting the workplace directory.

library(readxl)
library(stringr) # adist
library(utils)
library(fuzzywuzzyR) #
getwd()
setwd("C:/Users/MWC/Desktop")


# Loading the files
mawb <- read_excel("combo.xlsx", sheet = "MAWB")
ad <-  read_excel("combo.xlsx", sheet = "AD")

unique(mawb$MAWB_name)
#Understand the stucture of data

str(mawb)
str(ad)
library(stringr)
mawb$MAWB_name <- str_replace_all(mawb$MAWB_name, "NONE", "-")
mawb$MAWB_name <- str_replace_all(mawb$MAWB_name, "domestic", "-")

library(stringr)

#library(openNLP)
?grep

?regexpr
?sub
grep("a+", c("ab", "ded", "cba a", "aa"))

grep("a+", C("ab", "ded", "cba a", "aa"), perl = TRUE)

grep("a+", c("ab", "ded", "cba a", "aa"), value = FALSE)

grep("a+", c("ab", "ded", "cba a", "aa"), value = TRUE)

grep("a+", c("ab", "ded", "cba a", "aa"), perl = TRUE, value = FALSE)
grep("a+", c("ab", "ded", "cba a", "aa"), perl = TRUE, value = TRUE)

grepl("a+", c("abc", "def", "cba a", "aa"), perl=TRUE)

regexpr("a+", c("abc", "def", "cba a", "aa"), perl=TRUE)
gregexpr("a+", c("abc", "def", "cba a", "aa"), perl=TRUE)

x <- c("abc", "def", "cba a", "aa")
 m <- regexpr("a+", x, perl=TRUE)
 regmatches(x, m)
 m <- gregexpr("a+", x, perl=TRUE)
 regmatches(x, m)

 
tolower(mawb$MAWB_name)
toupper(mawb$MAWB_name) 
paste("a", "b", sep = " and ") 
str_split("a!b", "!")[[1]]  #splitting character gets deleted

grep("\\!","a!b")

out<-NULL
for (i in length(mawb$MAWB_name)) {
  out<- grep("\\see under", mawb$MAWB_name[i])
  
}
out

str_replace_all("mawb$MAWB_name see under something", "see under$","")
str_extract_all("my_string 0 9 11","[0-9]+")

str_extract_all("mawb$MAWB_name see under something", "see under")

Clean_String <- function(string){
  # Lowercase
  temp <- tolower(string)
  # Remove everything that is not a number or letter (may want to keep more 
  # stuff in your actual analyses). 
  temp <- stringr::str_replace_all(temp,"[^a-zA-Z\\s]", " ")
  # Shrink down to just one white space
  temp <- stringr::str_replace_all(temp,"[\\s]+", " ")
  # Split it
  temp <- stringr::str_split(temp, " ")[[1]]
  # Get rid of trailing "" if necessary
  indexes <- which(temp == "")
  if(length(indexes) > 0){
    temp <- temp[-indexes]
  } 
  return(temp)
}

m1 <- gsub( pattern = "\\W", replace = " ", mawb$MAWB_name)#cleaning all marks you do not need to
#removing numbers
m2 <- gsub( pattern = "\\d", replace = " ", m1)
m2

tolower(m2)
install.packages("tm")
library(tm)
stopwords()
removeWords( x = mawb$MAWB_name, words = stopwords()) # remo
class(gsub( pattern = "\\b[A-z]\\b{1}", replace = " ", mawb$MAWB_name))

#cleaning extra spaces

stripWhitespace(mawb$MAWB_name)

install.packages("wordcloud")
library(wordcloud)
match (mawb$MAWB_name, negwords)
wordcloud(mawb$MAWB_name)
wordcloud(mawb$MAWB_name, min.freq = 50)
poswords

scan(mawb$MAWB_name, what = "character", comment.char = ";")

# mawb$MAWB_name <- word(mawb$MAWB_name,1)
# ad$AD_name <- word(ad$AD_name, 1)
# head(ad$AD_name)
# To make sure we are dealing with charts
typeof(ad$AD_name)
typeof(mawb$MAWB_name)


## It creates a matrix with the Standard Levenshtein distance between the name fields of both sources
dist.name<-adist(mawb$MAWB_name, ad$AD_name, partial = TRUE, ignore.case = TRUE)

View(dist.name)

# We now take the pairs with the minimum distance
min.name<-apply(dist.name, 1, min)
View(min.name)
match.s1.s2<-NULL  



for(i in 1:nrow(dist.name))
{
  s2.i<-match(min.name[i],dist.name[i,])
  #stex avelacnel naxord syunery
  s1.i<-i
  match.s1.s2<-rbind(data.frame(s1.i=s1.i, s2.i=s2.i, s1name=mawb[s1.i,]$MAWB_name, s2name=ad[s2.i,]$AD_name, s2number=ad[s2.i,]$AD_account_number, adist=min.name[i]),match.s1.s2)
  
}
# and we then can have a look at the results
View(match.s1.s2)
typeof(match.s1.s2)
library(xlsx)
write.csv(x = match.s1.s2, "Final_data1.csv")

