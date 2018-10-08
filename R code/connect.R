##Pooled distribution

x = rep(NA, nrow(node1_officer))

#With this for loop, we extract the index when node1 changes, if doesn't change, left NA.
for(i in 1:(nrow(node1_officer)-1)){
  if(node1_officer$node_1[i+1] != node1_officer$node_1[i]){
    x[i] = i
  }
}

x = na.omit(x)
x[length(x)]
#The last node1 appears at 592078, with degree 5

#use y denote degree of each edges
y = rep(NA, length(x))
for(j in 2:length(x)){
  y[j-1] = x[j] - x[j-1] 
}
y[length(x)] = 5

summary(y)
sum(y != 1)/length(y)
sum(y != 1 & y != 2)/length(y)

##------------------By year---------------
yr_distribution = list()

for(k in 1970:2015){
  node_yr = subset(node1_officer, node1_officer$linkStart <= k & 
                     node1_officer$linkEnd >= k)
  
  x = rep(NA, nrow(node_yr))
  
  #With this for loop, we extract the index when node1 changes, if doesn't change, left NA.
  for(i in 1:(nrow(node_yr)-1)){
    if(node_yr$node_1[i+1] != node_yr$node_1[i]){
      x[i] = i
    }
  }
  
  x = na.omit(x)
  last_element = nrow(node_yr)-x[length(x)]
  
  #use y denote degree of each edges
  y = rep(NA, length(x))
  for(j in 2:length(x)){
    y[j-1] = x[j] - x[j-1] 
  }
  y[length(x)] = last_element
  yr_distribution[[k]] = y
}

yr_distribution2 = yr_distribution[-c(1:1969)]
names(yr_distribution2) = c(1970:2015)

mu_trend = sapply(yr_distribution2, mean)
plot(c(1970:2015),mu_trend, type = "l", main = "trend of mean", xlab = "year", ylab = "mean")

quantile(yr_distribution2$`1970`)
trend = sapply(yr_distribution2, quantile)
plot(c(1970:2015),trend[3,], type= "l")
plot(c(1970:2015),trend[4,], type= "l")
plot(c(1970:2015),trend[5,], type= "l")
