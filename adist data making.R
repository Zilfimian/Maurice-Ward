
list_names <- list(0)

for( i in 1:nrow(mawb)){
  list_names[[i]] <- distname[i, distname[i,] < 3]
}
list_names

name_with_dist<-list(0)

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

for(i in 1:length(list_names)){
  mawb$distance <- unlist(name_with_dist)
}

mawb


