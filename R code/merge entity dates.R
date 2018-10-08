edges$node_2 = as.character(edges$node_2)
entity$node_id = as.character(entity$node_id)
entity$incorporation_date = as.character(entity$incorporation_date)
entity$inactivation_date = as.character(entity$inactivation_date)
edges$start_date = as.character(edges$start_date)
edges$end_date = as.character(edges$end_date)

edges$activdate = rep(NA, nrow(edges))
edges$deactivdate = rep(NA, nrow(edges))
edges$activyear = rep(NA, nrow(edges))
edges$deactivyear = rep(NA, nrow(edges))

for (i in 1:length(entity$node_id)) {
  pos = which(edges$node_2 == entity$node_id[i])
  edges$activdate[pos]= entity$incorporation_date[i]
  edges$deactivdate[pos] = entity$inactivation_date[i]
}
save(file = "data.Rdata")
