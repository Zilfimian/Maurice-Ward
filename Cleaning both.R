library(readxl)
library(stringr) # adist
library(utils)
library(fuzzywuzzyR) #
getwd()
setwd("C:/Users/MWC/Desktop/Work done")


# Loading the files
mawb <- read_excel("combo.xlsx", sheet = "MAWB")
ad <-  read_excel("combo.xlsx", sheet = "AD")
unique(mawb$MAWB_name)
#Understand the stucture of data

str(mawb)
str(ad)

library(stringr)
library(tm)

cleaning <- funcrion(x){
  x <- str_replace_all(x, "NONE", "-") # "remove" None's names
  x <- str_replace_all(x, "domestic", "-") # "remove" domestic's names
  x <- tolower(x) # make all cases lower
  x <- str_to_title(x) # make first letters uppercase
  x <- str_squish(x) # remove spaces
  x <- gsub("see under","",x) # remove all after this word
  x <- gsub("Pvt","",x) # remove all after this word
}



mawb$MAWB_name <- str_replace_all(mawb$MAWB_name, "NONE", "-") # "remove" None's names
mawb$MAWB_name <- str_replace_all(mawb$MAWB_name, "domestic", "-") # "remove" domestic's names
mawb$MAWB_name <- tolower(mawb$MAWB_name) # make all cases lower
mawb$MAWB_name <- str_to_title(mawb$MAWB_name) # make first letters uppercase
wordsafter <- c("Pvt", "Pte", "Llp", "Ltd", "Wll", "Jlt", "Int", "Pp", 
               "Sa", "Pty","Limited", "Gmbh", "Au ", "M Sdn", "S De",
               "Bv ", "Et Cie", "Hk ", "Jsc", "Lll", "Sl ", "Sarl", "Sac",
               "Sae", "Sal", "Ltda", "See Under", "Was", "Formerly", "Inc")
mawb$MAWB_name <- gsub("Ltd","",mawb$MAWB_name) # remove all after this word

mawb$Mawb_name <- removeWords(x = mawb$MAWB_name, words = stopwords()) # removing stopwords
mawb$MAWB_name <- str_squish(mawb$MAWB_name) # remove spaces



mawb$MAWB_name



