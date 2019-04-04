x <- c(2.1, 4.2, 3.3, 5.4)

x[c(3,1)]


order(distname[1,])

sort(distname[1,], decreasing = TRUE)<3

list_names <- list(0)

for( i in 1:nrow(mawb)){
  list_names[[i]] <- distname[i, distname[i,] < 3]
}
list_names

name_with_dist<-list(0)
#1
for(i in 1:length(list_names[[1]])){
   name_with_dist[i] <- paste(names(list_names[1])[i], as.vector(list_names[1])[i])
 }
 name_with_dist[1]
#2
 for(i in 1:length(list_names[[1]])){
   name_with_dist[i] <- paste(names(list_names[1])[i], as.vector(list_names[1])[i])
 }
 name_with_dist[1]
#3
 for(i in 1:length(list_names[[1]])){
   name_with_dist[i] <- paste(names(list_names[1])[i], as.vector(list_names[1])[i])
 }
 name_with_dist[1]
#4
 for(i in 1:length(list_names[[1]])){
   name_with_dist[i] <- paste(names(list_names[4])[i], as.vector(list_names[4])[i])
 }
 name_with_dist[1]
#5
 for(i in 1:length(list_names[[1]])){
   name_with_dist[i] <- paste(names(list_names[5])[i], as.vector(list_names[5])[i])
 }
 name_with_dist[5]
#6
 for(i in 1:length(list_names[[1]])){
   name_with_dist[i] <- paste(names(list_names[6])[i], as.vector(list_names[6])[i])
 }
 name_with_dist[6]
#7
 for(i in 1:length(list_names[[7]])){
   name_with_dist[i] <- paste(names(list_names[7])[i], as.vector(list_names[7])[i])
 }
 name_with_dist[7]

 
z=NULL
for(i in 1:length(list_names)){
  for(j in 1:length(list_names[[i]]))
    z[i]=1:length(list_names[[i]])
  }
z


 for(j in 1:length(list_names)) {#7, so we should have 7 list

  for(i in 1:length(list_names[[j]])){# every time different numbers
    name_with_dist[j[i]] <- paste(names(list_names[j])[i], as.vector(list_names[j])[i])
  }
}

name_with_dist

#Variant 1
 # for(i in 1:length(list_names[[1]])){
 #   name_with_dist[i] <- paste(names(list_names[1])[i], as.vector(list_names[1])[i])
 # }
 # name_with_dist[1]
#Variant 2
# This variant is more correct my it is hard to assign to data
# for(i in 1:length(list_names[[1]])){
#   name_with_dist[i] <- paste(names(list_names[[1]])[i], as.vector(list_names[[1]])[i])
# }
# name_with_dist[1]

cbind(mawb[1,], name_with_dist[1])


unlist(list_names[[1]][1])[1]

names(list_names[[1]][1])

unlist(list_names)[1]

as.vector(unlist(list_names[1])), c("A", "C")
baskets.nlist[grepl(“season”, names(baskets.nlist))]

list_names[grepl("Lusine", names(list_names))]

grepl("Lusine", list_names[[1]])

mawb
distname
