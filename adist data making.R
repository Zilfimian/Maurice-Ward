# Separating names with minimal distances

list_names <- list(0)

for( i in 1:nrow(mawb)){
  list_names[[i]] <- distname[i, distname[i,] < 3]
}
list_names

name_with_dist<-list(0)

#Creating names with distances only separately

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
#========================================
#finding indexes for countries
#=====================================
index <- list(0)

for(i in 1:length(list_names)){ # 7 lists
  for(j in 1:length(list_names[j])){
    
    index[i[j]] <-which(ad$AD_name == names(list_names[[i]][j]))
  }
}

index


indexes <- which(ad$AD_name == list_names[[1]][1] %>% names)
which(ad$AD_name == list_names[[1]][1] %>% names)[1]
 which(ad$AD_name == list_names[[1]][2] %>% names)][1]
 which(ad$AD_name == list_names[[1]][3] %>% names)[2]

indexes

names(list_names[1][1])
list_names[[1]][1] %>% names
list_names[[1]] %>% names

