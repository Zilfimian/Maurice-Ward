library(readxl)
library(stringr)

mawb <- read_excel("combo.xlsx", sheet = "MAWB")
ad <-  read_excel("combo.xlsx", sheet = "AD")
str(mawb)
str(ad)

mnc <- mawb$MAWB_name
head(mnc, 15)

mawb <- mawb[100,]
ad <- ad[100,]

apply(adist(x = mawb$MAWB_name, y = ad$AD_name), 1, which.min)
data.frame(string_to_match = mawb$MAWB_name, 
           closest_match = ad$AD_name[apply(adist(x = mawb$MAWB_name, y = ad$AD_name), 1, which.min)])





mnc1 <- NULL

wordcount <- function(x){
   sapply(strsplit(x, " "), length)
  }

mnc[10] == "domestic"

for (i in length(mnc)){
  if ( wordcount(mnc[i]) == 1 ) {
  mnc1[i] <- word(mnc[i], 1, sep=" ")
} else if ( wordcount(mnc[i]) == 2) {
  mnc1[i] <- word(mnc, 1, 2, sep =" ")
} else if ( wordcount(mnc[i]) == 3) {
  mnc1[i] <- word(mnc, 1, 2, 3, sep =" ")
} else if ( mnc[i] == "domestic") {
  mnc1[i] <- NA
} else {
  mnc1 <- mnc
}
}


head(mnc1, 15)
head(mnc, 15)

#mnc2 <- word(mnc, 2, sep=" ")
#mnc2 <- word(mnc, 3, sep=" ")

nw <- vector(length = length(mnc))

for(i in 1:10) {
  
  while ( word(mnc[i], 2, sep=" ")=!NA ){
    
  
  }

agrep( )  
agrep("laysy", c("1 lazy", "1", "1 LAZY"), max = 2, value = TRUE)
agrep("laysy", c("1 lazy", "1", "1 LAZY"), max = 2, ignore.case = TRUE)
  

x <- c("Lus", "Lusin", "Say")
y <- c("Lusine", "Saida sahakian", "Lusine Zilfimian" ) 

agrep(x[1], y, max = 2, value = TRUE)

agrep(x[1], y, max = 2, ignore.case = TRUE)


V1 <- c("pen", "document folder", "warn")
V2 <- c("copy folder", "warning", "pens")   
result <- sapply(V1, function(x) stringdist(x, V2, method = 'cosine', q = 1))
rownames(result) <- V2
result

apply(adist(x = V1, y = V2), 1, which.min)
data.frame(string_to_match = V1, 
           closest_match = V2[apply(adist(x = V1, y = V2), 1, which.min)])

apply(adist(x = V1, y = V2), 1, which.min)
data.frame(string_to_match = V1, 
           closest_match = V2[apply(adist(x = V1, y = V2), 1, which.min)])



