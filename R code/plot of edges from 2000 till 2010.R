#Here we do the top 20 countries that have the most entities
entity$incorporation_year = as.integer(entity$incorporation_year)
Top50_countries = names(head(sort(table(entity$countries), decreasing = TRUE),51))[-4]
Top50_num_entity = as.integer(head(sort(table(entity$countries), decreasing = TRUE), 51))[-4]

#Names of Top 20 countries (#4 is Not Identifies)
Top20_countries = Top50_countries[1:20]
Entity20 = entity[(entity$countries %in% Top20_countries),]
Edges20 = edges[(edges$countries %in% Top20_countries),]

Top20_list = list()
#Store info of each country as a component of a list
for (i in 1:20) {
  subset_country = Edges20[(Edges20$countries == Top20_countries[i]),]
  Top20_list[[i]] = subset_country
}


#2000 till 2010
for (i in 2000:2000){
  for (c in 1:20) {
    ind_year = (Top20_list[[c]]$linkStart <= i) & (Top20_list[[c]]$linkEnd >= i)
    subset_year = Top20_list[[c]][ind_year,]
    
    index_1 = c(rep(NA, length(subset_year$node_1)))
    index_2 = index_1
    subset_year = data.frame(subset_year,index_1,index_2)
    
    subset_year$index_1 = match(subset_year$node_1, unique(subset_year$node_1))
    subset_year$index_2 = match(subset_year$node_2, unique(subset_year$node_2))
    subset_year$index_2 = sapply(subset_year$index_2, function(x) x+length(unique(subset_year$index_1)))
    
    library(igraph)
    g = graph.empty (directed = FALSE)
    g = add.vertices(g,length(unique(subset_year$index_1)), color = "green", type=rep(TRUE,length(unique(subset_year$index_1))))
    g = add.vertices(g,length(unique(subset_year$index_2)), color = "grey",type=rep(TRUE,length(unique(subset_year$index_2))))
    is.bipartite(g)
    
    plot(g)
    edges_add = as.vector(t(as.matrix(subset_year[,13:14])))
    gg = add.edges(g, edges_add)
    
    title = paste(Top20_countries[c]," ",as.character(i), sep = "")
    filename = paste(Top20_countries[c]," ",as.character(i),".jpeg", sep = "")
    jpeg(filename,width = 10000, height = 10000)
    cex.main = 1
    plot(gg,main = title)
    dev.off()
  }
}



